Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B8369012
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116043.221445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsiW-0005VE-Eb; Fri, 23 Apr 2021 10:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116043.221445; Fri, 23 Apr 2021 10:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsiW-0005Ur-BJ; Fri, 23 Apr 2021 10:07:20 +0000
Received: by outflank-mailman (input) for mailman id 116043;
 Fri, 23 Apr 2021 10:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsiU-0005Um-P2
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:07:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57327895-63d2-4f60-ae34-bea4d9f1de8c;
 Fri, 23 Apr 2021 10:07:17 +0000 (UTC)
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
X-Inumbo-ID: 57327895-63d2-4f60-ae34-bea4d9f1de8c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619172437;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ECOB+R1k++5vPCrOA7Dbxs5iormzr9Y/jp5rhNKmwQo=;
  b=CMh4AzwgoPucKOOOFmEo2cq/ldyO38sVX9Fyq2r/qUSV8vXjxYj0vODS
   sjAVDb92QRAH33IW6SR0zkyijUuDdbxjT5eJx7QZ3ofbw5ab3svUrm3cF
   O3POYvJzSWcT4HPUxJyvr5qNK4KSZSmlOwjXdLWHObn+eaNwGD2cA4na0
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SFcqvaxNLZS9WGsH7Zn4omkl/7dwH/17Z3u3eGtV2uKq3UeU6kDG1df9FiSmjT6MTkkbXA9Dc6
 3A8sVaJvzy4NWRZwffaT8KNzYK7xYeHqbQkNbEb+fpw22CC7ZCI57BdlQEaGNo2myt4jsu5+Sf
 0uo/wDt9sZOoTdg9SsSGkQOsgelJJuK1lHyTHyVa0EvgpdMr6McjZ0kK5ySAULv0scNVZ7AzCB
 a0FVYWILOxRDznJ0kC+kuJxzuuIsyljuYjKWIPmoLyATIyT5tXmzHowJd0BGdn6eaayMarLNVs
 L4I=
X-SBRS: 5.2
X-MesageID: 43757634
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Em1ysKzHZtwcbKntQ73/KrPxnO4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2ojehlIxqov9n
 WArhzh6syYwoqG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYBrhJdKaFuFkO0YSSwXYs1O
 LBuhIxe/l0gkmhAl2dhTvI903e3C0163nkoGXo8UfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VbAzuPFWB1wmk2/rWBKq59qs1VlXZYDc7gUlIQD/SpuYeY9NRjn44MqGv
 QGNrC72N9qdzqhHhTkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSNspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcRGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl++oTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 5DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEX4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9gbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IISb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQSppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHAvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7SEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiURe5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EhgYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4mQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrSu+h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNGHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzWAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU+xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1YUu1zzh84jIM21SCuSqv45mId+mEung1PpxrKwYip4GDSAEdcFxbW668mBAVuDg==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="43757634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv3UC57ClcC7fT0ORwBSja6R/1tXm1g/b/4HczrfDmpSubrEPIGc6nBVN4Ctos1S8Z4ntZaq0BSxjLjcSiMRXTmygHUc6IJBQhnbjq30mgowSQwzOScKS8uzeJcSaT1i4L1PPCFNQnMl2DXmPcT+HUPob5pXIB4xDcJH6QI3ywfBSXlF9XABl6MoAyzaBmarWBbxf3ZSbq6JkzMFkctW8m3t4GZHng67t/+L45nbC9O1SfejnOSLE9Ijnj5NGJM55A6gua4Gl3aC7FJOkuZAMeo7wh+oS6L6l1rNVdJIhCVnDy9WfbVBozYWeA/UUfV+ZEsHIggTMxADHTZbTd+IZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYPLIf1gW3Osu1zV8xKlnwaABTdSnYpWNrRt1+CmwKk=;
 b=aQZEht0GXr8C8dNJJGmnpzdWDAj4hZur0PUkX0c3yRew0OhsmVFldM3VxJAmvNx+SQ/1LR4KxXg5qQn00nkVOSJHV25rulvWNoNCEvYc7TBUhTbXluf0XMEFttB/KmUvrm48CQQD08HwGmuN/vPimG2C+6FdstFPOky1nybTYhmRdxD8FOHgJXvCpxu531DEqyCDcgO3KghWME2BcS0tjTCy5OiAUUrTwxkg76y1Xf7Ssopbs2mTEnAHP99/NWPuWeH5maLpZ9gUnWBZSwGYX8LEmpPHxJTALjtKeouYbf7uYw/ULdC1kYos6TyNY398uFIAACpKjAOdQ03S9BoqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYPLIf1gW3Osu1zV8xKlnwaABTdSnYpWNrRt1+CmwKk=;
 b=BE12K5anYdcDIjl2Qs4qCh9QJ3Y/qMTyeCR+mUz/yvHLGvnsScBRDsGKIavxB6yhoqwENh53y4N4Qu7dqWeU4gWtHI2T5ieAxjaVl5zMvjHPj8q7IYv8GTG9geO4mYWSmH7kKpws4fAfN3m0M0NQ6NlLv2RbW9iEznku1hNpct4=
