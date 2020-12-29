Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547D2E6FE3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59817.104881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuD09-0001Yy-L1; Tue, 29 Dec 2020 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59817.104881; Tue, 29 Dec 2020 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuD09-0001YY-Hr; Tue, 29 Dec 2020 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 59817;
 Tue, 29 Dec 2020 11:17:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuD07-0001YS-La
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:17:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2fb5dfb-6cb6-47e0-ba89-76567fa31b55;
 Tue, 29 Dec 2020 11:17:14 +0000 (UTC)
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
X-Inumbo-ID: b2fb5dfb-6cb6-47e0-ba89-76567fa31b55
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609240634;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tKi6WVy8JGcWX7mELf68LwkylVDN5qGoRhGV6Rsq2G4=;
  b=Sbx4Jaxj2WzQzcCmcsJavJgRDjYheg2QxyMk+nz7QHMfsQORuFqPfvyo
   K/FxIrLnBcPl5s1vtIgMcj+33FW+tysU8QvpzM8q2/QULCozYj887CxbG
   NxWbSm3Q2fYxKVoyBD+Qotdv8CMAkQgO8L9lFS5vO4FyhCufhyP7YMC/P
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jDV2AChY3DbDSZT9Opbje4fij5JxFllxkduPIm6bB10XKrtXiEUlviSDM9KvOj64hdYP8YzWBq
 NVqxDJOiyeqr7puiI/Ffhrku4o1V4KOoj5+sToymsyGA8yVql2P6fh7MmmL1cwwrfLPag3hfr7
 yUQqySx0vw0qkMWG0ZSULti+kAXTDMoYrqQIlWRO0XHS/LVhStCraDJC4hZqK2iDi881jpAocC
 OVZjdRabcl6uGzMJfceYAGRg7r7TL8mQqh+8PomZ44C2ECLl8SUNrd2WkX14dNl1DrUCUqNY75
 IxY=
X-SBRS: 5.2
X-MesageID: 34446353
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34446353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Upr7IqdTUuZWutNfwPryNvW0gnrzceOaHiosVeoMI1ADAd6FxdMVUDtwj56GZwK8YrbgD3ampER2hrbBB7wunxhc9T+LoxQGetu9EBQBh9befQXiL+RFjyHNXbEysnVZFk8gxyV9/PKKGg/i1cMIzrIC5tKcInzW9i4r4ZPwxVrauKV1KuRXg4/+toDN1AXdRDuVgf8K7qfBlAjoNVT1zSRYIsLTT20oip5briIWRf1nKKQ51YhXC/i54Fg/e4KvTPtVRtVvtFxmdx+pZFn9E2l5XsEarXhOW8NMRwBG7bFQ2KAGV53c1/H3jMNmrbfwZZl7gzJ4X3eHKn36gdyWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov1Q139frdOwLzVShFdI67UTQtd/Yv8O4Yq73lb9p9I=;
 b=DrXHsUAdBsek09GSJ3ysNbGDKH8sNVCKi5oxgXHLDGRU97DtSjaNVavQ+NON4LSbEZYnUpLH/JRl1nYGsfnM5+2hlH+1uEeK2UVmcZnMdJdaciDuTKQmXGcAC8nTjnx9tO0cV9hxoeVJvyOwkhfdTX8OAfvImbLAvePeeQgOhgocYCdVkd4dvC+7qQlrhho0sjhdQzxitb0OhyAGxh4Z9LnkbncYEip+K96SL16yV1SIqRgayXwEwLqFGuEfB8MaIGY1ZUMVL5Ryo1DzQjDlXwVdZDfUMzkzt8nyNDzA6GkZ6DT82+fs42As10d/Y6eZQl0t4kSZ2qxbTTf/C0774A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov1Q139frdOwLzVShFdI67UTQtd/Yv8O4Yq73lb9p9I=;
 b=L8RaR3r1PIsqBElZZfmi35lc/2TBZoVwBPOpewfeLXb7S7ks0ezVGYloXGclwLAG/NJsqLuIxGrvzCfxmREbn2c4wLp86BhpJmCL5UsopFwg+1FMopovDGW2qeZozMSc5lGfPvfI99HN8H3OmtscoD/zI7j4lgcBgnXsN2Rvr5U=
