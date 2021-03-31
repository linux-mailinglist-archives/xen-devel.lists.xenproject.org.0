Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7E350089
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 14:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103922.198206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRa9b-0000eK-P4; Wed, 31 Mar 2021 12:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103922.198206; Wed, 31 Mar 2021 12:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRa9b-0000dd-La; Wed, 31 Mar 2021 12:40:59 +0000
Received: by outflank-mailman (input) for mailman id 103922;
 Wed, 31 Mar 2021 12:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRa9Z-0000dY-RE
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 12:40:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d3aa953-2de8-4275-9055-1495d6297cac;
 Wed, 31 Mar 2021 12:40:56 +0000 (UTC)
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
X-Inumbo-ID: 2d3aa953-2de8-4275-9055-1495d6297cac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617194456;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VI1BaDzdGEH0/h8DyWQp/5UDPEGnm+1gbpkZaCAIqXA=;
  b=P6mb/PtJmF3u7Js8MFCoh+3RNSxEftiSr2L2VE/uauqFknAib416n9Ek
   WsRnhLvwCJnPxilpr/ZiHbCyi+/DmA3eTpTEpxQVG6+zf/DF5QnK42CO2
   ywa4OM1iBjC/FEBndaBbGu/uL8ql8cwinyu+GST6MM0qDTw9IEdq9kcEz
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wu05XjAmR21AP2/1oGk25oWh0v8R/kcTJo3lZDqnMiRvanMp/6+5gU/uIHNpeop3fQRy8LD77P
 +34Zjsb0ZiqO+/trdoRjRoKcaVbOBKNuVqUNsPV4bqsSStvn+30YFZzDnBkg79Hi51MJlRCXCP
 Ynx37DrnKRzT7RM6vhpmURt+13iVFz7C3mqNjz1U7vnIt8dqr/qY7ZXoW35yniIR7YrjcHv1V6
 WQ9p4543gPHaT3UL7SKWZZ5GsepTGLTtjr0cgXTF1wxef1oFhXBy+bRNvDsFXgfC34sKfxCszg
 Yq4=
X-SBRS: 5.2
X-MesageID: 40427375
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vJpWcKAyCcUC0nXlHeiusceALOonbusQ8zAX/mh6QxBNb4i8n8
 ehgPwU2XbP+VEscVk9hNGNP7SBS3vA9ZhzpbIcJ6umQROOggCVBatJhLGM/xTLHSri+ulBkY
 JpdKZjANP9ZGIK6/rSyg++Dtom3Z274Lml7N2utEtFYAl2Z8hbnmREIymBFEkefmR7LLo/UK
 GR/89W4wenEE5nCviTJmICWNHEvMCOrr/cCCRtOzcCyC2jyQyl86T7FR/w5GZlbxpqza05+W
 bI1yzVj5/T0c2T8RPX22/N45k+orKI9vJ5CMOBkcQTIDn34zzYAbhJYaGIvzw+vYiUhmoCrd
 jWrx8se+R15n/BF1vUnTLR2hLt2Dtr1nn6yVXwuxreiPH+LQhXN+NxwaZiNjrQ8Q4Jocx12q
 Mj5RPhi7NnSTf72Bnby/eNfRdwjUawqWclioco/gRieLpbUYYUlJcY9k9YCo0NEUvBmf0aLN
 U=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40427375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJdSmOwMrEAEeJefgfKC32UfBtTSHOAeKDI9IuNTztc5w8AFlXQ6cyRU49iijapj/pgpIaILunY9Tij3KhiMxTsmxbtBFn6dcgnZVboUc0dG1wz1ZxMkcVOwjPOXqW0crqGQdRcFgqpSuPAAPuiNH+BJoU5OLqFtSrY+cgvQkJ6ybFI+dC1SPG3r7lW/dtwi3w160pCHfd9ii3Miav4y6G9MknuwwYLxwgjl49h63sRSKaMPxYTzGh4P3nFMfsJ+Irkjd3UrBlrPuOmcZ3yWFDQS9agYVHFUi3I2HlaAk3hJ+H3PY7pxT2s7L4mvtWfWi53rqKyruoHCmQrVOs0RmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3jKF5UtqvNsukXx9qzN4zUUHNJt1+ocQm6kZ7n3yQw=;
 b=HGQXPMdGe7i8yvpT471GFcqms2qxTfuGwv4DKXXHJ//cx7gwrMFBx/iprx6tuY0LN1130awHvtgS61RSNa1pJnYMH51MwlMnD6WdJ1rTf48nL5LZYUJI7GMN5REBEgdFR2bJ2RHc9kj3hQws0+mH8zVzG5bOUGKPu4G6KIIx+DiQiCouNgwXE95GL9EhEEbh9lothAODGrD9W+3Rg1Z223OYAUgQ7BZwvax3y7awvy0GCpa17DtEyseW7taPK2yP3aGjIeoif9pjZjAr78OzsIaN14eSMszdEOqiNKuZmvcfp31PJbk2VZmzdzKYk5n/0v5J144dzL7rnuMfutM0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3jKF5UtqvNsukXx9qzN4zUUHNJt1+ocQm6kZ7n3yQw=;
 b=oVHuVxmeRb7o10Xr3yDXRRddeiVItUwU8rN5aqnnhxHhCB7X+lRGUDkmQISX5P4mpb3Zh+AYlwG3yk8Di3tUsPSQuatxxjMG7ycK75ZGSf1SF7dOgPiJPZs5aq2PpfCD2VSwojPWYVmJ846+zFKG0meIojsnODoBSFJJO6Oj9DA=
