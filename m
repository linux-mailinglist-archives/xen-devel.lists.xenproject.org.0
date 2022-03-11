Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCA4D6196
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 13:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289017.490292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeQ9-0000rv-Ff; Fri, 11 Mar 2022 12:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289017.490292; Fri, 11 Mar 2022 12:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeQ9-0000pF-By; Fri, 11 Mar 2022 12:31:01 +0000
Received: by outflank-mailman (input) for mailman id 289017;
 Fri, 11 Mar 2022 12:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSeQ8-0000p9-1A
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 12:31:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa5b973-a137-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 13:30:58 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-lJTUeyJiO-eMT2iLBWXAzA-1; Fri, 11 Mar 2022 13:30:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3633.eurprd04.prod.outlook.com (2603:10a6:208:c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 12:30:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 12:30:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1aa5b973-a137-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647001858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1MNd096C8fKQZi4xn5Oe60BodAFGo4UDI3yEvFOLPk=;
	b=Yrmi7e24ks2ilE9bX5E+HUiBpv4KAJN6V+hbME88RhLdaKsPHwEXjkpz9nPIeK1E2f7kjf
	0EspnY6pHXYTaIHlKrjUWkavKynoNvyaLGaoUtR7NPV6cBsfoVv0jHO+ZEqbVS5EQcP23y
	9vXViiNm0tNgIacDneLJmyg2ntN/Mz8=
X-MC-Unique: lJTUeyJiO-eMT2iLBWXAzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZNPw964XH14zYF6wt1NxpxsVoplEsAoNm+XsO9vc6iDkw4a1PifV/gPEDLaEHh6byBVyEPkoX/8gnE3X4fwEsgO5gmGROYrMjQgW/dxrPsQ6jtDptEzJFkxQ0JwH1JsTmhmdhReml3eEOXDv/uUW9D7hCrRIuzVSxqDaToT55ke85ttSpiKB/bOj0rJw8txqTBpabfwVsSqbceYTDakJ6qp4zvL6gjzXYnXi7NfNRvM61+LRiRisnls9Wz3dq+fsnuw06239mI5BZCxvPmK43ARxDdGrl20Tr8XXC/RAwNQqvcgdkQPZErdqKRiBf9wC+P6cmaRy8BS/juWCfSu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ehG6zKVsTFwvNcCOOtzFk9BpNnW17evCWMJKGkeAmw=;
 b=MjfkiS4aA17J+1TDGBdShM9UvIdPrn/PVAYPgqvWnVSJBIWMhfT8xUL/K96KUrdqhnyqyM366zjoYqJCqk0qPTsycr6ROOEyOUYklYWVXe6EEVrv6D0LD1pGFwXG5uvGtELE3WVTt6GeBGHR/sIi2snn7e6s/7qeFED56SV9cM1DcNWIKfCSsVmVtd1uQgIn3x7wd9Q7qtzN+00rhMzhledUdYVWEDWkKsppvvDeQBpO1r3Kc+z4tNhZBVV0rmGhZalOOlE799P0tJUbWnc825C2ksmXhec1js+mZsyqOuknT1dNfR7iJW1oLSMyyYSUkEIq1V7PdEQJM7rrG/0Grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ec142df-0023-d105-4c96-3b42a198a8df@suse.com>
Date: Fri, 11 Mar 2022 13:30:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/4] x86/time: further improve TSC / CPU freq
 calibration accuracy
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <65c123fe-c8e7-b9cf-4dea-904bf28170a7@suse.com>
 <Yis6nrchuvzagfOb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yis6nrchuvzagfOb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4852a1e-6591-4077-d484-08da035afd07
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3633:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB36338A5E4BCB95B3B83C07AFB30C9@AM0PR0402MB3633.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLXPTzyPDehgLd8fEAdp9VSMZMqXpluVVn8BRCivaVP+vQwFw6jbhnGqVo48GEPJ++5TIFyvgdkI8kYcecJRBNOiBOZspkZQhHlQqqbIIfgca1OCQwOUTh+ALy7Gqbyilp23y7qw+QOH0pe8WP57iAAjJpYA8BHOP6YIhYCr2CrOrvisAFFuM48MtwSnuQPf0/VnYjWRc3RfZI8lid9oWDDgNe/aOmzI5hv87GSNWFQy4AqLo5j/C5K/uMOzbDtopxCcOVhBM/Ch7LyWHSgsIFzIqNfX6AILFnSOID9ocGxbVpf3ztjQwc/32vk7rGajkA7ptorSTHl+mXWFMBG75L9Aya5na41Zr12we2d8Iz00Z6uGIr0wNaIgdAVHOrWwzkeVo8MYjjbG+Q2SGKgwKiaVFowqClO/YknngZrGqAFGQKRfNK6KgmVgXkdf8z3kHc8gmvsiThmxyU4BNc9SmJfuzgQ1A2nNaaOcrsRnPBX3xCyALvjQ4IkYdwL/85ts56Ev6aeBGWFpXt28fzI8teAM6oWJ/6KjRMnx3s/FdE3KWXo7TZkA6cnucja+tmguf4rP/OnI1Q9AgRyYtahVF2YkElrqQuhSAMX7Ebq4vs5vpaIi06wVC3KpWZFnJY4kTkrQIFwqh4ZX+6kJ3QDvIBRZcELJ15/Dtvi56f073kc7zEXMRu14aYWgm8ZOs1+a/r8U7TuL+z+cB/whXwEgmMo0UeTdxFiyOcCrBY/DY9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(83380400001)(508600001)(54906003)(5660300002)(8936002)(6506007)(6512007)(53546011)(2906002)(8676002)(66946007)(66556008)(66476007)(4326008)(26005)(2616005)(186003)(86362001)(38100700002)(36756003)(31696002)(316002)(31686004)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSTn98ql0BHGEbO92hb/RgJ2MDXh85wC+0lEymSrM6GRdsyAMjzwmYLNQsZ9?=
 =?us-ascii?Q?Rci5fs2Aew99OMWmwsUyzEpzhYNGo+cn/tKUK+t3cQZNuru5O8Wc6C/jWpxh?=
 =?us-ascii?Q?XnFDfMZ50+qobjQwP3C1jo357vHY83siq77wdE9PEL90DqMIxjdVX7yoN3sN?=
 =?us-ascii?Q?nyWDoyOCHUePJIIQmntf3hIo2hY+xeAUCgpf6rRd9NT0u1P5+PrpytCwR+tT?=
 =?us-ascii?Q?axnzOnPOqARfeUjvxgi7tGBtyMQGAaShfpIa6l5+vsvuqJXrhkyE0LbbN6gg?=
 =?us-ascii?Q?2LbfAwD42QsnSvVIrxTthjTaBgJX53VA4utMKHI06nrQlsrRt8D24tiDSam0?=
 =?us-ascii?Q?Wo2cM6lzM3ZklxUv31Nh5HPnVKGynF3ji0+hJepQYI1b6464Rg1CITCHzWdi?=
 =?us-ascii?Q?ryTVzi0jtV5hyrx70iKRPRYUxQa3TEv0Csdp4XPd526KOZ52Ee01803/mQ7r?=
 =?us-ascii?Q?i6mhMjSpgob8s4kcXSaVPOBYIVsy2R9u0gDnL83tnzDTSbVHNFGKy3W9FKai?=
 =?us-ascii?Q?VcQkSkjf2scjRBUNw9qdnbajanfgQ/exfRCBdFI0hnvrh/R+tilpbh5OrF0Q?=
 =?us-ascii?Q?d9oIQySQMcevPiw0yEosj9VVcl7hjoTpxMts6p06N85IiDASlXliEJfqj9+E?=
 =?us-ascii?Q?l+gXA0I5itjuJqJnE0IxzG4J/qD8vt8h8qUMlasxBif4ic2Jw8P7FsJAs3ml?=
 =?us-ascii?Q?lJqC2LD3ASbznfMuKEuDJ2mjB+Avb5AZZ2R+MeTPowIBZ+zfnTlphu+5/jrL?=
 =?us-ascii?Q?c0NgsTbsSQ3VaL9daXG2im7iaxjbZ54Da1pdEEg3xxe3+rqpTXrxOB8zQ+Ih?=
 =?us-ascii?Q?ExD3k6LtvIUGAtjhSB1w7tUj/dFhV5RH4z2LLCLvwDbC+lDd5E4Zdi9idy3Q?=
 =?us-ascii?Q?VSRz3wrEBKPVxRes/+fn88j8XYU4DmUbrBrv59SHOZVOm1WO/qtczLWxUliA?=
 =?us-ascii?Q?A3zpMSa+AgUHft3UULjdyStJvRKX+nhdgvxXMlrl18kdDOLbhwSVEomQR/fl?=
 =?us-ascii?Q?SLOjSo+k6CZTvngw6u8m7QQh7U8m7e+xWPPZuXEtrASWOh+izp+XmcTK28Ma?=
 =?us-ascii?Q?l+a+nj/U2OnMbKI+4WZHBQf/XPih4RMX2pu6coAIu2nrEK0jSIXPVZr+kPpG?=
 =?us-ascii?Q?vz7tU3i/TPm8sGHT9rcK/c93KFmLZ2C+PBlU/Wlmue8vXHvjPDZNXX0IP26h?=
 =?us-ascii?Q?ML3JSPbnHVjpRgJhmNRYcvnuNxidswtawogjEFR66vhjpyLYXSkFYx3+nouk?=
 =?us-ascii?Q?JeY4ID+rHGKQiBGIOb8ZEuZnXcZV/hodofAOhNlzu3xikWif0+q/foEG+anP?=
 =?us-ascii?Q?zEZNiDyoOXhxSAxSBhG/XRm44RVCKjL1lXiulu2i3eQzd5/XqOZ4Bp+aRkvs?=
 =?us-ascii?Q?nMtEc49TvxbBpbFzD8iZdETkZ4Mez+K4VJR5G7IyxcE28+TTlx+YRKEv0Ysq?=
 =?us-ascii?Q?kH9aJmI+ApbzWkK7FOe/orpnr0WBZH99?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4852a1e-6591-4077-d484-08da035afd07
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 12:30:55.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUIVLTFPCnApBodl0nfwIl0eEmr7zz8WUnJDsbaIkexugkGWqriRcvuf0BvvsgDtl+z4zQHzm0TqYtxj+B2u0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3633

On 11.03.2022 13:03, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 10:24:49AM +0100, Jan Beulich wrote:
>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>> timer) and the TSC are read at about the same time. This assumption may
>> not hold when a long latency event (e.g. SMI or NMI) occurs between the
>> two reads. Reduce the risk of reading uncorrelated values by doing at
>> least four pairs of reads, using the tuple where the delta between the
>> enclosing TSC reads was smallest. From the fourth iteration onwards bail
>> if the new TSC delta isn't better (smaller) than the best earlier one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> When running virtualized, scheduling in the host would also constitute
>> long latency events. I wonder whether, to compensate for that, we'd want
>> more than 3 "base" iterations, as I would expect scheduling events to
>> occur more frequently than e.g. SMI (and with a higher probability of
>> multiple ones occurring in close succession).
>=20
> That's hard to tell, maybe we should make the base iteration count
> settable from the command line?

As a last resort (if people observe problems) - maybe. It's not clear to me
though on what basis an admin would choose another value.

Jan


