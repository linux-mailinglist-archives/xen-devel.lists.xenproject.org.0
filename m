Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30203AC9F6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144494.265947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCmE-0003JZ-W7; Fri, 18 Jun 2021 11:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144494.265947; Fri, 18 Jun 2021 11:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCmE-0003HB-T0; Fri, 18 Jun 2021 11:35:10 +0000
Received: by outflank-mailman (input) for mailman id 144494;
 Fri, 18 Jun 2021 11:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luCmD-0003H5-Ux
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:35:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b1a9712-1bdd-4366-b8eb-0f79dd3efae7;
 Fri, 18 Jun 2021 11:35:08 +0000 (UTC)
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
X-Inumbo-ID: 0b1a9712-1bdd-4366-b8eb-0f79dd3efae7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624016108;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CGp7pFConfiCQs0dCDPpaK7OfgBpoxK58Ip5y6Qi3I8=;
  b=LNbT/rwMWGBNAS6/F4YFkQLFZ9oa5o2+oPAJfh2vlHr3+Sj+aYiqMlbd
   PPYTOIrmtVI4IisNler/t2/qttt0RIU1kGS4THZKqiOdWz2WkbY1YzteQ
   rvslMTv+/+Ac5IYCJGP/ArsUtIvPJtsWoifJhGDcFWwYzijoAWW7ZeWdd
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7kbziORytCmX9ZIiPgWVDm1MuO8W1aTKqfkr2UmycGUI5dpraZruIWhLHayxpaau2AxmA5TxP4
 4Y2TGHyh4Ij6pv9uQkzoyAgQCmYbD3Tui8yWJukoVOpKA23akDpR1V0RD8mqF2p9Di6VvulQt5
 mfxG+X0oZwArGrKWDCZew4G+TR8leGabSrBh6VXX/GocIwh4AlvpBgcUjUL8/AGL5CF1VDq5rV
 LMqPwxUVHSpaQfdVgbg6ERaVjHLoBCQz4fwxNwRhEe1Nh6kPKIxnqkrhqTKm+HV+4gcSAWvfgX
 KQ8=
X-SBRS: 5.1
X-MesageID: 46437162
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hVQU7KNtUwZPSsBcT1j155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyCMbEZt7eC3ODQKb9Jq7PmgcPY8Ns2jU0dKT2CA5sQnzuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAUqh4mAdzc4t6+pnayDqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA17kwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMkjgYdq3MsiFX5uYdE99HqQ0vF/LA
 AuNrCe2B9uSyLfU5iD1VMfmOBFNx8Ib2W7qktrgL3Z79EZpgEj86O0rPZv1kvoz6hNPKWs0d
 60eJiApIs+OvP+UpgNctvpYfHHRlAlEii8f157HzzcZeo60iX22uDKCfMOlbuXRKA=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46437162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6TxloC/ZUdNwxGwQwBq/eyjJ5R76GktaZxZ94lQWn1O6biQl6Mw+qaiIVbKO4BAF8v3+ZMEtTe2lbx6p34EPE8zj0cezvSOlbPY4hkHoz4P4HaeEjojhpazWnzfQfGNkAq2NFxzBCF7mO+3iQKnbXJ21d21l0fyoKCmwRdg6ZnX/FrUHrHoWwYIPNTO6ICIAh77D4xyVJnhsZa4QBP06pEHH5UPJtH4xmr5xraz/F2aUfkmMUdglJTyBjy9nzGhPkkhmyfTjV7HMc+7epv3tvlFWILi0EQGJIOoFFlEXeQM82GB5FWf1kQT7h6WdFBpcWSQ1eaQnf8bMg0Ig5dHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH60yatl15MpGt996L4jLcBhtfAOcyMFE8gReOfSrQY=;
 b=buXyCD4QbhV2BqDb5YWdHDB8YapfdL7uEbTEPIdo054cwbvs6UtC8fZv+Gv+YE9Bg/y2JYmSa8M2Yt/SCSGBTesWQ7c0Kp+pOuFcR3SvopY1AgrlEWFIUNHnRM/gf0c+5m/TQ4lVm0JqTMv7eTjDfMCX8oM4V/b92Q+5Y2OiyzJrGOYa877eMTEBfGtg9qSZkJ52uNtgZMiOUhWTDRYZY/FR5tLRTDF2ST4iorqpr6W6IIOWoabW/RdtPxSHeXVE8c4f+ejJkdVipCyyZcjd0pXcZjKxbs8xQqxHCz0szJTtjKgDl1AfXIQGksAItX0Aj64bri9HNDwfe8kOqDOaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH60yatl15MpGt996L4jLcBhtfAOcyMFE8gReOfSrQY=;
 b=ln3wsUiOGZofd+U3HAF2DLTDmFaSEkGObmITdqiI5G+GYZN5mClgwjGIoaG3hpm20mjfc529kfEDVz8UY992SBF4fPAOz8/vSteGL3zJsW6rerIQz8yxHrKy/AtbaCZNuJuYF3+yq7GunHsIeke4aUALAJeLpH7tsebXpsCHvEU=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-2-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] xsm: refactor xsm_ops handling
