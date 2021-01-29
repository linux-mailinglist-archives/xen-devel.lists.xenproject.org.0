Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23633088B4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78087.141900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SQm-000234-2V; Fri, 29 Jan 2021 11:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78087.141900; Fri, 29 Jan 2021 11:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SQl-00022f-UG; Fri, 29 Jan 2021 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 78087;
 Fri, 29 Jan 2021 11:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5SQk-00022a-H3
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:59:14 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14640744-b7df-440c-98d1-11dbd7a8a55e;
 Fri, 29 Jan 2021 11:59:13 +0000 (UTC)
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
X-Inumbo-ID: 14640744-b7df-440c-98d1-11dbd7a8a55e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611921553;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tKKgLF7uQddtUAeOsOhreZxgDVNIiUyXWotIV4C8Wtw=;
  b=aWZ1eHk5YpwF333gUI2ZBA/L7+XKkf6qtZq3Ie/4P+U3UIVsMQ+hfop/
   7/04Fl47Eov6S2D4szsWPUUEeWrbotBtf9Lopp2pc8GvSnL9WCu7LSQrz
   ttxb2mXcVhOrR+LPKSMrUmrIeq/XeizCeWHz9ISCVrOx2t7NaLEdAZsX5
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E1q1prAAN7mq+6BSfegdP2vWlZDC1QCe9JAkNfAcMolgT/GI9hrExR5mQEtHPdpVMvW0ehEuCp
 zxBLntuOZpPKtPp+iVQhQGRsXnkjAVkJT0qqJFNd4LvWDBc9QKrFos6K7H56ol0n6EBCInqhxD
 2fsS4WTb4nNmrsVJedZVNP5PlQZ11nSZPSRkgHRi831BMIqrY/EY4mNwaQeiKtOEwe+jxhghNP
 M75V5+39ehRsBCLpzGnJy6Z5CVxQfg9YO5FCa86SGfwaeY23HoevofVSPAE0OuoY4ZnL4dA4Fh
 dF0=
X-SBRS: 5.2
X-MesageID: 37469186
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="37469186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4ZJvm347dlI5CcO7JJw8GyaZfHmrtSZ09SGEG6M7+5Pz6yGM34coSTL5TSftuXoLV52cfJR9+sWf/tqtCXSztLATvS4bh+IscX7jSCZ4i0+9wiL/UabhXVqaMwzw05QxSgKcFAsQjkkUQf/QeA2JFRC0qU+xydNP4MZdyebVBffCvE68PzpH141Wk3D8di3/MmbVCIjNja2lVjKz0IAz0F1KlfAYNQYx97JDg8PYH7Onwyosc4T3+kmPLKW8/F7vIM3CjW+49If/hBzD++QCnjMGv8Wq0r/6BXPo7UsFMSIUPUpghHnAkvNU25jLm+SLpLTH192vzqhnYoRQK8bNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgPClt3mpdIr+JCViQaVR80m6+OcEmsf+zaegLFcEA0=;
 b=EULiud/sYIQmx+2h9CiqS0XAi8XzypQfjccwZHW919pErsN8C7xJRi5jTVvSDuTrz4cX0yR+1n81XmqQI13XTTBuLWXMWMuyBrLdG6pry9I91S7U96tKBlOe8XZIvvvaRPIZUf70nZglb+MPpfUN0Xktjo3swlunS+P/T0DvDVRAadc19gX+6DrJdGuZfxHvDiNhZ/NbeHLWmVbp8NJxSRK7AP+qInqhXZ8GCApGfH1EOLUYgZmGOSTgIwK3mMMO/h4PCMKmAjw8MhQtEkScnlgeAYDfQiMa33jlvs/1CkxgHygtLBj5QiuX+qFM15LtJInAtFLXBJcYrCtX7VbzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgPClt3mpdIr+JCViQaVR80m6+OcEmsf+zaegLFcEA0=;
 b=vAx8sEa8YYIbJ0kk1JnTNR4aAa9ofT3np7LrW7oyMZnyIyE4HqhDIv93WBCSiXH4I9NwbcyV4iXBOKVTIN82x5KPW6U7wWzQ2OxtxGBr3Hrg/85T026VT8FcWOnWcgUVXXZW+wU6UHNmjSpQwluqJMGqoqHHoSjvpEDqoCR5sVA=
