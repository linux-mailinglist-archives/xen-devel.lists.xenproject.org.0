Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619664501ED
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:02:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225725.389837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYor-000379-23; Mon, 15 Nov 2021 10:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225725.389837; Mon, 15 Nov 2021 10:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYoq-00034Z-UF; Mon, 15 Nov 2021 10:02:32 +0000
Received: by outflank-mailman (input) for mailman id 225725;
 Mon, 15 Nov 2021 10:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYop-00034T-7X
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:02:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24fc5128-45fb-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 11:02:30 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-EDXyA7S4MLSO9QWr-Qlw8g-2; Mon, 15 Nov 2021 11:02:28 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 15 Nov
 2021 10:02:26 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:02:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0012.eurprd06.prod.outlook.com (2603:10a6:203:a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Mon, 15 Nov 2021 10:02:25 +0000
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
X-Inumbo-ID: 24fc5128-45fb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636970550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGcxa83tT4mumahfVhectZc6dBEwl/miGykJ1YKa5a0=;
	b=XTRCaJzqyN9ZgJ7td2l5qn5Ck7IxFIntmyVd/VUfkjkRSLNDJWFawbu7ob2mvtfaFr+YOz
	1INLP0nfhK0j3vGBUweuFXB0DByVCoo8zWBtdIpM5Mjq6JZIAx5+RQGGr5UPgqxqBOR/B0
	Mti6xUthy7Q5pXPx1OSz3txUGvWT1to=
X-MC-Unique: EDXyA7S4MLSO9QWr-Qlw8g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi0FHzNNSBC657F5/ykBCE4Nw4w1Yt6twI4NyNPEGi2Hv250NKvnunMtAPEYvRmqvp1w9LKMcu6Job+gqA0YAOqT8O5uTRxORQxmhi55lB0V19iaIlUmMrtrgh9XI7B0sIhCWVac+qDgh/DhZbB2kciaUbTvBSZRqzyUd9n3WB0jBNtRgcLkGMNZAOv0M6vgmxGLsgtHe4ShkitwXW3nk1RH/+GOjS8EAIr7pTRjr+O4a86//EGeepMRxm7mBd7/kquKBL+jxg7moWWeBLlKmaCPPywDN8xYsIQoRhlN8Kqv+qVhA04SEgOmaLkL0FlAA9YrOA5dZ/Lg4tQ+JUoZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6ySVC0z7Wa6lKLSA8VQI7xR/nUyhDCUalGc5dvJlXE=;
 b=dAerKosClWFQg7EguG7rrP69Un3hL0iequyWpZacD82Aq+i0UPFGliWL2MaoTH7LRtOP+1W7Zt91shs4ERr3UABjDOF3CcffF5VWk7vnMz1zlZi3m07roP41JY9Df+1XKvGYG8YuCKaWETSNEM+KIMa7+tboGB2/O73qUnmM+BCY9+dFG2QZzfChoy7nTSo1aerBXNmIE5zaLynuqfXVbTevFtuIwLY7+PslRneo5sAWYcoxb9rz1ux9yUXHVcYE6nH7zHi20wCvWDaHtV3UqshgPowZSvan060FUGeua4xzWJ12QI4BbnKz4RLrSKz8lPe6wvTdeD5TSks47n/uIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <889cfabe-6262-d105-c806-105ee9377fef@suse.com>
Date: Mon, 15 Nov 2021 11:02:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
CC: linux-kernel@vger.kernel.org
References: <20211113083821.71060-1-linux@weissschuh.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211113083821.71060-1-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9987c9ab-134a-47d7-d885-08d9a81f06ac
X-MS-TrafficTypeDiagnostic: AM9PR04MB8145:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8145A5390B09FE4CF9FBEA3AB3989@AM9PR04MB8145.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dVQcwTVJICXid5txS34/pPiaQGmoDaCaystaQ8oFO1cA6winpEqLpImU+H6qPdgg9IQVKjoTckiZPJT6N8evT/7qN8d8yRqhyAsY866ZlW/niHJqfg91FysyroM4ietJJMaQ8tij3c5+6VLHE7a4HcYln/FaldghtLpBkKaFpsNTBqMbNDbqDsnMZJT8DnWW3gvTYBwqLj6UbT4PJM1WF3rFZ/Jo70wn2EZbWjXE7Ukk+yY3DtYIVTRoRsKDK1C6479WA00L4rF2+fjVlnk8blAXCWdS1DxKy/zOs6OvZwPcRn26ceuJMvpjvOBWd/qHx3BrLLIe0mN/5UpyJ3tAU9E3oc043Esl1/kn4ZiZGqBnekuIgGperFf+SqGrec/8oeHpSPdchu8UanKf8fd05b0mMT3ofHkda64+FmNaEIDge/YOhHI7iM2WTYadKqn3eiswCbKgH9eXLwYeOL4wH/uxQgmAlElB2jGyyZ9obP+tS00xcf9oYfY0tWn4KaYrKBR3JLCkOri19L0QzfF4/Y/qu96ahijM1e+798EOybbRoLRztjsNa/PUshETKQ73PJGSDRRcaAKGplVXv6I/nWMOg8b84+zFB4RJmcJ+ygMePY/tNVKK6nHkEaDUy5MpGoOI39Sl4Eb3oYkXWRsPP8QO+OggpU3/ejaBukQSe93PLhsiphLCITgQ71vSaqV8P3A3G8PQ7lLpxUK11cgrRn1OD/F64vkxowBlMV2Wo5/VjKy817iDdSJk/F4Xj1eH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(38100700002)(8676002)(956004)(2616005)(16576012)(36756003)(26005)(8936002)(66556008)(316002)(186003)(31686004)(66476007)(53546011)(66946007)(5660300002)(2906002)(508600001)(4326008)(83380400001)(66574015)(86362001)(6486002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Ooi29bZiNy7F1YUMPxhDxz4pBi/AmjfcrNqofY/Cjt5lTFiDu7C2dyzHo4n?=
 =?us-ascii?Q?gvhzn2tILWwbt93Vx7YNpEItpGfBul+NAs1TSuNYzsuNi63ZLV3Juz+VVEQr?=
 =?us-ascii?Q?8/QuBqLIGoQhNMFiwNlSeOAKwPYY4Ug+jMFKp+4o1sHH0nAZKBQLAgoNSC6+?=
 =?us-ascii?Q?8DGXVjK/hF3p9BTdBsuqxKWwX4cLtUM3crkGJnHJpTmO+K5yhnZ+4kb6k1yT?=
 =?us-ascii?Q?Q4VIsN9FLdGQRCYLX2Zh8CfA9NXqm15FyObjq6/QVsJ/9+z5GD313+1K4+5M?=
 =?us-ascii?Q?lEtF0WGrHJQ38OToD39AVZOF489zlyZLycyTDPiys0sPvtz3driWdKGLGbq9?=
 =?us-ascii?Q?qMIHziqdUeTSs6ER7KTqdefi97G5HZxs7m2BiCcN8axb02Zxx10Gh931pw72?=
 =?us-ascii?Q?dwNol1t6AJeS4Q5sFcVz6uHCAt67mZT6E8UT7lIK7sw6jayVcSp8nn+WyWeI?=
 =?us-ascii?Q?AM/zJgBrObkchSdOITv30O235NecPCUkG802fQ1fe0RpiN3FhWzRjb0Hk2lm?=
 =?us-ascii?Q?TZ1klp9lZgr7wLrFxwgFM2ICPshzqK78YyA7jftwAXzhg3Vf+tZBdlthEF0M?=
 =?us-ascii?Q?fBT+JKVmX/jHapbhENC0SYHAEQCAOQ0xqxfTFtJweRlyoFF8diFLs2Lc5cWw?=
 =?us-ascii?Q?LpAI/TZvYDyvXCe4+5LBngitK1bHtU0zAcsgh/XP7PFmY5N/0AidcnRJpfJg?=
 =?us-ascii?Q?QyWoaMONv52eCUJimuCD/gZYhs0YlCeziNcDhogMP6gTbGyjhG3cKqwmIaSq?=
 =?us-ascii?Q?tJs/zubRl/fga63HiSaijV+fB+6FMdbi/7IlmPueQg5KjZR3KTxkE6sL8RKE?=
 =?us-ascii?Q?pGIqvbrxWwqR4Jb5a8bHTTC4AZ86PMC1DQbI0ihG/NtNJOD1oaGTr46c0hUx?=
 =?us-ascii?Q?bG/pE+zu2j+CmOGPQl3Z76mVVyqboHVe2PPZ8v3lw0jjj53NlhSIBh4o1kaq?=
 =?us-ascii?Q?5Vsy9a0bTVR1zZ0G/MtodPSt0+MdPpGIb2jrMkBRD+S8BkZWeGC3MtpOurhj?=
 =?us-ascii?Q?/uSvRPXpfxODTzSxIMlNPycDHqboB7UzNLjqgRRij4Vis6ZLOsNdTDaQ1K18?=
 =?us-ascii?Q?FccCVMK9tpJOrrsnCCNPlajUU6iJiCqXtxbL+LeH0T264pNgGahsc+dD2clL?=
 =?us-ascii?Q?aJBOJLdqYEjzucVHJ6jnc1GgonItokOQm7GH139gAPK1qn0ld7++wopxI+Rg?=
 =?us-ascii?Q?vqaPC8FioelpzzCc5lusNu/BsDDWUDma4tsLHmQMnMsrn2zji/ytTBR2BHmM?=
 =?us-ascii?Q?WUUV5Y/EzyZAE6/eiyTLDaOcPQJIedQLhQSP1gKUSvVX9fa1l3HqDyiuaTLW?=
 =?us-ascii?Q?O1WB+RPsd9y565j5/DfRADlvqQeZ3krFWNwx0gufSUbV+hfnQmeA12bi0j6Q?=
 =?us-ascii?Q?EGtG/V3eEEo1pwKcwz1aq2t40GKr47+/lkYa3+ykuFyu6+3bns5VgEUAeHjY?=
 =?us-ascii?Q?oUyuN28spNwH+kZn9GYTHkVaDkTK8lEb2C5vU3i9ilZqGqZmIjSKUTBf4zKq?=
 =?us-ascii?Q?zXumFP9zC3f8juCHnUcL77zgqpgRmWgYx95+/uTgjegmoJO5fv5NcvYMqf2t?=
 =?us-ascii?Q?tWTBF/j0E10luLspcH8fQ8a81L8Lu1eXtwiy3g1bfgoYxNELFtoCaSjgdxzF?=
 =?us-ascii?Q?WUGcKSttBZhzEfPvDyR5h8E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9987c9ab-134a-47d7-d885-08d9a81f06ac
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:02:26.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t04rNK6WTvWAj77xgaE022y8m5TuqbDGU9PHs5hKtWppwZHPD8kM4fbboZcsncXzo9a9NSk3B8LlZv+kUgUYZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145

On 13.11.2021 09:38, Thomas Wei=C3=9Fschuh wrote:
> This configuration option provides a misc device as an API to userspace.
> Make this API usable without having to select the module as a transitive
> dependency.
>=20
> This also fixes an issue where localyesconfig would select
> CONFIG_XEN_PRIVCMD=3Dm because it was not visible and defaulted to
> building as module.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>=20
> ---
>=20
> Note: If CONFIG_XEN_PRIVCMD really is only meant to be selected by
> XENFS, then the issue can be fixed by removing its "default m"
> definition.
> ---
>  drivers/xen/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a1b11c62da9e..c14d8631b8f6 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -259,7 +259,7 @@ config XEN_SCSI_BACKEND
>  	  if guests need generic access to SCSI devices.
> =20
>  config XEN_PRIVCMD
> -	tristate
> +	tristate "Xen privileged domain-0 commands"
>  	depends on XEN
>  	default m

While I agree with adding a prompt here, I'm not sure why you've added
"domain-0" to its wording. Aiui this interface is equally available in
DomU-s, just that they would be able to only (successfully) use a more
restricted set of hypercalls. Otherwise the XEN dependency would need
to be changed to XEN_DOM0 at the same time as adding a prompt, or the
prompt's visibility be restricted to XEN_DOM0.

Jan


