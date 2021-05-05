Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16B3735F4
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122886.231833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCTK-0005yf-O4; Wed, 05 May 2021 08:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122886.231833; Wed, 05 May 2021 08:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCTK-0005vp-Jw; Wed, 05 May 2021 08:01:30 +0000
Received: by outflank-mailman (input) for mailman id 122886;
 Wed, 05 May 2021 08:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leCTI-0005vh-PB
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:01:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 271df542-3632-4be8-8043-8d125720b3e4;
 Wed, 05 May 2021 08:01:27 +0000 (UTC)
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
X-Inumbo-ID: 271df542-3632-4be8-8043-8d125720b3e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620201687;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gg18pS8brqT35WAEWCpQir4yYIiVZjlmuHhONyMFmDs=;
  b=PoCsN5kVmYcQYkVO+2SnI8gIqr30gf6WmijRYX43EVhcCf/RtEJDYTQl
   YTyhdnESuLJlaz/t1b+Wv0bgRqll5708txe0yvBeZWf6tsvuR3Uou9bl6
   Xxyg+Ct9lTM2e+Nzq+WluS1Q1cIYrsuiS7+WKWKSeePTycCFBqPVZAc73
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PTho5+iTmy5MtKq9ynOtufHZtKEPo54/U3bo2URdiEblnpiBbsVzD64LqJwkhXhS4hCUprsNtK
 BD09icODCz+0kFWCKK3KYDWTD5dtICNN52F4gEz0qCpYKpgVh5HWvXJxxR9h/VxxSGrDn9HJyD
 OS+QZyXGnKksIIJ5IGDcV4frGAd69WvfwDyWsSjKNzEpMou5jo+Wm76EkpM3/tp9ceNH1k1RlP
 w5gXVjKJn+8b5x0WnYUJNGDB+Z6JzIlZjnbHeGy1NHoTQjErjtlElYC9kPgsfOCeNVkRNa9eh4
 2KY=
