Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7112B4EC78A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 16:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296411.504514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZjx-0002ik-7u; Wed, 30 Mar 2022 14:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296411.504514; Wed, 30 Mar 2022 14:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZjx-0002fk-4G; Wed, 30 Mar 2022 14:56:05 +0000
Received: by outflank-mailman (input) for mailman id 296411;
 Wed, 30 Mar 2022 14:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZZjv-0002fe-GL
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 14:56:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8413ea7b-b039-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 16:56:02 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-hGd4ozC4OzynfnxIVXI6bw-1; Wed, 30 Mar 2022 16:56:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 14:55:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 14:55:59 +0000
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
X-Inumbo-ID: 8413ea7b-b039-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648652161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z4joDggrSVhx32z7466yWKENbxiiwcX+8sj9oKOMa8=;
	b=dYg/MGCuolK5Vaxm2ZUeqscugZ03W6x6Ff/K3ZrbanwZ2AASUMLMFGRaDIh6miKbcPY0J4
	ZGPZx3qsX4pw4B9hrWnYE2BeugdkJC198KU8p9JgLy6WyEOQKeqopA3dFE2CqosPfeKGVw
	Ay/qzfem4noCXAxUVd+7QyUWDNkKYE0=
X-MC-Unique: hGd4ozC4OzynfnxIVXI6bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0fwyMj0IBMpRrg/zmvFmHRoNlnDhf94p1qutYlKmAQSCRQbkj1xxqQuLsUm0eT9JRxBC2ranQKwoNNPJn9ny9UpZydwJFsq9JrA9oxJ01l+UaHYzlyXOe2YLNmKQTaOpm9Ebo9lcsj303sdTpQjuyu1c6oP+E9T1Sd76Qx8BCGRMLsXZuN1v8ZWg7o0VwjxlDp5S3yMvCICAiMosCLp+iMNCWtsUq/X/0LZUsRzG64bdXV4W2OeJK1iqE53Txw3/DaWjZPR94FbO7ApZ1fmhS5T2agsb7M0PcOxZ3UPcIrN7vPqky5gJ3gWSak6NhmU+6p4wXfa2t6nqYo4mPwPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHxDX7F96LVMBN5pAoHzZ+IXXj+P9yooSfJBO7M8C+0=;
 b=TsNiC6sFJdzN4RVkY2SqyQ0llJ/rojf24CQk+cUF0JzFXhFB0twNqlIGFlh9jLjCM9hBBCQSxqO1opVJH4pgwCuXoy1nhWLexEqJMweRPv7k8xZLmvksWN0+SsckAFISRSB5u/tFPo5C/bwcbjLUt9Hokl22VI6X7OEnzULpRCTA9sMXz3yF4EetDANk2v+fxZ3FF0tsLA+itIcgL5CP4CbK72LKXlnEJRGSd4a/V0ib10Rh2ers5xDUStmAiaDfX30vlA3x3/wPq5MhZRhNyQYIcMyJu++XpvBmIc0J/U2pRlRjv8yuqcakZVgC5NHQ3BHmCdwUHZ2YuREpP1czag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5091d7b3-18d8-1842-a65b-159299cf66e7@suse.com>
