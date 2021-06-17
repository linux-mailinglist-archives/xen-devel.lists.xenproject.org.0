Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D53AB31B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 13:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143909.265041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqeT-0005hZ-8l; Thu, 17 Jun 2021 11:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143909.265041; Thu, 17 Jun 2021 11:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqeT-0005fc-3s; Thu, 17 Jun 2021 11:57:41 +0000
Received: by outflank-mailman (input) for mailman id 143909;
 Thu, 17 Jun 2021 11:57:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltqeS-0005fW-4B
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 11:57:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d5a3ba1-62df-4f58-ba08-b5e81983f9f7;
 Thu, 17 Jun 2021 11:57:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-g02NrFD3NH-6bMqYU10Dww-1; Thu, 17 Jun 2021 13:57:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Thu, 17 Jun
 2021 11:57:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 11:57:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 17 Jun 2021 11:57:35 +0000
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
X-Inumbo-ID: 1d5a3ba1-62df-4f58-ba08-b5e81983f9f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623931058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXiYVOEUaB+fQNMPF15DO6eyKQSCSFHVjXjFHEaUKOk=;
	b=UF/D+sYFDot897EJcwiABr4kVsxtXzG9dC495o5akHxlJb+wWm6mK0o4Gs8VU9UYmhCOmg
	duAmjdqqfgvnV0diX1Sb53e1g4Oo0XhjwzyG1YaDLbV3NwuobYyyk120Cp/Xv3r49+AtOP
	4ztbKHhMvuBW8Jvfi63JI+U5vjJumA0=
X-MC-Unique: g02NrFD3NH-6bMqYU10Dww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nen8VcGgLQZVuOQxJeeD3ATwgKbdiHTuT+0mrsLIJlc5Of/flu0bPhRT9oE+RZYa+q3mG7kTl/YsSQu27eImv1AmR3zMfcs4sJcvFnj59oYCNCvoyS8QxQWxAZ84k/Vk/23nBSnOVcV4+Cq6otu+5pAGbzCaFjs4+t6alWQyU3Y5h94cqUSdhacR6F1HWZnbfWAhOX9d8hVGgshark+0z/8mfmJEY5QRWi0ehKbacCFX5BCnuLhd2nzND7XsxessS8RtCkeVTJYeRTQfaabdOPG2lN36FQdlZTHoVY2r/xchc9jJ917V38wTGUB3/21KpA/pzZvITxjLhaDYbieCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3DAWlMsVTted9ih7e+HT8GUOf6oiGB1hE39lPwO7dE=;
 b=OOmnE/vrUBtsAv2fheWlOYSiB6d82sKk/hHQjCs8kyf1h6FDy9JTaQFAIAf13tHcZeJPTyldwurB3zRJfqD09hpJpMqrbYTStxz1aQlDiFks+Hbp4bQj6+C0X6PmCmxVZ+g4+mcc0W3jqdrRXV4ugGBoU7AnsYZwXWOK6ODpPjHSuu9VGSZw7u1PLoZhz2p2QhVmuxgv8xOtlUa742QBDceCPTslGayz69i6nBfiK1nhAtZekUe6bquFeVv8oMgqiiS/oVjGslLKY27k2gU1wDLSRaLxDWf3ctTN2jkV+qSPfUjQZq5k4YOl4x4Yf0ybUvaHY0TSnQTXTV1ck/sdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Tian, Kevin" <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-4-roger.pau@citrix.com>
 <MWHPR11MB188653F8277F861018DB00118C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMs0t/gQEK4kUGiQ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e81419b2-1f35-85f5-af67-6f51e69d0314@suse.com>