Subject: Re: [PATCH XTF RFC] force-enable UMIP for UMIP testing
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
 <045a8b84-eed0-f43a-dcff-2d992c638742@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91c57e5f-f0ff-fdfe-3736-74e83bd22ca5@citrix.com>
Date: Fri, 29 Jan 2021 11:59:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <045a8b84-eed0-f43a-dcff-2d992c638742@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0119.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73f2a796-5948-43d5-73d4-08d8c44d4827
X-MS-TrafficTypeDiagnostic: BY5PR03MB5217:
X-Microsoft-Antispam-PRVS: <BY5PR03MB52176D577711EDD822D4454CBAB99@BY5PR03MB5217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUgCOUgE2Xh18zoj1j/C3+wW95NOQLL3BT2waUvA7MZ9J2A8UWZ3NQUxNjEd1aTdE2PbkVc9JngPwPTH1GCkZczhO2QY8FamSqDHiKsrtdMi+nVnySv0vlDrJC1hBgSmAeZWqbsl1oRUM7VYbi6hgjUYRSZssFeh6r0rbOc96szkJ8YvA17RQhO2S24gvj4eiXo+/Iror4jV/OaOV8M6hj7wFtZ8kVhv+HZLt3d2CcgDpK54e9JHSxM+kpLEiFAktfvyt5W3jzJd7ERv7Fw+UMo2khAV40PHOkVUjOFP00cEOoqFj5TlweLPP9xgNtBM3yn0knqIEW4iQeoglZWfn/ZC799dtE3I9VTMKJX6cfNwyVwbSkK7rNp6BuJfooGmhE6ASR9jhf5M4OxhLZ+4cqY/w3yaYYZ+MKIjQQ3stborKyPcDtIIbBJD7CgT0eqONxhuKUN2iYtaoqHE4HpJetkvZyW79+6AuspbfiJzVXK0ocvP1hyThWYCyPemDGVJvcWMlCFU53o4txlZ8+6ldM1/4kIgOlSquOX7alwIWS40Pwfpa5wl7o3h8s8oV1TThFjbVXfqs/uEpi5b1zSp9K0LA43amiRhCPiu1o5c5SY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(31696002)(16576012)(8676002)(86362001)(186003)(26005)(16526019)(66946007)(66556008)(83380400001)(8936002)(66476007)(110136005)(2906002)(316002)(6486002)(6666004)(2616005)(36756003)(31686004)(956004)(5660300002)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWszM2gyM3JZd0JjdEs2Y2QyaXJSU25TOFBQdVpDazVLckpkWElaamM1Qlpx?=
 =?utf-8?B?R1owWkpFS3RwTVdjaFFBaXR3THlIcytxT3pOcWxxU1NRVTdJdlpScXdUenpM?=
 =?utf-8?B?QzZlaEpGdHUzNk0ydWk3cFlFV2hXb05FdWs2TEIyZnZtUmN5K2pJZzJaeEl4?=
 =?utf-8?B?aW43Nm56U2prajdrTSs1ZmNIa1FCT0RUcmtlQzk4aUExdlYxb0lFeGxzbWgz?=
 =?utf-8?B?UDFBZ3dPcFNsWGhES3cwUk45dXJMNFFUQWV2WmZGSjhkM2U0VXA5emNKeGlO?=
 =?utf-8?B?aVp5dFBBQ3c4MTJqU3JGN3Y1SFlDTmdCQmxtU3YyYlFSS1FYS09NYWp2aHRm?=
 =?utf-8?B?NVlmYlMvK2RWOGswM2gzb0VvNExYQmNSdS9GdXVtU0syMnFKa3RZTTd6MVZr?=
 =?utf-8?B?Mm9CTGdtczZqQjFESDhqN0hCTmZXUFVKVHlOTC85WnZzT0pkZ2VLaURtckRy?=
 =?utf-8?B?N1N4bkJvVEVabGNFRHFIY2grYU95M1NOMFFTTFVhd3RUN3pDN2EzL053L0tn?=
 =?utf-8?B?b0FpMUtwUTV6VU9HQkdieHFMK0JCYmVFZHRuV3JZdjJiOWpiWFh6aUpjK2xL?=
 =?utf-8?B?MHlTaS9jTmVIVmh2WnU2N1lTVnpJNjNlbTRSUUJvNGZEZXJveFl5QktrcTFL?=
 =?utf-8?B?WmdCb2NXbXloQ29rUXRTUFJKWGVKaU4wd1Bxc0tuNUpqS3ZLRXl0Y2k2VTUw?=
 =?utf-8?B?OUR2TFhndVB6V0dRVHhMOVRQb0duRDY0YktXY3hZOHp0Vml6Tnd3UVZqWVdM?=
 =?utf-8?B?RTIxUHgrOVh0TlVDUzhJaU1OaFRhNU9tTnBvZ2t0ZnV5K0RHNFZaV3NwZFBz?=
 =?utf-8?B?UXJISjJTSHpzMFg2YUVTSjl3d3hrbE5CblMyc2ZwWjdtOTgrejgySFl5b1cv?=
 =?utf-8?B?S09pSVV3QWJzaUJHTDVLWjR0RzZQSE5MUFp0VVZBSERkanNxT1czM0R0VFJh?=
 =?utf-8?B?SHRTa2lsaVlBUzFETWdxNjlIMWpnamxOY3RGd3VUMzhDR0FCQWkzbVR0N2tz?=
 =?utf-8?B?bHdHUVpUVmdJYWUxY0dFcEpSb0R1cDJHU2FUenI2bTdJcng1bWdyVitDdjRU?=
 =?utf-8?B?TFJLZ0pnaGJWVVpqYjBCVFlPd3F2TnQvaGdxSlVNUFhwZS9IN3U2N2ZaQ2pQ?=
 =?utf-8?B?QlpjVW95T0Z0S3F4Zi90NFZ3RHBRZ1QxWnZaTjIrYlh5UCtNZUlxL1FDZVhK?=
 =?utf-8?B?Q0czalhHTUhaSk5KWkpjT3RqOUk3RGNRMUcrcUExNURwSGVWYVYzZWRTVWhv?=
 =?utf-8?B?TS96d2lmdWljMVJLM25hbGVad1prS01xMlVuR0ZyV0V3SG5BUmFOczFQN29H?=
 =?utf-8?B?SS94TjFVMkNyZkxGTGlCWFpRM1VlWTdNR3hGa0JHNEhFK1NFVHVTV3NEZFVN?=
 =?utf-8?B?amNOcVgyM0FEZ3IyU0RFQmE0eVoyQzV6TzB2NGU5YjFTajlXWGlLd0dVZFZG?=
 =?utf-8?Q?Xkq6WGvY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f2a796-5948-43d5-73d4-08d8c44d4827
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 11:59:07.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOEniBwh+Ur+XnYMj2RlRLBPJ7xqxa+cqXDcVvfylShyg6vtiYnRJC5YVvn4CoWXhxe6eOTiKMAOptz/xEgHGTF2hj6me/bgso7p+lQOJMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5217
X-OriginatorOrg: citrix.com

