Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D10484ED5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 08:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253505.434667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n510L-0005Gx-Cw; Wed, 05 Jan 2022 07:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253505.434667; Wed, 05 Jan 2022 07:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n510L-0005Dl-8f; Wed, 05 Jan 2022 07:46:41 +0000
Received: by outflank-mailman (input) for mailman id 253505;
 Wed, 05 Jan 2022 07:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n510J-0005Df-Kl
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 07:46:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d16233e-6dfb-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 08:46:38 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-krmuFuTBNOaFbLekeYMkyA-2; Wed, 05 Jan 2022 08:46:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 07:46:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 07:46:36 +0000
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
X-Inumbo-ID: 9d16233e-6dfb-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641368798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AipZhlbNpv1q5oPJuFbGtnXFJ/DxGZynzuV7+sNHZo=;
	b=IIMizXYs3HB2cE+utnJ5thWRiNDEaBLlaWzCVolZg0nPD7vLcBgWOMK41jjmdhgeT+/w95
	34nb80jDnsHtlB6gx8jNiSRnFxPtiYzxEtPCUEAnVpmOstsLCV5lpWy38i2r6Cwc/uEw0s
	aLqmqmKbL5bk12XUOJrIZTQkDKWxy6Y=
X-MC-Unique: krmuFuTBNOaFbLekeYMkyA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehi8GZiqjAL1dlZ45j9yjD5ADZJM92M+ODANVOvd+5KCenY1yKagHRfnKS5Z5tqnY1/b5joPeN34jdZG9zu4beMEK4bB22em7K17fh0Qql2FCMvIfarApqYwtslf5nuaWAz/AR2pXV4rIerXxAjBXN78c1NiMl+ZEPpnCw+omKMNMRF72W/bEoDZfBfVZzWeOaw+Ut2Adsd9RAj1FO3IWLBPOWPFhqKKs6BiB4O1pzoYADZ7/E4frsL7HytmLTjWCIBqQP+OH1+7k1ABN1tSz50JoIFnuRc0eZdwaaCFcTon5Kxhc62u3JBz+j/tAiQLyDhTPy3Fd5igUVlvakoEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVWqsPpJ0LQyS/S6ZwzactjtLCPSZCYQEZD/Knr37nE=;
 b=TouHyQON+V3E8yErNN9NlbWDizuf0qRoYROUfeZ4a3OLhnlqszgf3sJHg9Cu2OBgCByXLzIBlvTkKk9Ers763POEPeSkLax529/KX2EqNA61O+Edbkzi6d8TW5/N6dx1U4r93nvq84WhcXAOsE1smAFhxYU0HNC8RmM9xwXbuIXjyqDKl62yKiM6Fh/N2tOOTYNWcY2aO00JkdxHSOOvpwRvQXtTNIEFtk7jPtUJ2z108hWGccp+ZwipvWjAH34qZBlqN8y7IObusSP6yhIYPPeApjNivdb/FGCC0DMiq1sWALctzMZ1gfe5QbGyJ0NY3IYTRYa29jo+xSsYapyLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74c658ec-cf69-5232-de66-929aea9f91f2@suse.com>
Date: Wed, 5 Jan 2022 08:46:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>, paul@xen.org
References: <20210401102252.95196-1-roger.pau@citrix.com>
 <5b4ec824-8cfa-8795-3a96-fb18527d3c18@xen.org>
 <910fcf36-a0c6-9f1e-a402-9afa6a5c4a1f@suse.com>
