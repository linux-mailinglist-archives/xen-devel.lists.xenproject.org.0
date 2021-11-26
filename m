Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64A45E951
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 09:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232371.402841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWVX-0007KT-Sw; Fri, 26 Nov 2021 08:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232371.402841; Fri, 26 Nov 2021 08:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWVX-0007IW-Pm; Fri, 26 Nov 2021 08:22:59 +0000
Received: by outflank-mailman (input) for mailman id 232371;
 Fri, 26 Nov 2021 08:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqWVW-0007I1-3k
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 08:22:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1fb6ad-4e92-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 09:22:56 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-UocoeCquPQasIgDCf4frsA-1; Fri, 26 Nov 2021 09:22:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 08:22:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 08:22:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0096.eurprd06.prod.outlook.com (2603:10a6:20b:465::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Fri, 26 Nov 2021 08:22:52 +0000
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
X-Inumbo-ID: 0f1fb6ad-4e92-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637914976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8PLDtEaCZ07sw1+bAhzo0tDp7fotvSi9aIUnv5i/+s=;
	b=bEBfpxJSebzfuup30CmOpA50NMsonXsxkrDKYrU5yTEY+FnAYCmDIDNElTia+fCx9NrbFc
	DJx3ZgUiwjF2PbuiRk0HT6Rsj86qc8qhiOCG2y9l1C/OVCUhSh+DvfpDsR2xmQ7bj0dajG
	FEL60SGnngDq0Vt6mWKEgrqYt+O6f3w=
X-MC-Unique: UocoeCquPQasIgDCf4frsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE/mEBRSAZXcqOPTFIQUxkDgKVfAgrdNSrX8an0EyIop0N/ku9J2kyUwygzBFja9rTm/ufqy7xa9rfb+wU+V0qbU+Afazag0ZKi4MahIIL93NtvdHR2LSTMwRIRWq6Wtr3Le9k9phC0y2QNx8OX8EN0r/EvYMS9+6aulzzmL+i4w8T0J3hrpmpny6Zh3gCszYFT/tCouGwuvW3a9eULRHI0m82SG0UeYM6i2tIWsYmG4khtTja/jO0xi4SG+eSgFlC9g68eTWJb7QrswUWylnnUgO9vCASu6LLzNrSRCY1GVeWXKTMc5wGwsb9yaWko7Q9lsCvb5zWuShWjzh8IKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BbUsQzpB3fHECP5Hg/6R37VQi4nMLuH8c4P8Nwp7L4=;
 b=cGLY2gfAtbxQ1lUfkKJu54qRBJowN6lVjJzQRLEYH/BBxNDSRnXwT1r8ViOpXThtb28zjI1QKLeNPRNPJmSsJ/c7uW3gwxdhiiH64MTcEElDpiw1mXQ43ynZHO2nIBn2UKrkZaya/Gyz+pgdXAs45haBLgCN9iFnoELSCT7iwDZCCfakJT5UCkobhxd3OVOkPJviI1V7RlXi8hfp46bx1bgpw2jxmP+vQthmUhXg3isKQrFQLXl4cn5NIX1iaz4oXXMpEJMHJkimOvTsMFvkUSWzlnYbrZq+8IJ1JIU2cgjvyP7umtxDlf8Ermq1z22BSCa+ncLcT8Lg5Sn9MbIwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5fc926b-7fbe-b8fc-3271-2423b745b1d7@suse.com>
Date: Fri, 26 Nov 2021 09:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
 <YZ9oxXdnAEXaRtAD@Air-de-Roger>
 <00a83850-0aba-a66c-09ed-81204e8cdb3c@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00a83850-0aba-a66c-09ed-81204e8cdb3c@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78693ecd-cd15-4c65-4791-08d9b0b5f0bf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774010B68A11BE41AC06B0AB3639@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hcjokhqt/4dyWG1zVFu9N5hrHLuhMbd6KwIUFrTvyjttC28d/mQNLhG+3V9rpKAZHkgwSVO0lsPT3MkrBSOmy59SAP2jywie83Rf0ffM61ttri9EfouzV8SlP6CrDEX1faD5ns1x52wST3eL2ZNhO+phltaEtSWXEDqU6Ngp6RLWSZoCSUDFYYl5F/U6GIuqTXSyWCQXcwQMO22/9WD4YLpKKLLUuze+cE38u1p7rLjxx9j8gDIxnpbee2wCOmA+MHtxKVddI2iedL529pwVa4Bk+oS22NV5j6VMxAiVPYnxHYZiJ2aSm3tSbGf1kg+VtUTgvieFS83YymSB4QOn6WNDdbdtKBVYW9gcPurepvlyGc8NkZyKvmxw7u0cGoT3B0T9Mot/OMPIRPj0QoMDKyChiEtpC7Qk0/2PQSDs/lWlHOp3I5P56yJV7QyUjxjXPgEgXl3Jm2Oo2C4I98nv89kTMhNyEXJBJ+3NurwWpcuJMpJQO2Ggbqi0XYPyLaT2zT+DeVDviE+Pi8olKngzcnfeFcI610gx3mG4F63WJ73xEJyM7KFD8cHbmzfFsyzXaUoQMW6BmVCHGVJHXeR/O90UgDg+lVZLY72CfLlgohpGhc7JiXC2t5dCl1zjqKF/K6P51ow3h+XU0LswFno4roPoE2YOpUGXp+WRtFoemhT6oXUSEikEn+XnAXidViBKuNg3hiOGVj362s2YwW4qp91qpT0HNMM/HjX1BONfMNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(6486002)(956004)(2616005)(54906003)(110136005)(2906002)(66556008)(66476007)(66946007)(316002)(16576012)(31696002)(53546011)(86362001)(36756003)(186003)(38100700002)(31686004)(8936002)(508600001)(83380400001)(5660300002)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pXYChmEMRY81kcNrKZHEkkJlx5IpRql1rel9FRMsUb7blsQpTJX07ch/Hbf?=
 =?us-ascii?Q?uRoxD2u8xmyssS8EjlBybeLHFtVu2LT4P+YI0ZGcCAnLEK3EhSTNM08aexvX?=
 =?us-ascii?Q?WRuI6NJAqO/hFPPjZPljZ/E/7d1B2u5nuced4nLxwbnJtFinEYenLG2xMVdO?=
 =?us-ascii?Q?xiAWaTqLt59N7YP2BxuL03cxMAIis2pARdQ0IQk2STX5aSGRScmYONhJAsDT?=
 =?us-ascii?Q?+5x+Q2pBihdAawWk8CORMaBoDH0nLYf7VEG1YLbZTO0unNL0o3C2VOYC9kAg?=
 =?us-ascii?Q?NdEGFsJoHiTUC4cQCAkS5M1V9IiPEU/XCccAzVQFeR+/FdmJQrtNKVKSL23x?=
 =?us-ascii?Q?KJ3Bp3Ckr7BEsxC4fJ2mJpEPr8wxIYFmvcDsig75AFmqdN/gxwkGKRNdQEzC?=
 =?us-ascii?Q?f/eu8hlMMhB5R7NoaOIISXIHZM031XP+LMcm18ajlyn4pvFsuXLVBduLyU9+?=
 =?us-ascii?Q?p4L9rIU3DO83lBXmIoO5RfQNYDG4TfAq2jzBea7e1ydqj4+vb+zAtxWj8aHY?=
 =?us-ascii?Q?0jmWohWCAAcN+dDHthPMlhdhmIN7+NBjxSEyUS0WrfY0t042By2wcVQ6Qjn6?=
 =?us-ascii?Q?5137P3qsECBVz3tCADU7h7mi7PxDm+vrJoQidL5K0CNUGKnfdkH3IPkYtiPS?=
 =?us-ascii?Q?OCu8ZpZO5eQrerBFxH6GcqzHMNK7/Oz/qk9i3TFEIPT6p0T+/EDsVXpdoJwX?=
 =?us-ascii?Q?4UKDld0kkS8UfjCcvXcCgXLggQGz9CLDi5X8iv3vykel89fGtV6JIjZ3Y2mw?=
 =?us-ascii?Q?9x9jF0X0vCvINXqc2vCaHaqE7Wj7ffdLJ6thGl5jGw45OSz2NM8HszkEoeWa?=
 =?us-ascii?Q?LSH8E1oBOc8IfjTESATvHdub04DOYaF5JF7xwAFhoNw4EgDvaAf4oQxExzue?=
 =?us-ascii?Q?aKtdQAhal1CDFiJOHaxSjWktkI4WYYotR9TgA6+MpjQc1Km/gcKnJE9a+sTr?=
 =?us-ascii?Q?THEbTFhKsiJfbkNN3i4vNpzR4nApvkTi1Ji+R199ROYjsACHHMjCTevZIzUU?=
 =?us-ascii?Q?E5eJJ2OpFmYqNeTPuMP/wut9OVEuXI8z3yhOVfnBrNP0zZWLW/xf87dRW2NW?=
 =?us-ascii?Q?Wzn/MlNoKZzuJvrmGT/V5FOdZGaZtGnZS5PcERvNC7TQIJFpHcIKFqAttmof?=
 =?us-ascii?Q?iFtcwj98E1csyjiw6v9BGtkssBRQtmp/7b8EQdk5ipm+Kh0EDTh9yB+K+YCQ?=
 =?us-ascii?Q?9EFXf6Dp/vlvKaqAF4nGcasbAIEndqqh2W3Zk09Rcoi5eyxo6BFo9KRUWQAf?=
 =?us-ascii?Q?JnjpobzHub+4kpJztb5dEx5mnZMqiXtblaZXaKkZdfRQxG5Q4GPpIVn/SaX4?=
 =?us-ascii?Q?sHckPgtOSpP4hoCtWyUm5hjPDq+mrcHR1mKSrkgfLz736N6TGu6WIz7uHOvh?=
 =?us-ascii?Q?3Zy3H/ft+OmZ5Hru4UWw/0dU6fen7SVOaZ1//VVRkF15sdQnzy/RDIBq2PAw?=
 =?us-ascii?Q?2BzKgPNODi3imXlY5SzzSU1h8tCb5YM/qk9eca3G1dWnuhH7au62PZM5tiBY?=
 =?us-ascii?Q?nnYR3afpilxXvr+OpiRWcVZ5YyFUW9WOpz/M1pZxCd23D58h45XUc8jBm3yO?=
 =?us-ascii?Q?tmvA/sVQC3CnMcIhqy+8YZk01jiWYZ1T486YN5+0WCbLiUYYeuY/1nW099H0?=
 =?us-ascii?Q?cRVWcKR79AxUZjLHRRrsONc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78693ecd-cd15-4c65-4791-08d9b0b5f0bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 08:22:52.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qDJ9AwIH51yIapYQ3YMOkGdpSz4V1hATdAdne/tQH1wvh/iuOH9qZMbGdIZexMfPJsyImo9meT5wocUhG926Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 25.11.2021 18:28, Andrew Cooper wrote:
> On 25/11/2021 10:43, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Nov 25, 2021 at 11:25:36AM +0100, Jan Beulich wrote:
>>> On 24.11.2021 22:11, Andrew Cooper wrote:
>>>> OSSTest has identified a 3rd regression caused by this change.  Migrat=
ion
>>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron =
4133)
>>>> fails with:
>>>>
>>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffff=
ff, msr ffffffff (22 =3D Invalid argument): Internal error
>>>>   xc: error: Restore failed (22 =3D Invalid argument): Internal error
>>>>
>>>> which is a safety check to prevent resuming the guest when the CPUID d=
ata has
>>>> been truncated.  The problem is caused by shrinking of the max policie=
s, which
>>>> is an ABI that needs handling compatibly between different versions of=
 Xen.