On 29/01/2021 11:47, Jan Beulich wrote:
> Enable UMIP even if underlying hardware doesn't support it (assuming
> the respective change supporting its emulation is in place). Obviously,
> as explained in that patch, the SMSW test is then expected to fail on
> Intel hardware.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tests/umip/Makefile
> +++ b/tests/umip/Makefile
> @@ -4,6 +4,8 @@ NAME      := umip
>  CATEGORY  := functional
>  TEST-ENVS := hvm32 hvm64
>  
> +TEST-EXTRA-CFG := extra.cfg.in
> +
>  obj-perenv += main.o
>  
>  include $(ROOT)/build/gen.mk
> --- /dev/null
> +++ b/tests/umip/extra.cfg.in
> @@ -0,0 +1 @@
> +cpuid = "host,umip=1"

So while I agree in principle that having UMIP emulation is a good
thing, this particular change in XTF would be rejected by the OSSTest
bisector.

The only reason it doesn't fail straight away for the PV guests is
because there's no error handling from problematic CPUID requests, which
is something still to be fixed.

Given that SMSW is a known (and acceptable) hole in UMIP emulation under
Intel, it should be converted into a skip.  However, that is also a
logical change to the test, and will cause other problems for bisection.

This does need the test-revision logic (as does one other bug in the
UMIP test IIRC), which I need to get around to finishing.

I'll see about trying to do that early next release cycle, because the
"tests are logically immutable to avoid the bisector saying no"
restriction is getting in the way of a lot of people, myself included.

~Andrew