Date: Thu, 17 Jun 2021 13:57:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMs0t/gQEK4kUGiQ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80df7251-37e6-47fb-a8c2-08d931871902
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71527CE605FF41CF8FED504EB30E9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yZ7XqPYzquH3ny1o9CS2yS3tGh33zBvadYfuhE8KKDHFgzyyAzV+cTExbSaj43996RXeq009YjWDe9Wgx84dE+pyaYHpt4cub+HaGllIsxpolq6LckevOfb2RdKwnp2YsAqBUNWy5AihuRuY6F63qEHJFzd4zGWO24c/P4RXdQq54T1pxvnnWUD7We9qbU6hK/Sj7G6cY6iWdXjEjYfN9IINHN/79/5tEH7jivh2TWwQ+y1SrmOwDJR8ZrCf4526LVK0cA/MC1tpyt80KiT3cXVmUmN8SUc1n5LfDvBhkKGl7IMGgznuRWRiFliVPwCpe4dWhepZya3TT/DowA4FRV1RgG6XLDJyDtm5icKmXrq0djAmJfFDD8190eeRB3dLtzLYqLkpmpaOlnnrIZg1Y4sCeDg9a3rhLNCtT/HerCelSQOyGn6XqXzgdr29EMpZ9vyqsiuX4C57SJiu3GPwbLGRAM/dcX/HVeZVdhNx57C6WzIDHZt9/p4Nr3vrmE/ZtTmTEosDTPaHAhd4NEWmVdNzLauuvuzBA24GhQkp2i8JWo3AHBkA8leJnxKPCSid8RY1S9NLTZaQTbi5T2+4dYDc85s0a0JXDurMivAgGZwfhTZAdNdeBw7+RKibWMBG0SEGcfWNIl5SrwDjOp2g95c3PtsRTrkkplKXLoqd6efbeTtvfyi9a/fbKsAzF3MW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39850400004)(66476007)(66556008)(16526019)(16576012)(66946007)(31686004)(6486002)(38100700002)(186003)(4326008)(53546011)(26005)(2906002)(54906003)(110136005)(316002)(5660300002)(8936002)(31696002)(478600001)(2616005)(8676002)(86362001)(956004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZdfIPlhy61b4zEbcd0w85HjMRrHl8KmA3SoQl9cTeNL0rAGWalBUKz2eoXyt?=
 =?us-ascii?Q?gvYmYRIg3+GbGmMDF2MdraLrBi+m6vr7uoW5em0Rj+t5WqcsYZGuRcjxAk64?=
 =?us-ascii?Q?3tQsVpUU4tEPYnLePWx2jg1IH7kEba5fKluE+DsOIXppWwloP4OI7nQT++h2?=
 =?us-ascii?Q?s5uOaDMaiRnMIqWIkWpflf8s+Kki3RzAkkeUrvGZaSZivDMSIUTFN3SrgOTg?=
 =?us-ascii?Q?uW5MldmifpMDonVyi3WDR5d+hNJ+MXqpYBRQ64UsjEwT338DetMBQ2vSEva5?=
 =?us-ascii?Q?oNRg/7sj3HrBEY+twmeKa6tADJO3lPzFBYRy1geX8P2j3evdvj4NgdiOAO7v?=
 =?us-ascii?Q?+cA9mnil91lXL1tCZNEu+qoFpK++qQHstU8co8xvq2iZF9OZONeG1gY5Zdyb?=
 =?us-ascii?Q?iFdD3BL685KYMXFBrv795kGrNblTBVJ7aAxWUGNyf2W8b6RSevDBfxBkePOv?=
 =?us-ascii?Q?q38BFE2R1aWyvqmkMss/jWp1uiYmRMGyZF1V+0sn+iio2vWniThok4YTX5pb?=
 =?us-ascii?Q?B6j+IVuPSsPDn4diJIOLWjHX/xSsJZ5B8YLUwSPDRBvyvU/8jNk71uWaaUuS?=
 =?us-ascii?Q?wPn4MFQdRudZX42mjJom0vLnSDFcLQMTdOtWEalVjXFgv2F5mCS23SPNuIN3?=
 =?us-ascii?Q?jTo7fQuVPaK6Qn/PtH7bO1cW3hzmVuKIjNL+h6JmMdm4iloIDzMgpY8Edsb1?=
 =?us-ascii?Q?goHK4acgdRPZKsnVMQMI7yccVinuZ6lmwyqb+XJxMXG+lML4jrAw3wKoml7H?=
 =?us-ascii?Q?3vO1aB2ZzxBLJ49uXHAALGBwhC3lo+0E8J1RmnaLXZf+p6KfwUC2cZDc6Zab?=
 =?us-ascii?Q?lFpXIlfavIFlsEgNxI3kc8+06XOvMqfK2uQt6v3mSdt9KRWhNj/tngulKDbO?=
 =?us-ascii?Q?/nf5LM7ctTRyC/d823UpTrr79nGUOqZABF7qrC/JP+KhqeTAQe30aK/Cu/mb?=
 =?us-ascii?Q?UFxP5wN87M+/PpeCioUhyuWCWeA/SrNKuc6HuZ5u+OF/V+ubPVs0OFyx5w19?=
 =?us-ascii?Q?Ra0Xs5RCxdi0Ni+f0PwI2Q1BkiUJYpSSzdySUCQaV07PZ1jyR83IXPKrxsZ3?=
 =?us-ascii?Q?t4j5w0Zi91GObom6G89/uy5IfLvoULKIlzYOK0sW9S6VsMd178jKgxd73Yk9?=
 =?us-ascii?Q?RAeRRB2ITT2uLkrPnkb6YyOzxiBXjWAj+YCY8tSDku9kseVf0L4N4gCCPDka?=
 =?us-ascii?Q?GVrpdqk6nprObg5WTZCUACJHO9lCCKpiOLL93H9g0ap5/qNs0DpYb72Xxblh?=
 =?us-ascii?Q?SHvMT4SYN+02zKuKrYQMlOGis88Xcg+TTtGjqG6si053aP4AhThJQbLM3dnC?=
 =?us-ascii?Q?lhcGrCR5aU2+ZrGLbkdfzKlP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80df7251-37e6-47fb-a8c2-08d931871902
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:57:36.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boan1tib7nVC8Y57kyejYeyHRye0VeaSXlWSPsLqfiZ335ZNvFuexq8GupSzeIQSV4x8HXOVrgeWjhuca2OBCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 17.06.2021 13:40, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jun 17, 2021 at 09:31:28AM +0000, Tian, Kevin wrote:
>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>> Sent: Saturday, May 29, 2021 1:40 AM
>>>
>>> Force WB type for grants and foreign pages. Those are usually mapped
>>> over unpopulated physical ranges in the p2m, and those ranges would
>>> usually be UC in the MTRR state, which is unlikely to be the correct
>>> cache attribute. It's also cumbersome (or even impossible) for the
>>> guest to be setting the MTRR type for all those mappings as WB, as
>>> MTRR ranges are finite.
>>>
>>> Note that on AMD we cannot force a cache attribute because of the lack
>>> of ignore PAT equivalent, so the behavior here slightly diverges
>>> between AMD and Intel (or EPT vs NPT/shadow).
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>
>> btw incorrect cache attribute brings functional/performance problem.=20
>> it'd be good to explain a bit why this problem doesn't hurt AMD in the=20
>> commit msg...
>=20
> What about re-writing the last commit paragraph as:
>=20
> Note that this is not an issue on AMD because WB cache attribute is
> already set on grants and foreign mappings in the p2m and MTRR types
> are ignored. Also on AMD Xen cannot force a cache attribute because of
> the lack of ignore PAT equivalent, so the behavior here slightly
> diverges between AMD and Intel (or EPT vs NPT/shadow).

I'll try to remember to swap this in when committing.

Jan