X-SBRS: 5.1
X-MesageID: 43479518
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IEe5sqGXYh4gsWBMpLqFWpTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYeNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nE/iTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmSl9z0ZVC5CxqpnzH
 jdn2XCl9+emtyY6juZ7W/c6JxKhMDso+EjOOWggtUYQw+c7zqAS59mX9S5zVQIicGprG0nid
 zd5yonVv4DlE/5WkGQjV/T1xL70DAogkWSumOwpXf4u8T2SHYbJqN69PpkWyDU4UYho91wuZ
 gjtwny2us1fHGw6RjV3NTGWwpnkUC5uxMZ4JUupkdSTJcEb/tppZEflXklYKsoJj7w64wsDY
 BVfbjhzctRGGnqCEzxjy1ExdyhWWkLBRGWQkQOkdz96UkmoFlJi2Qf38ARhXEG6dYUTIRF/f
 3NNuBSmKhJVdJ+V9MzOM4xBe+MTkDdSxPFN2yfZXzhCaE8InrI77r6+q886u2GcIEBpaFC1q
 jpYRd9jyofakjuAcqB0Nlg6RbWWliwWjzr14V3+4V5kqeUfsupDQSzDHQV1+ewqfQWBcPWH9
 ypPohNPvPlJWzyXa5UwgzFXYVII3V2arxUhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRl
 QZWjzeI9hB81CLVnf0jAO5YQKpRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbR1O25ZGOH
 dWEffCqOeWtGO29WHH4yFCIRxGFHtY573mTjdvrQ8OOEXkTKYbt7ykCCdv9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iFW6GkX0JpjavQ40HkqOOoefpE6lIT6oOaehUL0HmBhZ1kQFlpC
 NocwkfXHLSETvolOGCl5wbBObWcvFmmwe1KctoqXbS3H/s5/0Hdz8+ZXqDQMSXiQEhS35/nV
 tq6ZISh7KGhHKSM2cluf85N1dNcWyTJ7pDAG2+FcNps4GuXDs1YXaBhDSchR12Xmbx7U0dil
 bsKjCudejRDkBQvW1Z1ajW4Ep5H1/tDX5YWzRfi8lQBG7GsnF83auwaq2/33C4R3ECzuseWQ
 u1Kwc6E0dL/ZSaxRSVkDGNGTEa3Z0oJPXaF6lmWarUwGmRJIqBkrwmE/dY8I1+Ds3ntvYGXI
 ukClaoBQK9L9ls9x2ep34jNiUxlWItlunw3gb5qEe/x3wyDJPpUR1bboBeB+vZyWfqR/yFis
 okyf00uPa9KWX3ZJqtz7rNYztKNxPUpiqXQogT2OdplJN3kIE2OZ/RFQbs/jVg+j4VKc/vjk
 MQQKhh+tn6S8RSVv1XXxgcx0YjkdSEEVAivQP3CNIvZF1FtQ6uA/q5p57z7Yc1CkKPpAHMKU
 CS3i1U8fDCRTaC39chetQNCFUTTEg383J5+uyeM6XWFQWxbulGlWDKf0OVQft4SKKfH68XoQ
 s/y9aUn/WPfy69/AzLpzN0LuZv9GmgKPnCTD6kKKpt89agP06LjbbvyMmvjC3vQT/+Un8mv+
 R+BAQtR/UGrCIjgo0x2jWzTaKygntNqSoh3RhX0nj32oan52/HG1phKgOxuOQPYQVu
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43479518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5IxXW0InNJd4AaN4exdlca1FImFOtzxrCm/hNx3ynqIcdjZv/Y+7FaLD92g3aXe3XrKSQjnhPUgICbGeEqlQB7XtvevntA7mIESqLtpIVSlVKGhDZ9xRRroSd7krP0gCezUUbbwItId0FCNaxkkHnuAxE7BAlwH3HQYqDM5j6onWkmZeh0OgGWh8eq5HbkxUyEm/0RtrpkgexJvdufbP2T2n0x9YIJLSHfAyTurjEJmcvXMI0xn9k4Qsij/6GpDH7ZFTaGXezStNEvx2XQL8s5FHlc13/GrSa+UrvVQImS/mlKcju1cnlI73ozYs+dMtitXJ7LcHnfFxMyAX456zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9gY0BlSOmYNsZ6Q0USMZWYQt4dTDFkZiNYIdOeG2Ws=;
 b=oT7dpPlG76HsyDxv/m19TolohsEkqS83rDjYqcOr5/uZxE1HLsfB+wRoXi0hT6fmsFc3UadWjWPdBM49Ilin/jXDLrjuAZOglEpGx9tXoDWP8vir+6tl6iMfW0nzI37h5hm1qN/xDmnB5WcAUQUjYwb4PifthmM+fJad93sT6q8PYpEo7KWV145G0rFi9o3KsF7/pkQwICto2xlhNUg78vch0r0RX4gYw0ebJRbgFOpcA+eBc9ZCwv45cJnuHDGsma39KVw5c0K/kOlPvuK4Jd30ueFJjSW/lxqdGrG60ZzRZq8hld54yQNNRyAvfibzcVD4nSvp8Kom2wK9hg1Lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9gY0BlSOmYNsZ6Q0USMZWYQt4dTDFkZiNYIdOeG2Ws=;
 b=svXUZG96iYPh+zcmOcYF/JZyAhFRLBOGJJsndAXJ+NIOEai4wTSsx60lKCZpH7FpTPlWbHSrO44KoVpPGp8BEvQYAh5l7/2lAkkhAPu3fjwLDSI1kOZzTdFrmaiyDUMkYFuyRlCOraHjOVC9wDS87eNV/dJXGEHUs7HxsndZGnU=