Date: Wed, 31 Mar 2021 14:40:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
Message-ID: <YGRtzlUmuRjKh6er@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-15-roger.pau@citrix.com>
 <8f7a2f44-c006-0f94-8f44-b6b3ee3e9d1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f7a2f44-c006-0f94-8f44-b6b3ee3e9d1f@suse.com>
X-ClientProxiedBy: PR0P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e8d62ac-7473-4134-c4a5-08d8f4423887
X-MS-TrafficTypeDiagnostic: DM6PR03MB4300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB430005511F01BCB913B9641B8F7C9@DM6PR03MB4300.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XzqohaF1fBhU/KBzczyu0FqYrsmm3QPmNWzJ+ykavWPAcEcxuXaxrWJvNv9oshnHtxNgq+jZDmD58XMFOO85ctM8CBwwmpkFaErpIXCDgPi1aspU9C2363rFFwYlkEgDudP9CGtUNFXCXUEJkMGovjU/ZLARxeNmpoQSxnCbyRODjMUL4CO//ATLuNNXySD7Wmfvyf7D7SFAvRD9lxMQr5RuSEEGIMWtgGLuaA04zKRi9N33gRbORqpRbLvQO0OxQp6suEq0738nM2ao5MUt6XwOeYXCHxTEDw6uVHJ8NaPi1sukCgmwDWaUyclsm3xzbdI0qEfysGTS9T37zdjWpQwslcckpTuefG/gRaACYVV1nET3iq6FW+LNKCaCGjll/UK+1IiAdIwPg1NEzmpO/lqYNgR2jlIwnS6IPWwJAD9RbrEiEjm9n+G3koDCXYCK8xdp62iMHVveYhpj5AzIsh5u04UsVGaWK7+qVfjCqnnczwQbihkKTB6+/nCv9G9fB+cuX3j7RRjYWBuVdzsc8HtS2md211BKFcJYqxYTCcagMvcw5g94cIjH0yPxtjk4g9A9hI4UxIHQ3EFDwv7r0Id1N0Ww6dbF4Hh97JOQ7HVq6PlRQp/Ih/OjoPn+bnBUiE2qtQDpoBPDNY4ENooFag2d9W9tB+0X9YqcGh7R0wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(53546011)(478600001)(6916009)(16526019)(66556008)(66946007)(9686003)(85182001)(66476007)(6486002)(33716001)(38100700001)(2906002)(4326008)(86362001)(5660300002)(6666004)(83380400001)(186003)(316002)(6496006)(8936002)(8676002)(54906003)(26005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wk80V2NwazYwNDJoL1lGaXE3N096Q2xEYWhOZTFTa1lWWEFIMDJEUWg4UE5P?=
 =?utf-8?B?eFFvUk9ndTBUdTNHeHdVUzRMQVlBS2ZDenZKKzEwbytjQWxsWFFQY2puM3pV?=
 =?utf-8?B?Rk1XbURYeGV2UHprMis2Zi9IZlppVWltcVo5TkZVOE5tWEQ5OWJUYUFYVVhN?=
 =?utf-8?B?SkFHQitmUzBqVnlCRGc3NDNRT0NUeTNPSHNTTlhoNnhEb0JTcldwb1ppN2h6?=
 =?utf-8?B?MUhLVWJuT0JiY2ovNEIzM3JRMk0vV0s5Qno1clJGNzh5UVQ1enVoRTJHOVVi?=
 =?utf-8?B?cUppWFVxb0pLdkZ3NkxDVExYV0prOU5SVk9NczNBc0dJdUlrbE5xU3Z0bEky?=
 =?utf-8?B?V3BZU2tpZUJIaVJQazdtYk5uWVNnTEtPSFRiUVFiSVh0VzFDaUF1UlNyMjBS?=
 =?utf-8?B?eHhESVlLR0ZQSG9xTVY3aDd3YklqWktoZnBGeFg4dW5UNkRnUzBwekRKd3Fv?=
 =?utf-8?B?QTJ0QlphV0dyZWowZUJqOHp0Zi9BUXFHcTJmdy9DNExWejcrVE5qZ3lQc2ow?=
 =?utf-8?B?ZEU3QnJRanFHMEc0dDRLQ0lMaytSRTVUWEE3VDFsVDFnaVYvZ1c2cWNWTDJk?=
 =?utf-8?B?M2Q2YlNDSjdDSmxWTHoySitqaldDVEpTbnA5R0cwNE55UXZiSGJIeUlyTk9k?=
 =?utf-8?B?L0phNnRpTVFXTHlxNy91QWRZWDR5bGFJT25LZmkxeFBvb0FmZWZWakZ2MXZa?=
 =?utf-8?B?S0hsbll3akk3eFRnZ09ORC82a1Q0alRoLzhVMGdwK1B0dnFVUzZ5UDliYTdl?=
 =?utf-8?B?cW00cnhtdS96emNFb29vS0lYR3FWdGhHN1VrcVRjQ05PTVl2NHhsK2FJaFNu?=
 =?utf-8?B?Nk5iRzVDb3ZvcUw0Z2kzWkx2WnZEK3V3Q2JsSElUbkZRZkg4VXVsUVhRc3NG?=
 =?utf-8?B?UGFUMm5uN1lTN0UvZVhYdlVDSGFqdllxczN0bTdnckFobm1Uc1ZZaVA2cVVx?=
 =?utf-8?B?cE5XZmwrWVlQSWN2cHJYcXQ2VjVnUDFUc2FaMHJ1MTdJZDRHMUMyNllma3Mv?=
 =?utf-8?B?SUN6S3ZOQmdwakIvdTM3c1Z2Zmw5dThKZVpGdXF5cWw1aUx0cW83UjQwR1Z2?=
 =?utf-8?B?UjhDS1pKaFp1L0VIc2p6QzgzZjB1NmdiK2M0ZFhFbldvYUVFSFBQbDdIcCtL?=
 =?utf-8?B?dUVobC9sZnRwbHVwSkExRzJabGdjRngvUm9yYjZzM2dhdGJSVDBzeitWdDV0?=
 =?utf-8?B?cWFHZG9pN3ZjcTlsWW1hNkk5U3R2SUFsaWoyWmNqTi9jdzdDNXYrTXg3a3V2?=
 =?utf-8?B?cERuaExwZ05FbURPR2h0SXN3dWFQNzVIZlU2NWV4d3BtYWN4ZXBCdHVuN1F1?=
 =?utf-8?B?N0lsQ2R6K3J0RUZ2T3lFS1YvRG1OVHQwVEZ5S2xyQ2hFR1Y4bVViVFRXdHMv?=
 =?utf-8?B?UnhrUVMzWTF1enJuODZFV3RmZ2pwZlRzWWJ0aVZCTTFiZm5BcGpzWHQvaUpR?=
 =?utf-8?B?TGcvcS9ZeFBXTEdLUGNYVlJXQnh2Vjd6RHhKRXo2b1BhbG9vdHR2OGNLWHVa?=
 =?utf-8?B?U0FtaHRaeHJHUFQ5dk5kcWFVOVRKNnJYUTVQNmlmNjVyRHlVS3B6cjBpZERo?=
 =?utf-8?B?amxiWE9KNnJYYUVPYlNMcDMzd2RWdC9yZVdLdmVNREhHTXRyc2J6aFJRYzA4?=
 =?utf-8?B?MC83OXhGTzQ4cXpST2hYTEhHRUQ3Mkg4OGtLdlNNSGZaUktERWZ3bENFYVpX?=
 =?utf-8?B?UEFqQ3Fjb284OGdxZkZ3VzYyTnFqWFQyL1FVditMT1A3NXVaWThnQWVxZnJI?=
 =?utf-8?B?SVZMYmRwc2o1bm9lVDFWdU9ZNFFvWGt5QW55S0pNNW9mNHpTaG1qOWw3dVZX?=
 =?utf-8?B?VXhmTmpLN0NCTlM4cER5UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8d62ac-7473-4134-c4a5-08d8f4423887
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:40:52.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmF+4ZbiN61boKFUPPkjZDhUsMGSBwH7vumMxqLLVsShPVpzAGU0KsAXNTZljbtbm7WyrCJBqFMsjiv955sGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4300
X-OriginatorOrg: citrix.com

On Tue, Mar 30, 2021 at 06:02:45PM +0200, Jan Beulich wrote:
> On 23.03.2021 10:58, Roger Pau Monne wrote:
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -1098,3 +1098,20 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
> >      return rc;
> >  
> >  }
> > +
> > +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
> > +                                 const xc_cpu_policy_t p2)
> > +{
> > +    struct cpu_policy_errors err;
> 
> Don't you need an initializer here for ...
> 
> > +    int rc = x86_cpu_policies_are_compatible(p1, p2, &err);
> > +
> > +    if ( !rc )
> > +        return true;
> > +
> > +    if ( err.leaf != -1 )
> > +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
> > +    if ( err.msr != -1 )
> > +        ERROR("MSR index %#x is not compatible", err.msr);
> 
> ... these checks to have a chance of actually triggering? (I'm also
> not certain -1 is a good indicator, but I guess we have been using it
> elsewhere as well.)

Well, this is strictly the error path, at which point I would expect
err to be properly set by x86_cpu_policies_are_compatible. I can
however initialize err for safety here.

Thanks, Roger.