Message-ID: <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
Date: Fri, 18 Jun 2021 12:34:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfff7f0-7335-42f0-8618-08d9324d1dbb
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4967443E9C8052A77E5FB8CFBA0D9@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nyCYyE2kuPODr0LWpNdmQjc+iHebVaG5EBGuIyKYLqSVhFR8UYR6liC1NlYYwHSJxr8x71nNd7Hx2mcJ1GqXHYkocKGPT4HNB9DGDZp8QmM3LZsuEx3ygCE5ydRRKCJ5HaAifrkaWHrZO8qQPmHpgTom1v1KuteiBq2zvvapIqfZh9YboM4kS4m1wMNRy5BYAWg1bHyW8jy/ogksz4RPfxhTe8n4QTlJuhs6CnMtRLPg5U4vkngcNZA+vO+aPsMrGgm2YZBWWoBBSofmkSbGS3vkaJvdbcQO0P0BSADp/NMX+AvH3r1QqiQdNVA/gjd/QiEtGKjMffWJbui1LtpW+XI0T6mRqIQW3T4pAEP9jm3ojYXQHLWjLA0NRVWvoyCr8rOEMgABpX3d5nPIR/lOG6P6ic9MYXYaLpa3yLIoY4QnRgXnrm0nswuzc/u8qwsk2yfbzJhJx1uAiGXnlRgBAyFKYDpR8sIwOONRiqejjvqrTyNzkBjlXLKYkeca7OwteJTTbzb5NJQB299vA8vMDWR+CRXfMdnvflVDt4zUwjSIOt04cWsNYcl6xGHRsNqVnZ+6Koa9e1CM2y+jsdjrLDP909xjiWfE+kwyPKNByH3q2PGbxZQjhlSLLocZajo4cj3iE6js+lRpRlsaybCXeHqkAVHz9JQb04qH1RtL6yRS371ohAAPhsgAWt11yISx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(83380400001)(8676002)(86362001)(2616005)(478600001)(956004)(36756003)(38100700002)(186003)(31696002)(53546011)(66476007)(16526019)(6666004)(66556008)(16576012)(6486002)(31686004)(66946007)(316002)(8936002)(5660300002)(2906002)(54906003)(4326008)(26005)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JRb1NvQWszajN1TFJSa3d1OVYyRTUzTGgrd1pvb3BMeGQ5TEM5SG01TzJp?=
 =?utf-8?B?ZWJtOUZvV2NYeUdGdXM5NWFjQmsrd3JCT0pHOWk5dTFPdmdzOTQyWE44L0NN?=
 =?utf-8?B?SDArajd3RnBxaElqL3pEeGZtYmFiVERNcUYzV0h4eUxCUU1vc2sybUlxazRK?=
 =?utf-8?B?N29GNlhybGZLa3RSeEpBOHozalN5ZUxaQmJ0RUZVVDBhODRvQzhuMTFUeHE3?=
 =?utf-8?B?Qmk3TnE2ZHZ6VS9CQ0dQaGhHSE4wMDhTSWhNcXpPYmJtNXVkZlBya0dUTUVy?=
 =?utf-8?B?em5RSDQwWHlpNDBwT0xaUFZFS1dROGlCajhoa1JVVlpmUTNMY05GNjRwYktN?=
 =?utf-8?B?M0sxdnNydlNIa2R5a0h6VldwaGIzS09Fb0J2V1JnWUJuenZKakc0ZUcwczU1?=
 =?utf-8?B?WkpmckpnOWZMcmt0dWRvMFZsd2VGejhwZldvazU3UEtpeTlSMEtqaHZTS0c4?=
 =?utf-8?B?dXFaMUZEd1Jwd3RyR1diZkxyREpoOUdZK0pyN1JXUkg2Z2l2QndCbGNaVEJD?=
 =?utf-8?B?VGJnVmdqdVE1UnNXZkY2Q3RtTjhHcUtrSHBtc3pDOHltUG1ITGtqWDNUVFk0?=
 =?utf-8?B?VVhLOXBoREQ0UzBHbWQzSENiK1lhcitkM2x0M0k1OFFuVm84ZWJLaktDSlJu?=
 =?utf-8?B?N2lRY056M0NwemZueTZyUUhpaFlZZHNOc2kwVXNsZHVaUmxIaXNiZis4L2pV?=
 =?utf-8?B?YndTbkt2c1JNU0xoL2M4NklXNXp0NnFxalhieFBJdHU3dHIvT3hweEljd2xz?=
 =?utf-8?B?bk5aM2hhSUVGOWtDZlYyOW5PbGZ2M0ZlNzdReVduWjlMeWx0elBzWkJTNWxP?=
 =?utf-8?B?RmlaN2F0ZkFEenVKSXFUdVNjZTZGSFNJRzZsNXRiSGtiTzdhOS9CM0p6di9h?=
 =?utf-8?B?cmwzNkhFaHp0Q3ErMlpDWGVlVUdoQzhBOG5DNzdoVGphR3FUM1NEWmRoQlYz?=
 =?utf-8?B?TlVnbTM0QUtRY21IOWsvU28vU1d2cnpTbmh6ak5uUnljei9vMzNYQTRIb3ZR?=
 =?utf-8?B?ZjBqWGFlMFI5ckk0a3N0YzcybzdOOTdrc3hiMmh5K2puSmgvN09peTBLak02?=
 =?utf-8?B?dGlyZEpZRk10U3MyRUtQdStCZUVLWHVRR3JKV1hTZ3pVakE2cHF2ellFM1Ri?=
 =?utf-8?B?V09zZ1dyV1RoTSt0SUFTSm10Y3p0UlllRlJmc1Y3TkpOaHp3aFB0eGNiMTZq?=
 =?utf-8?B?VDNkVUVNamhiM2pXMjdVaElCOTlFRm9sZHlXL1IyTkxqT1A4WWJBZ1pFbk0y?=
 =?utf-8?B?SWdEM3dKVjlONEV1UTdaU3hVSitiQkdpWGdkeC9zclV4V1hhcUVwMldLVUd3?=
 =?utf-8?B?ejBHRmRLbkdVS09kK3U5eU1WTlUranU2K1NTbm5LK2xhdUw1akdDanhFd2Zn?=
 =?utf-8?B?djNRZWFweHBEVG8vRWdrc1MrWnF3SWJwbjUxL2J6cUVLT0x2REMzUXBMaXZa?=
 =?utf-8?B?TzJ3OWtVbC9JQ3hZRVRFS2Z6aGVxQXhhM3lxaGZ2TFU1bDlsR0MxU0lHYVll?=
 =?utf-8?B?bDZwVXhvcXpuQ0IvRDBzRmZRUWtlT1gyWVd1NjlMQ1hnRXJLZUNHbVk1dS9l?=
 =?utf-8?B?dFJqWlZON0txMUROTFQ4eEtxckdhclhjdDdmbytIb2JJWEtFZzhYZGhOYUlh?=
 =?utf-8?B?TnorWTJTd2JPR09sczBaeTBIT3lDMm9lOHhkc2gzN1dSMHBIazI4ZEN6UWVB?=
 =?utf-8?B?QTVYUCttcU5idVliL3RMdXJyc0d5YVhxK09oeDZ0VEQwLzhpajVFcTBKcWxE?=
 =?utf-8?Q?8gC0FBRa8yX2TQn9szYFgoGDRmq0PeDN9fLSBJt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfff7f0-7335-42f0-8618-08d9324d1dbb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:35:04.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEygO8U3NgOdEj77frY4wLPSYG8V/KOAUVvX3Tc1WJlwdRGx9rxyMsNTKhXO605cL1tM54On9DbW1yAzjS68iMZ1YDmrVghm1T7RU6gll0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On 18/06/2021 00:39, Daniel P. Smith wrote:
> The assignment and setup of xsm_ops structure was refactored to make it a
> one-time assignment. The calling of the xsm_ops were refactored to use th=
e
> alternate_call framework to reduce the need for retpolines.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I think the commit message needs a little more explanation for anyone
doing code archaeology.

AFAICT, the current infrastructure has some (incomplete?) support for
Flask to unload itself as the security engine, which doesn't sounds like
a clever thing in general.

What we do here is make a semantic change to say that the security
engine (Dummy, Flask or SILO) gets chosen once during boot, and is
immutable thereafter.=C2=A0 This is better from a security standpoint (no
accidentally unloading Flask at runtime), and allows for the use of the
alternative_vcall() infrastructure to drop all the function pointer calls.

Does that about sum things up?

> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
> index 01e52138a1..df9fcc1d6d 100644
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -225,26 +225,7 @@ static int flask_security_sid(struct xen_flask_sid_c=
ontext *arg)
> =20
>  static int flask_disable(void)
>  {
> -    static int flask_disabled =3D 0;
> -
> -    if ( ss_initialized )
> -    {
> -        /* Not permitted after initial policy load. */
> -        return -EINVAL;
> -    }
> -
> -    if ( flask_disabled )
> -    {
> -        /* Only do this once. */
> -        return -EINVAL;
> -    }
> -
> -    printk("Flask:  Disabled at runtime.\n");
> -
> -    flask_disabled =3D 1;
> -
> -    /* Reset xsm_ops to the original module. */
> -    xsm_ops =3D &dummy_xsm_ops;
> +    printk("Flask:  Disabling is not supported.\n");

Judging by this, should this patch be split up more?

I think you want to remove FLASK_DISABLE (and this function too - just
return -EOPNOTSUPP in the parent) as a separate explained change (as it
is a logical change in how Flask works).

The second patch wants to be the rest, which changes the indirection of
xsm_ops and converts to vcall().=C2=A0 This is a fairly mechanical change
without semantic changes.

I'm unsure if you want a 3rd patch in the middle, separating the
xsm_core_init() juggling, with the "switch to using vcall()".=C2=A0 It migh=
t
be a good idea for more easily demonstrating the changes, but I'll leave
it to your judgement.

> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index 5eab21e1b1..acc1af7166 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
>  static int __init xsm_core_init(const void *policy_buffer, size_t policy=
_size)
>  {
>  #ifdef CONFIG_XSM_FLASK_POLICY
> @@ -87,17 +86,22 @@ static int __init xsm_core_init(const void *policy_bu=
ffer, size_t policy_size)
>      }
>  #endif
> =20
> -    if ( verify(&dummy_xsm_ops) )
> +    if ( xsm_ops_registered !=3D XSM_OPS_UNREGISTERED )
>      {
> -        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
> +        printk(XENLOG_ERR
> +            "Could not init XSM, xsm_ops register already attempted\n");

Indentation.

>          return -EIO;
>      }
> =20
> -    xsm_ops =3D &dummy_xsm_ops;
> +    /* install the dummy ops as default to ensure ops
> +     * are defined if requested policy fails init
> +     */
> +    xsm_fixup_ops(&xsm_ops);

/* Comment style. */

or

/*
=C2=A0* Multi-
=C2=A0* line comment style.
=C2=A0*/

>      switch ( xsm_bootparam )
>      {
>      case XSM_BOOTPARAM_DUMMY:
> +        xsm_ops_registered =3D XSM_OPS_REGISTERED;
>          break;
> =20
>      case XSM_BOOTPARAM_FLASK:
> @@ -113,6 +117,9 @@ static int __init xsm_core_init(const void *policy_bu=
ffer, size_t policy_size)
>          break;
>      }
> =20
> +    if ( xsm_ops_registered !=3D XSM_OPS_REGISTERED )
> +        xsm_ops_registered =3D XSM_OPS_REG_FAILED;
> +
>      return 0;
>  }
> =20
> @@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
> =20
>  int __init register_xsm(struct xsm_operations *ops)
>  {
> -    if ( verify(ops) )
> +    if ( xsm_ops_registered !=3D XSM_OPS_UNREGISTERED )
> +        return -EAGAIN;

I know you moved this around the function, but it really isn't -EAGAIN
material any more.=C2=A0 It's "too late - nope".

-EEXIST is probably best for "I'm never going to tolerate another call".

> +
> +    if ( !ops )
>      {
> -        printk(XENLOG_ERR "Could not verify xsm_operations structure\n")=
;
> +        xsm_ops_registered =3D XSM_OPS_REG_FAILED;
> +        printk(XENLOG_ERR "Invalid xsm_operations structure registered\n=
");
>          return -EINVAL;

Honestly, I'd be half tempted to declare register_xsm() with
__nonnull(0) and let the compiler reject any attempt to pass a NULL ops
pointer.

Both callers pass a pointer to a static singleton objects.

>      }
> =20
> -    if ( xsm_ops !=3D &dummy_xsm_ops )
> -        return -EAGAIN;
> +    /* use dummy ops for any empty ops */
> +    xsm_fixup_ops(ops);

Isn't this redundant with the call in xsm_core_init(), seeing as
register_xsm() must be nested within the switch statement?

> -    xsm_ops =3D ops;
> +    xsm_ops =3D *ops;
> +    xsm_ops_registered =3D XSM_OPS_REGISTERED;
> =20
>      return 0;
>  }

Having got to the end, the xsm_core_init() vs register_xsm() dynamic is
quite weird.

I think it would result in clearer code to have init_{flask,silo}()
return pointers to their struct xsm_operations *, and let
xsm_core_init() do the copy in to xsm_ops.=C2=A0 This reduces the scope of
xsm_ops_state to this function only, and gets rid of at least one
runtime panic() call which is dead code.

If you were to go with this approach, you'd definitely want to split
into the 3-patch approach.

~Andrew