Date: Wed, 30 Mar 2022 16:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkRm8oc0vQzRQ7VL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkRm8oc0vQzRQ7VL@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0203.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92bd66d-0f2b-4b63-0af3-08da125d641e
X-MS-TrafficTypeDiagnostic: PAXPR04MB9470:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9470F7272CF58179D730098BB31F9@PAXPR04MB9470.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YC8s8udGcc13IhkYz/HzZj7rSSQX2+ef7ANKts8pfvi80da0/0yNqt3x9Jn523FWmri44paf+PK6h3ZSv8U9fYy0mIfXqwo4kDZAIxxakcWMyMteHAkD1QRCOaqTmrDOcy9aKW3D/o1wXkzMDa1JLIuOoOxVZLZ5k8GevPHYOE0GPtRD0xOm4iHSXL5Zmwi5W/GcONSTjju8IiRXqoAuIEey6E7d1fnnkXpmqNAPdbQ//fsBqHP8MyzIJJgIOxYXxE3sFaDYoF7u1PmhEGXFkaPh77qgBLWF3HBu+CbxDp/o8J7KyK1hycIqByyQKYkvtddIqwacT5AaBs96IuBFKXxdWYwiqqvXUcWpnW8GRzpjuby/koDFxQg98BdjDLpy8ylzDD9y83JQKdBUFC4ydmGpRBcr0752S1k0jz32Cyd56dWnALXcq6fWHqz+pWnGgQd/rh5wHcJQSFyh+xlWvSNd+a5TtFzNyTEg+wMSQeiTj2PXAC7a5VRMCx1huT6NC6ajxQ0h8ZRDs4Zo4NsVyMUWYEYKHD7lh7VhM0nuAjs8QW8gqELLUcsR+yyp975xdiJy6JVKG2pXp/N1pVc7rUS62Uj4pxApgmEsOITgpAaoKjpp5pZoWEL70zTXnVnpe8RuBfQeb4AzNASmxentljMPlWDueqQb2bTdmjRaiaGllKFjgnRWRonAI0kwUam3I8vXIUEJWd8VsV44rh2jWJdZ6KKq3m2bwCKJPUxc/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(38100700002)(26005)(8936002)(8676002)(316002)(6666004)(4326008)(31686004)(66946007)(66556008)(66476007)(2616005)(508600001)(36756003)(6486002)(2906002)(31696002)(6512007)(53546011)(6916009)(6506007)(54906003)(15650500001)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/qL+Vdm9CO+oI05Vc9uKePmpoc5aOLLaeVzkduFelDk5rCkISlCtEWMXaILi?=
 =?us-ascii?Q?jkeXKXKNj4ANCcOALq2itnaQgA3J5CTKF8PUch9IoPzf/h6PycNAuejYdQk8?=
 =?us-ascii?Q?2PGZTPtKLFb41x4PLVyQ706jUUkTmJECZEGgvZ7+sz0T5Ndv5kqsq0Va+ptd?=
 =?us-ascii?Q?dAgOOc1PEXrXY5Sw7l7gT9kxmNHze1Oq9pIpeT7joqrA+OaqMnkPACwLVmPo?=
 =?us-ascii?Q?hP7/y5Xb065ilOaBb0Ad2QBunp60kZubduZ3DkDflg/Iq+ATkGCSqNlXuG0l?=
 =?us-ascii?Q?PCgawmLBqERiRLXNiPK4kqx57lmSkJ+EtAnMobeqhjM1IJCM8t9zcUyAGmhF?=
 =?us-ascii?Q?PbK/bWpi4qEYl4vt+MCyI3U507rGNANrGMbMrFu6YOxxeZmhOPtq7vUGwngO?=
 =?us-ascii?Q?K33Wct7VJNcYIlH/G/H2uFfaM27dN/m3Pnv2Bk+51EKT82geWozR5pd52kIY?=
 =?us-ascii?Q?Lo3z/q3tp9kzvAkcf19AE3RVeu2GtmoeZkGBJEoHIssO7ApXR8CXb9XgtwHd?=
 =?us-ascii?Q?3d3TbarJrz2Hmeh++zLs8d+5W5D3Mo+Ke3S8Pvd21pw5OyXjZfIqAZLhK9Wc?=
 =?us-ascii?Q?mGcSDWED9Y//dOUg3VjmsyANT3kCEZmiq6yQWqwo0kcFCQXDvFaqdXMyBciv?=
 =?us-ascii?Q?yeDlPk3Ybc81mh3JFle/FlEMoCVSFXNgBlYOMt1nfQsh95UagoGxon6N2N4A?=
 =?us-ascii?Q?AXTl5kql0rBxCHlG39FVWnNYDPi/tk08OB9VwIe/JRe48P10jX/GbLfycoTc?=
 =?us-ascii?Q?wvY2px9xoKjvoH8a8SI97cOHH11Qtl1g28txVuNfBuEDtINw5YivkgeF0nIv?=
 =?us-ascii?Q?wilSI4jmHqx0nJr67OxsHn8vBb+oCyh5IYiNZIOY2GnJ1QOEjd9aqK8uIGSe?=
 =?us-ascii?Q?8yaskZCf9cLo6nZHWMPLIUrqkE1uAMr4dO18XYwkioGqOtwEfEtWrkW/ZR4k?=
 =?us-ascii?Q?WPZKnMKSTO6y6oTsRgLZasHtCmM2v2B+h1vjziJvM5V5TNXFXLPi2kreDgTZ?=
 =?us-ascii?Q?rMJkuEXvJTDA0J1f0+rxbXL9Ql745NJrsWoDtENErYuMl28hdiJavVqA+sMH?=
 =?us-ascii?Q?RIalMHjuO+HvA3ykE1qvxfWo413sWX1qMYU8o4KF9ABvCxZrmN+KW4h0cT78?=
 =?us-ascii?Q?EfWeMcMLLXDHN/M0IIxpcioSJebnM6xB5e9dR4nO9PjwvCXkwkncEd0xrWNV?=
 =?us-ascii?Q?1Ch+XYRqoL7sz3F2PihDs7U4DZ/nQ5VRB1D49U1z78rjegfzH1lMBNoZYasK?=
 =?us-ascii?Q?o0X0oDWEmrhNQqbQH5eVMcO3Bl8XybVAmsKyP7042wzLQTIXvzCMpT+t+/8H?=
 =?us-ascii?Q?BUP47rdPmgwmecYC0L3+82fIzBfeUpENSHTzAzYaHjIf8h6PWx7d3T8rukQo?=
 =?us-ascii?Q?bstjeKsrNpZ/zCooWG+6Us+OrYz2Y1zU7JsXixcKo8GtTCe+RbR2TmJ+Sx1I?=
 =?us-ascii?Q?g0qPVV3iopMUEhmBCh4iAXakQDZY3minuSuwvIr+g7tetkSXBonoFMdVenjI?=
 =?us-ascii?Q?CtFCQkwmiQPpuZhoEkziPkYTKU9ACse0VsVht89Wp71rmgtxheyQtgKa0OYU?=
 =?us-ascii?Q?xtGoD/YkgeORZqCnINIAir0apo/m95H2X7wJTAjDwTISiH57JKC6gUmRi25u?=
 =?us-ascii?Q?ZdmJFt5ggX3K9Yl3Iz+kUhCJBieNOKiCAmmENKr4YI/lTqQkHa1IoN4EfxWV?=
 =?us-ascii?Q?WiJxD08QXlvdrQoXUfBIMqthUFVRF0R5eeGl8U3E1c72cNP4xMWP8TudfYlg?=
 =?us-ascii?Q?qa0vZVgD1A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92bd66d-0f2b-4b63-0af3-08da125d641e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 14:55:59.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPjoOZBDxtUwt5bwaFR9Ollu/0pOau/llstvGkvFqpdVrNyO5dbf9A8z2CNvyllWC4jXrba8mfryN1BVii4ovg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470