Date: Fri, 23 Apr 2021 12:07:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIKcS0o/9A0whxa/@Air-de-Roger>
References: <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
 <YIGcE5Cr+xK4K6gw@Air-de-Roger>
 <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
 <YIJ3icwAoGEW/AO+@Air-de-Roger>
 <32bba278-12cc-d105-7b95-6a788992d70c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32bba278-12cc-d105-7b95-6a788992d70c@suse.com>
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f77c873f-4882-40e9-0d39-08d9063f9110
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53237BFA66FDF579F5271B998F459@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6aT6nwg4xJ95R2LNrXrb4rxJ8I7Fu61CGM0hymp1llcDRVFOSExHO4eHRR/GLF7UJygSaeUF601Yy85tlV4eC8to085LwKiG5P5bApoOzJLbtt+9xvLcAbZsofDxZk+EoRAMe90l0WS+Xz/3C1SswE1C2yaLn1mZ6TlxlAZ8zGPO3W4bAvj2C1FxPg20dCE0ieo3pJ5Y1fZujc+SzPw09h7Zbj/SN7MjfzYxegH5xbzvTBMOe6V56Ms9/K578lCNaoYR48RP8znh/VFB6RQwm6VB9mwvZzDGurEZKEG0KVehLCI3qurZAIXPzpJ1pdrV/REbiYsCwfcQUXP3J3s4CCqyLsy3ZAicB5Qk3QYrMOWBo5fG145qc3KoAU5A1hvVYlr8Ady18XKEQO9jJauAAfxcXyoyM+PitafJyco0UVgS7gRz5ucozBCtfCFAFYSKBICXoYUB3cSboQzbbjiTML1YsXGCeUCFDOVzO5YPGuiVsCt+UG9EAdHiwNJ1wNINWP78r0xyd12abUjbvEp5ROlRnr0yK1FUbCISCOiBb3KIspW/8V37/If1P6ZzAAqeu05Gs9pummc6bwkTV5om2b/8sACP82ko1BHGbT09QOhDma0u0Xl+tQEAbkAZjuVipZworblDiGo2UUvlZbW4AXK60ABbEB8mR/LzLoON/vvqwEAbJeji6EkjMRPZlEE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(38100700002)(83380400001)(6496006)(5660300002)(9686003)(85182001)(8936002)(86362001)(2906002)(478600001)(26005)(6666004)(186003)(16526019)(53546011)(8676002)(66946007)(956004)(66476007)(66556008)(33716001)(6916009)(54906003)(966005)(6486002)(4326008)(316002)(45080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0tpa1BtZ3J1RVpIcjJMTHp6bUZRUHhWWDJWVFU0MEt1b285d2FGVEQ5ZkNU?=
 =?utf-8?B?aExxTlFVZFBKQXBxQ0sydURJT0srQTI2SDJHQWJLT29BQU8zTnAzaEZhQnJa?=
 =?utf-8?B?RFAwd1o0L1BSMk9BOGNrbEtGQXVrU3R0MFVmOTY3Wkh3MEF1c3dLcjNFRDdO?=
 =?utf-8?B?azc3bG5VYnlxa0NabXRTdUVSSG9KS0wvRGhVN1o2aDlGRlF3R0pRajRvZXR5?=
 =?utf-8?B?Z1RZWHRMVE9aRDRmTlhJVTdKNDhFRmJJM0JrSHZBMnlZdTRJbGl3aU5qWS9z?=
 =?utf-8?B?d0lOMzIxemR2Q09IdDFzVGlvdUswVSt3UzNIbmFPdHlUdUhaeko3YnU1aWdY?=
 =?utf-8?B?OFJJZWJmWFN5SCs4S1FNTnhLUlBHSzJLZHV4TWFMaVozNmF4WXpoaGhua1h6?=
 =?utf-8?B?dU5xWDZEZ1B2b2pQV3B3cXJ0dFNuQzdZYUxkSHdqamFOL08rZmxic1hJNjg2?=
 =?utf-8?B?T3NnclFPdzU5cEw3VlJ3K3g5R0RiOXltV296WnJ1SkUzTDVCLzNYTDlrQlpN?=
 =?utf-8?B?MElVQmFoaWRrMWNrcmJrUlJzbUptQkR1TFVwV2Q1ZnFNOERhc24zNVZuenAw?=
 =?utf-8?B?ZFZ0RlRXaFc2aEZXLytsakY0SnIxOG9ZaThvd1ZrcFhVcXpPeXdmaHR2eHJD?=
 =?utf-8?B?R0w2U0hkVXNRaHlhdURWVGRERTBBTUU1TTNwV2VFcmd3VEMzRUNDREtSRTBs?=
 =?utf-8?B?Nno5bFRvTmxtQ05zR0Rmd3NJZ0hBTjJFLzN2Rmk5bW9rTkMzd1BJSFFSUXVW?=
 =?utf-8?B?cnJSQXNhZVVNZi9oa21IU3F1TXExK0p5Q2xpdGJjSWlKSGtNY0pyazZOY2tO?=
 =?utf-8?B?bFpBNjV6Ui90bnVNb3NpT1NhYU9GeE4vLzlxRGJUZFI1STdKS1dFVE5zVFFM?=
 =?utf-8?B?S3Nzbk5YMmVaa1RzRHVzUFVYK3p6cHpubnR2eklWYnptSGRQOEVuT0RHVlV4?=
 =?utf-8?B?alNhZ0RDTkw5end4ODdFcTdEQ2RWb1JhRTA2dWxMNWlyRHZDaXE3dXh2WFRZ?=
 =?utf-8?B?Yjg4V2hsQ3lFcjkxd2ZnQU93aVpGODltOHFRTXc0bEJzcUE5elNiTW4ySzln?=
 =?utf-8?B?cm5oMVg0THhqSExYM2VsQnExRmxIUXFkMUFYZ0F4b3pZNUQvSzhUR0FqR0xX?=
 =?utf-8?B?YURENkg2N3dNeHhrWlhvRGhKbFRZS1JNa2ZteUErdmlja1VzZDdKRS9hcjAy?=
 =?utf-8?B?THRaVDVaRlFidWFoM2dYc3FnTFBDVjVIbnhza2tuWWdxYTY2NzR4MHJiaGVH?=
 =?utf-8?B?SjBSOGJSaCtaWGxORlh6VlNuSWl0NEJsZTBTVTg1OHJrckc0dmh0YUg3VXJ6?=
 =?utf-8?B?eWJSVEZ5aXp2Ykd2bC80VEQ3NFVPcnc0L2dFa09BNHZQUzNYQWhkdEJCbC9N?=
 =?utf-8?B?ZzArbENnTHNicnQyWWtKbDFKTmh2SHcrUXJ2RTNZMlFiMXo2OVBMMkFMUDdp?=
 =?utf-8?B?SzFEaWsxQ2x2YTlEZnRBcFU2Q1BwWWJHcXRlMElvT3gwUERDYXlHMnZXT0tw?=
 =?utf-8?B?OHd6UE5EeHg5TklQOUxVUUxzelozQnVtRzFhb0tERFZTMkRnS3Fpall4eHhP?=
 =?utf-8?B?L3V5czg1TDJzRjJETXFKUlhlNEZGU3dYMmd1c2VtUHh5RnpBaHErdHJ2ZVZP?=
 =?utf-8?B?UXZNeDYxVDNwelhZall5RkI3SXR6UkgxRW1jVGZTM2l0UVdlMFJQNlQ1eVhV?=
 =?utf-8?B?Zm5jWVo1NXB4WXBIUnIxSWx3L3JtN3A2dDYwZDhFV3c5ajFMR0xyU2xnR3U3?=
 =?utf-8?Q?yW5ummMFMzOdbzkouq2sRBgUjo1MMb1bcvuW0t9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f77c873f-4882-40e9-0d39-08d9063f9110
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 10:07:13.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERyOTQMQ4sLppwZ6gHvhjssTIQRx7WrGZsvzAnviWcCpQAmQXbDlbyQ6w/wo6SGbCY9bBFPZL2qh0CNsnDT58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 10:51:40AM +0200, Jan Beulich wrote:
> On 23.04.2021 09:30, Roger Pau Monné wrote:
> > /*
> >  * Explicitly list debug section for the PE output so that they don't
> >  * end up at VA 0 which is below image base and thus invalid. Also use
> >  * the NOLOAD directive, even when currently ignored by PE output, in
> >  * order to note those sections shouldn't be loaded into memory.
> >  *
> >  * Note such sections are past _end, so if loaded will be discarded by
> >  * Xen anyway.
> >  */
> > 
> > Feel free to reword or expand the comment.
> 
> Yes, I've edited it some while inserting. Will see to get to
> submitting v2 then.
> 
> > Not sure there's some
> > reference we could add here about how debug sections are placed in PE
> > files usually.
> 
> As said before - I don't think there's any "usually" here, which is
> why different environments have invented different ways. The debug
> info native to COFF is more like ELF's symbol table (with a little
> bit of extra information) plus Dwarf's .debug_line, but not really
> fully covering what you'd expect from debug info.

One last thing, do you know if the newly added debug_* sections get
the IMAGE_SCN_MEM_DISCARDABLE section flag set?

Not sure there's a way we can force it from the linker script TBH, but
would be nice and seems to be a recommended flag for debug sections
according to Microsoft [0].

Thanks, Roger.

[0] https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#section-flags