Date: Tue, 29 Dec 2020 12:17:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/24] NetBSD doens't need xenbackendd with xl toolstack
Message-ID: <20201229111707.x7dhxhifydc6rphk@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-3-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-3-bouyer@netbsd.org>
X-ClientProxiedBy: PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c466e9eb-a746-41c9-5d0f-08d8abeb4a26
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-Microsoft-Antispam-PRVS: <DM6PR03MB533941C33E7DEC85CF96142B8FD80@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +U6o87tq2aGowEpHAPGXwmzBN+3LfZG8Y5LAvSW1pXINdm1fRYcj+s9igZwqpBdHn1oPU5fTatrpjWg4NmVEo8CpUUlyfYWhiKrV2x4Uh6Kcvrty48U9cCnBaeFWtrM+6RFKRRfjnTfgre/uRLFkjjIvit282ARe4jX80PP5pIJTMlozrwrU43bLrGrHtWx8QgsIPqkb2/7ozs/dJsMRXDGsGzlzZ9dja5J1LkEpT7Ee9cF5UEBB2l0ofuJ4XPYXJZOTRHYJMMVs4Lxovr5IWZCgjJV9ccuaSBXOFz6XOoFDbRL4dCVfGzx3ZO8SJeUY+KhEasKqgmrTK33zCw2eyMM0vXDC7tpkrv0v6kSH0wCBSJFZibzC2wRzKtgNT19nUX99qHhGVFrN+yY0EnCS5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(85182001)(66476007)(1076003)(4326008)(478600001)(6486002)(4744005)(83380400001)(16526019)(316002)(186003)(86362001)(9686003)(956004)(26005)(2906002)(6496006)(6916009)(8676002)(66946007)(8936002)(5660300002)(66556008)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1lOdG5LYytYVTlLU2hnSUxYTk44WENiUzV3ZHpicExZUVdkR1dvQ0dhZkJa?=
 =?utf-8?B?K09GMm90TDNTU1VwTW0zR2hqWkhOV1JOTlljS2FYL3JTdkpNaE1Ta2NyNksr?=
 =?utf-8?B?bFh2b2FTQVZpNnptUjJHdHV2NUo0VlNwZjEzaDJIQ29IeG9ZSkpvdVlzcVlT?=
 =?utf-8?B?N29uY29OTkl1MDMxcXY2ckdpK2F4NUJnU2R4S3JsUnNMQkV3Ukk2aUxsWmwv?=
 =?utf-8?B?RjNiNkRFWCtGZDYrNkZ1M2JHNHVYNzFvSUxlVjAwakFKSDhDSHh5UTV1cS9W?=
 =?utf-8?B?YjBxMEthRHM0NUxRV2hvVlJPS3FKTGZ5TkJDSjRReU9qcXcvZnA5WC9jRkZv?=
 =?utf-8?B?dnZNa3g2RlZ6dnp2RXhzOHdPbzVKR3o5Tkcxa2plRktra21qcFdDaURUTHZL?=
 =?utf-8?B?b1d1dlIvdkNGcGhCVDVZdjAxQjd6dFE5clB5RzFDNkNqZXc0Ry9CeEo5NTNj?=
 =?utf-8?B?VFNJdmRJMzZkZUd4RVlvdjhVN0k3NUNIdGg4S2h6N3paNVBNQ2tQNzZDaXR4?=
 =?utf-8?B?dXUzWDBab2FQdGJ0bUl1T3ZnN3hYU0tJT1ZPc1NUdDlHbHcyOUNJM3dIWTVr?=
 =?utf-8?B?TDFzRVdncG5XRDhIaGZUK2x5U1JMb2VTbVk3STRQVHA0L3Q1QWo3VWM0VEt4?=
 =?utf-8?B?SDdkMGFqODZ0L2dqWWl3SnFpam5FZVlhMDl2MHNmSW05Y2szU2dTcjZaS2Yv?=
 =?utf-8?B?UzBnRFNsVDZ0UWE1eExQV3F1S3N4cUN5N3hzM1BST2IralppQis2MzZTb2VN?=
 =?utf-8?B?dFhyaTJoVlpodk5XZElIc1VSQlNOVnhkaXhDQ25kMThoUFphZ3cra2xaM3lU?=
 =?utf-8?B?a3YxUGxUbzhnYUk3TlVzYStzQ1dXZ1VJSXZDMFJSMlRJL3lQRklBV0ZYRHhv?=
 =?utf-8?B?T1NENjVSOGJNV3gxMVdGSFAvSEEwZXl0ekdDb2dhekpNTnFtcCtPMG5zQ0RK?=
 =?utf-8?B?NGNFcmlNakNId3Z0MERoVDlyNkxpby9Sek9pR3Q1RWUvZDlYcEFYRmV0MGhE?=
 =?utf-8?B?R3pKK2l6MzJzdFFZd29pMFlXSVIrb2p2cWVvRmdHMmk0NTI4bklQT2tDMVZK?=
 =?utf-8?B?UXI4ZkdqSHBqSklIdnJTSEhuOUx1MTQ3cElDaklyWVNYTnFYWFdwV09zUElX?=
 =?utf-8?B?RDZPVjdQdzZVR3JPa0d2cTc2REtzM2p5VWpZam9NdHZOazVOK1NGWVdTbmdH?=
 =?utf-8?B?U3dNZkRKSzAvZHVRRTVUL1gxT3JqdjZFT2NUWlN5em56eUZaelRodTFENjNN?=
 =?utf-8?B?K3k0MGFTRUkzZ09Vd3E4M0MxaVUxVitKMTVTUVhLK29mZ0lRUVdXL21xTmFV?=
 =?utf-8?Q?lX/ypJYDwkIovhPZTxais0gwBO3FSXXM8y?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:17:12.1432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: c466e9eb-a746-41c9-5d0f-08d8abeb4a26
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYNavMRagL72vPQ9bhlVCW0sq3pIGeslQzlhWNJ3/F/ithAgI3g0F3znQKPLz8kCmPxHqmUWevCiZO3xz4/b8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:01PM +0100, Manuel Bouyer wrote:
> ---
>  tools/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index ed71474421..757a560be0 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -18,7 +18,6 @@ SUBDIRS-$(CONFIG_X86) += firmware
>  SUBDIRS-y += console
>  SUBDIRS-y += xenmon
>  SUBDIRS-y += xentop
> -SUBDIRS-$(CONFIG_NetBSD) += xenbackendd

I think we also want to remove the directory itself, as it would be
dead code at this point.

Thanks, Roger.