Date: Wed, 5 May 2021 10:01:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/p2m: please Clang after making certain parts HVM-only
Message-ID: <YJJQzJxro7ZnpFuR@Air-de-Roger>
References: <cfac6284-d4ec-af2f-6be4-c114c7c10009@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfac6284-d4ec-af2f-6be4-c114c7c10009@suse.com>
X-ClientProxiedBy: MR2P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b6eb42-c082-472f-b6e8-08d90f9bf9c3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2556B98E98D9F26156BA0BA18F599@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5L3PyEoYsP1ZhwZ4aA1Vo2knP1MBruf1bZMAjKlx+9W0qO/jVdHKjECoPLYQSJMDtc3z556Prm4TFPHI1L1TvHNnbICOx80EztNxnZA+LjNmV257Ezz3BH/xjjExaKdsTTvyW/yWztAcWhtaRX8gEmvLOqERP0GeTAslHn/PcfQ1Q79XDHqL8rNnowEJaa1jQeuIy8gS/dDX2qlaQ/xmH96K/0cLxyk67JJNnSYSFrpHbl/AO/oHyIo6afYbkR7jtFtHSb4H54P6sbfhiDSKe3j4umP/5ILLYq8uWt0z+1jwoF97x8bnBNBjogSStogHrDBS7el08hzm+GJ2R4wOVvPvN1zqORoni51IvJaWK1pwrtZS3pemhwR1Nv9f7BjVtjMj34PKEmv8sd4c4BHT4GdShunnqWZapxQ9/yx/t9e3/pOBaD8sZHUUDtbyUR9vqpyz+QnZEmqDBHQHTwqHyK00BtEmBzktXPInkyG4WmXZ0zgY+2MjHAGbVmo1DWIu0TJdD0nw/soAuy1m0k+YI+m/fs4m9YtyzvWKWSZtuBg5CxJ/RqBlsiyK6d+HkOqmUXJX6WC4IqkmwuAM0jZK/ks3OmJGGmxFlnwZSXUt7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(8676002)(186003)(6486002)(6916009)(6496006)(38100700002)(2906002)(5660300002)(4326008)(16526019)(6666004)(4744005)(86362001)(9686003)(54906003)(316002)(107886003)(85182001)(8936002)(26005)(33716001)(66476007)(83380400001)(66556008)(478600001)(956004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K1dMWC9DMVhnd3F4STVxRlpSRGdOTjh0NTdZTDVBcHB6OUQraUhLMW4yNTV1?=
 =?utf-8?B?MysrT2V3YnBRbjNJNWh4MklYQy9lc0ZsVHR5dXRJaFkybWh5WkhMM2hSenRI?=
 =?utf-8?B?N1MzSTFkb0xNLzlCK28xVlVueVlvVUlPczZpYWxJbmxraHZHMnhHTlh6bldJ?=
 =?utf-8?B?MjVQTXdCZnlScGtMR0dEZWVCb0R1RW1iOThUTG80dnFHWm5xSHdPQkVxbXRO?=
 =?utf-8?B?dlR1ai94ZDJmeWZ5NUZJeFVLeVJrU085QnlWWTR5U09YSE82NER6c2FUaXFl?=
 =?utf-8?B?a21nVWYxWlRMbnlMVjJsdmFCZm4yWk01L0UwTnY2ZzVQeFpZWk1mMmxoclVQ?=
 =?utf-8?B?cGtyeWJjck1WaGk1a01zaHB3c01EY0dZWWliNjM1cTNBdjgrczArS1YrT0Fp?=
 =?utf-8?B?M2FseU5pWDZkY0tvVVZLZEFFVmEwN1F3RGJhZ0RHaGRiRnR0MzlCa0hUdGpG?=
 =?utf-8?B?anBEZE1TQU9lTWVRWUt2NHFMd3g3UnRqSlZWTS9PMlJ3bENyREVXRmFmSTR1?=
 =?utf-8?B?SVByVmkxQ3I3aW5UdUlEcnBEQXkvNm9laTRkaTRuZzRyYWtCMFIxVnlWMlAr?=
 =?utf-8?B?RmRtUkhjZGZZenNWUG9STW96WlQ5RnRwTGVYcDYycWNsWXYzTFlRc0drbnZx?=
 =?utf-8?B?SVFCM0wyWWdzclhGRzcxZDFVNlo3MEpvZzJudXRPcXhjcDRSTnNCS1ZzMnFz?=
 =?utf-8?B?OUNieHVMcUZvL1ZrZ1NDcnpzNFY0YWpyNE5KRHVjOTZxbkgrMDVVWjJOQ2Jq?=
 =?utf-8?B?SEpvV0FKZU1GSU5vQWVTOGUyNGd0SlBDM28yNmJzNWYvNmhENUMvdEcxV1hw?=
 =?utf-8?B?QlliZ2F3Y1UxOUlSMkJtR3Y4YUtjWVVFWEM1dEJZOTd1SFpDVm5xV0VIcHJk?=
 =?utf-8?B?cjBocEhhMk4yeGh5Ni84SFc0YmQyZnp2LzNzMDAwcVFoL1FQVHJPUFNxOEJC?=
 =?utf-8?B?dTZJc3pBUWVuaXZBMXhSeWdEWDNPbkxmWkVMMlEwMzVoNDhuazZJYjJpS3hl?=
 =?utf-8?B?VWFlaFlaZlFjeDh4ZFVyYzZwV21UcG55elBIK2Q0dGhMM1djU2s3S21sN3hU?=
 =?utf-8?B?RFFVdlh2YnlVeit0NXdLYTk5ZzJPWndZWHdQaFhmUU5ZcURmcnNrRjRocThs?=
 =?utf-8?B?Wm0zamd6TzA5c3dyRm43RzhvQ1orc0JhRUI3SXdWck9PUlgwYjk0U3ljU1Av?=
 =?utf-8?B?RmtjdGhvakJJaHFkc1V5Z3poVGFkVXdHTnFTUEhacFdJUXBVZDB3bk9oRlla?=
 =?utf-8?B?b3Y2TkpYVjk1d2F6MG5ES0dNOElreUFkbk9jS1c0aTFwdkVjK2lSbG9JZEFF?=
 =?utf-8?B?UkM1UXFyUlNLS2NFeTBXK0RWNlJTemJsWnhhUWNaTUVVVGNtNjhPS0NyN0Jq?=
 =?utf-8?B?Y3JHemRRMUhHRnJ3UkMvTUZWYk9DQTBlRFpPbUNldkE3SXJrZkxGekhIUTZh?=
 =?utf-8?B?bDBxcmlxaUxiSm1WdWhoQmNNdUVjbXkzRXVHbkhmT291M3prd091aVBybFBx?=
 =?utf-8?B?cUY5amRqbkVqQmJlamFCSTBrdkV1VjRWcTN5NWxHNFJCUkxTaXlJRjRma255?=
 =?utf-8?B?ejQ4cXpSNHB5dE1iS0tmZWZvOGFFdnVQK0sya0hyVTFkSWlTSG82WVhzbWpl?=
 =?utf-8?B?SUIxOEs5bitHWU90S1V6L0praUR2SjIrc1ZiUTZmUzkzUjVKdmZicXpxMDVq?=
 =?utf-8?B?cUhLVVZqd0ZIVjBQNVVOclRaMlArbjNFVXVvdGtBOVozbzBSTlYvY0xGK01p?=
 =?utf-8?Q?SptuhFkprWQDWghyI80K4UWIe92cBmcIQBT69xa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b6eb42-c082-472f-b6e8-08d90f9bf9c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:01:23.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YvDGwx2WbAc858+3YsMK8ALePbEvD6hvYqhOWf+Yv2gUMvNzf3ozM5T7NRoEJYf9kLbAhygJGuzmFaZ7F1JXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Wed, May 05, 2021 at 09:07:30AM +0200, Jan Beulich wrote:
> Move a few #ifdef-s, to account for diagnostics like
> 
> p2m.c:549:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]

There's also __builtin_unreachable, but that would get even messier,
and I'm not sure it's supported by all gcc versions we care about.

> which appear despite paging_mode_translate() resolving to constant
> "false" when !HVM. All of the affected functions are intended to become
> fully HVM-only anyway, with their non-translated stub handling split off
> elsewhere.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 8d012d3ddffc ("x86/p2m: {get,set}_entry hooks and p2m-pt.c are HVM-only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