In-Reply-To: <910fcf36-a0c6-9f1e-a402-9afa6a5c4a1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c462e97f-5287-402e-a58a-08d9d01f8002
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671E3546585A10C8525763DB34B9@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5YdIgzlwV6s0TgxS5Sd1xHe86Avw0dKuoG7FUBUCybLPY+j72DWyL7HOE/NfamxEf4c2sPWGBjawWzwS5ugIgRFQbnN59AyaHFKonqdMGuiruE0Bkzd4jgPbu8yc2S60c3d9fv9x7y8ZA48MA0Nywev4jAJB2+o1Qz0T1vKa+eKGr0aYOF0Aq/M6SkpZGFjIrIiDli2VNNoNg52vUZHQLw6iEs7ao3V7bDLa1Hk0IrUtfvU3YUXdsBmTX0x51vS779bZvRgREJ9OtGUxEYoNhlBMw7UXtdHuiuV774qjW5e7lGfLcC8d74xF3fa31+bCLX3rmVqTXcijUTKMTO1baikkT42LJr328aFUDQsgxCUvCHuEeSCTnjJoPdzwbHjnajxdq6d86buKlRgTBaGAnkO8qELYc0vJaoL+MFf/oWPsyvpFGZP8NV7g1nqCoVqh15CyPrhd1D3WrAsPk9HmXDlak1Pv+rogp/+U3dXdvZ9OGOGbSkuspx/V8XSYv6z0w5NrLxYvZ00hfuWyJtWEJA07dQsta4pxLhSs0DxB4aEFzuTPxFMFICJqyPdlw73OMXt69HRxIfli8hAQooWj8loNLPiDW1ALWpzuwi6+CRn39kSLId9sgMbl94BXSON3NYSRLZ0EO7EAoZj+tXHIp/wuz81LRe1n74cx79kxEVrrRqQilko1fv76vPVjUmoDJMNqcZ7QOTO4LWDSFZGZ/EDxEJWlgeQvvfI7dtuErGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(5660300002)(54906003)(2906002)(66946007)(36756003)(66556008)(6486002)(66476007)(8936002)(6512007)(6916009)(31686004)(31696002)(6506007)(26005)(8676002)(53546011)(4326008)(186003)(508600001)(4744005)(86362001)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YT/WXFWv4x7KfzziqQB1KovN5dy+aSH7Yge0OiIA7hKISkNZW9qH3j/qoWCP?=
 =?us-ascii?Q?UUxcKQ2Kam9K7kq47HII2Io3MaaWySeCXC409QcW2DSn6Ui3r/1Gt9k9iIWA?=
 =?us-ascii?Q?lo3FEJD9WJPAd6TeXjgEMtTgWxZvhwVTTAQBTe3qOZA6rhsCS/JkO8Wx3ejG?=
 =?us-ascii?Q?GCEBN267yOa0EKbMgtPPgwiBcFvuZQR1V3gCe/0B3Q7i5XHu9JTY0xsT/ABI?=
 =?us-ascii?Q?JdACaZiiCl4GBpAq9RQnjQh9yAE/+zUV8u9TsctYmKOqcdOqwVzpnanWQUx6?=
 =?us-ascii?Q?VCoblKkcjueAhYAhUebUAppKZSEg7Uf9+xtKrg1q/3wEtUJh3pOkmE2O28YI?=
 =?us-ascii?Q?grvxZwOF9AUSxalEnSy1/9q0ENSe6UkyBpEBQKDC0mh1ETfuFUHwV7nnGjrJ?=
 =?us-ascii?Q?D6UuQ8ZD7LcuLZ2wgn3rjjTJoV49tdayO/mlmX5aJzDq5a8DYklQ/+2ECwC1?=
 =?us-ascii?Q?S3BS28PDc3GwBFVwoEKXTqnVZ4WN4jP6B8OTm8HoYqeRYyjPUsHDZq1Rdsau?=
 =?us-ascii?Q?ax5BNzMLrXUgU3FBs58jLgkRd4+qukSUhn5unjNoVcK2TKFD7aV5Umg+xOIG?=
 =?us-ascii?Q?BfsPw66V8I6au0Dbiuz9wHn9JYPNKaMiDQermodhuVin+V5PWZShLDW90AYT?=
 =?us-ascii?Q?1YpX1m0iKytTWltGdI8Qz+qSrUraqObWXDkk72XzJgwrJo5ccJjDl8icEtcU?=
 =?us-ascii?Q?19aTGaOTUOKfD/L6KOZy8a5krEQd1Qke6G6xA0QOGsVNnISuNHqztSw2wuDZ?=
 =?us-ascii?Q?ysIKe1F8S0jA29QPolnqx98hr+E7qMYFnvNHrGKFCh4ljZlFHQRNAv1BXyNd?=
 =?us-ascii?Q?ieF/v//JIEplZIWOZ8HVlAq90oUBNindNxlOd4nXT7iagpy3Djib4CIkM/2v?=
 =?us-ascii?Q?hrvtYisWZQy+XbjYIfdqluD8jH4C3UQXqUmN7ucOVnhGyghz32155klgKdY/?=
 =?us-ascii?Q?1276GqgD7PlR+GQDTAcckkq0ir7hdtPnH9VxvwQzRrbfk1qehyMYL49yvMQ3?=
 =?us-ascii?Q?jMtGue0BWoCwb1dnEAS3uWUV5rNg8gWzHVGnNNQsLJWa5JU6sJgfzhUBod/2?=
 =?us-ascii?Q?koRnp/QoixYlA1FR5wVr1BMzNQjt+Ej/y3sp28kVQwtF5DEQB9jfNC/M4vZ7?=
 =?us-ascii?Q?oIxwPkHWu83X2Oo6gWlXknGuiaG0QG/PzI28UVlhcPGYvD5L1iVDX2U9fkZH?=
 =?us-ascii?Q?PnDL6uuxW7CTXMwUppPY3eGh/A2BewwEQ1IvwOm22QFTyLDx8fdWBotODs1B?=
 =?us-ascii?Q?I0ctFvliK5IK2qSAAKzQKJeurvouZaBwHhBMNWn0Ac6REFIGuyfP4VCn18Z8?=
 =?us-ascii?Q?38ELx7hOJ7zdn8dmKVQ/6yQzp0dsAq1yt9VmD7nG94zoVQxTcAjkO/h3dpeK?=
 =?us-ascii?Q?W08AolZZmfgrqjYFiDfJ9fyBWtCCErZYl9eId6XzM6xEuxh5RaqJK6Sq/mko?=
 =?us-ascii?Q?3GwDkRN6hwlnjOIvyn/hvMJDbMjxmX2APEwb4mVvBtTamy6xgVyWmjnlrPDf?=
 =?us-ascii?Q?5QRqm3KqY3xBeTi97t7r3/M1RqGk76GTPdpWcXcq8kEagvvdhQxKeseUDo8z?=
 =?us-ascii?Q?MNwFFkwZ0HxzFa3nLg1turpGLb1wpvF0dvIOXYoWt7SstLGpznkyN5/plWqx?=
 =?us-ascii?Q?DVCQGOrSs0ijpN75gAPkdgo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c462e97f-5287-402e-a58a-08d9d01f8002
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:46:36.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oxMHb9GW4zmROW/0it9Y5X7xo0vH+dyIMfmZx+Yy1iOpLzXczNQPkFWSauecP5p7MYez+SZdq/aQhOvd+JsjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 15.04.2021 11:57, Jan Beulich wrote:
> On 01.04.2021 12:50, Paul Durrant wrote:
>> On 01/04/2021 11:22, Roger Pau Monne wrote:
>>> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
>>> as current, as there's no support for EOI'ing interrupts on a remote
>>> vCPU.
>>>
>>> While there also turn the unconditional assert at the top of the
>>> function into an error on non-debug builds.
>>>
>>> No functional change intended.
>>>
>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> Andrew,
>=20
> can you please clarify whether your concern was addressed and this can
> go in as-is, or (if not) reply to what Roger and I have said in response?

This continues to be pending. I guess I'll consider ongoing silence as an
indication of your concerns having been addressed, committing the patch
perhaps early next week.

Jan