>>>>
>>>> Furthermore, shrinking of the default policies also breaks things in s=
ome
>>>> cases, because certain cpuid=3D settings in a VM config file which use=
d to have
>>>> an effect will now be silently discarded.
>>>>
>>>> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well =
as the
>>>> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which=
 added
>>>> one new case where cpuid=3D settings might not apply correctly) and re=
stores the
>>>> same behaviour as Xen 4.15.
>>>>
>>>> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields accordin=
g to actual leaf contents")
>>>> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies m=
ax leaves")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> While not strictly needed with Roger having given his already,
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> to signal my (basic) agreement with the course of action taken.
>>> Nevertheless I fear this is going to become yet one more case where
>>> future action is promised, but things then die out.
>> I'm certainly happy to look at newer versions of this patch, but I
>> think we should consider doing the shrinking only on the toolstack
>> said, and only after all the manipulations on the policy have been
>> performed.
>=20
> Correct.
>=20
> The max policies cannot be shrunk - they are, by definition, the upper
> bounds that we audit against.=C2=A0 (More precisely, they must never end =
up
> lower than an older Xen used to offer on the same configuration, and
> must not be lower anything the user may opt in to.)

I disagree: For one, the user cannot opt in to anything beyond max policy.
Or else that policy isn't "max" anymore. The user may opt in to a higher
than useful max (sub)leaf, but that's independent. I'm also not convinced
older Xen mistakenly offering too much can be taken as an excuse that we
can't ever go below that. We've done so in the past iirc, with workarounds
added elsewhere. Older Xen offering too high a max (sub)leaf again is
independent. Max (sub)leaf requests from the user should, contrary to my
view when submitting the original change, be honored. This would then
automatically include migrating-in guests.

> The default policies can in principle be shrunk, but only if the
> toolstack learns to grow max leaf too (which it will need to).=C2=A0
> Nevertheless, actually shrinking the default policies is actively
> unhelpful, because it is wasting time doing something which the
> toolstack needs to undo later.

I agree.

> The policy for new domains should be shrunk, but only after every other
> adjustment is made.=C2=A0 This is one small aspect of teaching the toolst=
ack
> to properly understand CPUID (and MSR) policies, and has always been on
> the plan.

And this not being the case yet is getting too prominent for my taste
with the need to raise the max Intel leaves we know of for things like
AMX or KeyLocker. I didn't get shrinking done right; apologies for that.
But I continue to think that proper shrinking ought to be a prereq to
that, without delaying that work (effectively complete for AMX, partial
for KeyLocker) almost indefinitely.

Jan