On 30.03.2022 16:19, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 30, 2022 at 01:05:31PM +0200, Jan Beulich wrote:
>> While not triggered by the trivial xen_nop in-tree patch on
>> staging/master, that patch exposes a problem on the stable trees, where
>> all functions have ENDBR inserted. When NOP-ing out a range, we need to
>> account for this. Handle this right in livepatch_insn_len().
>>
>> This requires livepatch_insn_len() to be called _after_ ->patch_offset
>> was set. Note however that the earlier call cannot be deleted. In fact
>> its result should have been used to guard the is_endbr64() /
>> is_endbr64_poison() invocations - add the missing check now. While
>> making that adjustment, also use the local variable "old_ptr"
>> consistently.
>>
>> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced =
functions")
>=20
> I have to admit I'm confused as to why that commit carries a Tested-by
> from Arm.  Did Arm test the commit on x86 hardware?  Because that
> commit only touches x86 specific code.

;-)

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> FWIW, on the original implementation, I think it would have been
> clearer to advance old_ptr and adjust the length?

In my 1st attempt I had confined the change to the x86 file, but it
didn't feel right that I then also had to adjust arch_livepatch_revert().

>> ---
>> v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
>> ---
>> Only build tested, as I don't have a live patching environment available=
.
>>
>> For Arm this assumes that the patch_offset field starts out as zero; I
>> think we can make such an assumption, yet otoh on x86 explicit
>> initialization was added by the cited commit.

Note how this already deals with ...

>> --- a/xen/include/xen/livepatch.h
>> +++ b/xen/include/xen/livepatch.h
>> @@ -90,7 +90,7 @@ static inline
>>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
>>  {
>>      if ( !func->new_addr )
>> -        return func->new_size;
>> +        return func->new_size - func->patch_offset;
>=20
> Seeing as func->patch_offset is explicitly initialized in
> arch_livepatch_apply for x86, do we also need to do the same on Arm
> now that the field will be used by common code?
>=20
> Maybe the initialization done in arch_livepatch_apply for x86 is not
> strictly required.

... your remark. I'd prefer if I could get away without touching Arm
code. Hence if such initialization was needed, I think it ought to
live in common code. If this was a requirement here, I would perhaps
add a prereq patch doing the movement. My preference though would be
for that to be a follow-on, unless there's an actual reason why the
initialization has to happen; personally I think it ought to be a
requirement on patch building that this (and perhaps other) fields
start out as zero. I therefore view the initialization on x86 as a
guard against the patch getting applied a 2nd time. Yet of course it
would then also have helped (not anymore after this change) to use
=3D instead of +=3D when updating ->patch_offset.

Jan


