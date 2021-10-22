Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C443752E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 11:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214907.373754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrHM-0007Zw-CB; Fri, 22 Oct 2021 09:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214907.373754; Fri, 22 Oct 2021 09:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrHM-0007Y9-93; Fri, 22 Oct 2021 09:56:00 +0000
Received: by outflank-mailman (input) for mailman id 214907;
 Fri, 22 Oct 2021 09:55:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDp0=PK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdrHL-0007Y3-Ag
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:55:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4112113e-331e-11ec-83b1-12813bfff9fa;
 Fri, 22 Oct 2021 09:55:58 +0000 (UTC)
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
X-Inumbo-ID: 4112113e-331e-11ec-83b1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634896557;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A0+8ClT1S337zV3rUlFBZ63G/WOU6XiR8bymXu3D2vM=;
  b=bI1efhTBE4NgrASZk34pKJxzP2nTQUJkpL3gHgzNPwDIw361IvFxgy62
   XpqfVFjWHhdzGjSbZVpz4yJUsA6w7EDiyCrrofmadMeuGUN9oQd7duRr/
   tg/aLwRM/teBGo1evhVw48LHHwdUwQ/tCRaJsCRzhcSeyT/t58bVnt1oK
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 27zrPdD7SZoi4uQahePBhYstjTeG9PgCDXb4OfU3yR7csNG9h2+mo7qcSC16zNTqn0vPDvRH2b
 9zncU+d6sGOEJxHOs4rvEBuozU649PGE1DKPXk7TyP5jPo5zhZZGjvmhISsz+jVkbVp5yDoKZZ
 wuwq8mXmKckrQ/yJwBWe9ZcSLdUV8YTIFPmqu8hr6GYZhNm2mn1kmrdp3lQxFoDG7cT0Lpxweh
 28AdUenyreTKCD672WBtNCdVFdPubWp8EJeadYFEjAb9UITHPNZtrNXWVXd01vaxqz4W0FR5ff
 jnKDUb7NJnbuwaffrn3Sb7A4
X-SBRS: 5.1
X-MesageID: 55840548
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KaGVLKBk2F6iOxVW//Lkw5YqxClBgxIJ4kV8jS/XYbTApDtw02BTz
 GIXWm7VPPeNYWCgc4p0atm1oUhT6JCHm983QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500g7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/uxiZgdZz+
 v50hLvvVCF1B/Tz3/4MXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHviauYcFgGdYasZmQurPa
 u8SThZUSh3NfURREVYzA7Qeg7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHNcg2mpny2lSctfIVNNbEDsT7K0LvbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqe/K9WLa1Tw9aDZYP3ddHFRtD8zL+dlr1nryosBf/LlZZzEfMQr7x
 CyWt2AAjrEXgN9jO06TrA2f3WzESnQkSGcICuTrsoCNslwRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4IdAMuW4ufBw0Y67onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4CwfTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPTmkwBCrWnP3GLmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:NiT1SKiuhsSq0E5TEc5CTS4eeHBQX2t13DAbv31ZSRFFG/FwyP
 rPoB1L737JYWgqNk3IwerwR5VpQRvnhPlICPoqTMmftWjdySWVxe5ZnPDfKlHbakjDH6tmpN
 tdmstFeZzN5DpB/LzHCWCDer5KqrTqn9HK9IXjJjVWPHxXgspbnmFE43OgYzVLrX59dOME/f
 Snl656jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxemkMKgWXo8UcL5/aJHw7TT6F69Nhkm1LimjkdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KMuZlFkIMAjgYVq3MYiFYJuYeA9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuondrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBjaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOnNSRP5uwDzvngehTJYd3d8LAp23EigMyPeFPCC1z2dGwT
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55840548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU1UjmwE8w7NNPf/eQDq/30NZDZ4eJofRC5GSsqhyQEAE111MAUtTHObroV20nDdF7FJQBtQOOkNrwfsVQmhHm2HPoRaJOQPG5L2dz++6D2ZZvqDcKkojMQ55C69/1XTBYOIOzOI0TDNKKK72K6jAjIZ9qkb+PCLDHiiulcg8CmfQ8X3QxZ07S9wsxEa/1Tb4ReqfDuow9FAfxWklvjNFGnlvPxqXBaHAm/V3sM11OW+J+dS7fWfSxec79LZ8NpLuG3NdncoidUSIxMWW75c37abvmBDfCemk1UMyAVMts78tHk8O3C3RHmWQvdjiFm/2sEdGqPM7RMbCJdA3pTUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTo9TBQcK1jyKcuXW85QXab6ida/aLRFTSoVKZPUKK8=;
 b=elj+IswdSU/9jj5M70VpErrFMa3/niS4Ui3NA/idK0K7q8rN621KzebITk/K2YYeyxRPNOsELWK2V2tAo5c5L42masURCnaBFzVkY+IyVQwxZ/23PeWKj0F7TT0k/kMg6v/LNufl0MQMmr6+GoRFR9TCqHUsl0E2MN3A3L3/NUnBuUDLo1XTUaLL/oBFpMQf5Xi2hIjGlJG/5C2jc2blM8Hf/rEHPWslhEe35GR8i2E+WDkIcAwj6SrxJ/RuW24y+ODHKG7E1Zlvr6ViHBFcX5kxdKhcJt+9DIBbwC2sGAHkfABJWVruZ76AjBg8zFl6/OQLtiS96CJNj0WIUN+FtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTo9TBQcK1jyKcuXW85QXab6ida/aLRFTSoVKZPUKK8=;
 b=kSDy5t02w+DIbLgFq289iWvoiv7aqkwkMqgKqYlFoGbZlC5AT7CPzxDzi2VxMkgquQGcmLHhZrK+2bwDhK8NkNIISsvafRwmRnxZv1CKEgSVBmjW6kzK0TWhz8ClfAHVKQ205WSxLOA+olFqUfc8RKrE13dwnO1iMG+eEFuEsoM=
Date: Fri, 22 Oct 2021 11:55:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/6] x86/PVH: improve Dom0 memory size calculation
Message-ID: <YXKKpgSCiIXf/4R9@MacBook-Air-de-Roger.local>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c12af8e0-cb86-4edc-0cec-08d9954223a9
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB41406F1C12D517633249F8188F809@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pr6dyNZKWjmeHxMlTLuWxT/0DE+cUA8toXOwA4aAdPoD+pMvAwFg4N0kFDxQD/KtaSfb8YNNHPIMnbGVjKUZNylQvlZfpKFRCodaFCfBpSKzKqSWSe1JbZ4AdhaJhfWEhgaL7tmdpbE1I69wLVuf40OYuSl5l9+ATdRRRSCYXjTWQb0b8X0qrzx3hWm07Y46UAYK/dXyadgtextsf5+KGY1+SRITvPs2hgjV9Q0z63uTKoPox2ZmRH1tEJ5EKy/RUak9BzNDcDfESSuw/Pn6J2LhgF4hslCL9gVigfrvhSrx5ME/p8UwDBwHWOiNFgSrER/qGibhGIwSTak69AyxCWvu9eA3bje8Wnhyk/emqxixmKnvFjCiVOGiGgB2zmlm101iplFumgZqfgnnHIJaAxln4PpHxywzHumYSNh1mBSQ636A01mD9Lx9DOd9yHfTurz56GqfPXGRHG+PL/6z10d+4R9yLKNAsTGwxU8Tzd4Yx7MJYvGHGU2Thbm1okHeWP9iPyozMexH2TpgbUY7U81IZYfSS2OJMoJH2dvjkp7eB0qyqTXYS6bkLIfw+OW37Urcbcl40GClXw2R1TWdN8zwWED0L5Z9U6LEvtZFRkOcY29Y0S24x/fUGYQE2CFz/RbRUK9knBXeT/180xp+k9JIi4H/cMpm88RqQL0EWx8uMsT2rENMWOanRVgMztyyzgEowpZPyWY47Ijm+orl8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6496006)(9686003)(66476007)(4326008)(66556008)(66946007)(2906002)(8936002)(38100700002)(8676002)(6666004)(186003)(82960400001)(6916009)(956004)(508600001)(316002)(85182001)(86362001)(5660300002)(54906003)(6486002)(83380400001)(25903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czByU1IwN1J2WGg5bXF4SmRiTFdiSFdSMzRSUENmZmtXRzRFRFhWSnZ1Zjdm?=
 =?utf-8?B?NFVSS2Q5UlNOclp3Y2lCYVJ1UG10QTNKNjlmeDhuV001YXBaTTUwZm50K29T?=
 =?utf-8?B?WVg1U3UwWGdRNFE3NnFOdjlxanZDWk1IOVU3QTFKVlZLeHFoZHF2bmllL2k1?=
 =?utf-8?B?MVhOOUVMbk1PYkNaU3c5d0NzOTFva3lCUjZLL3EyZlBsMEl4amdpeGpkKzRP?=
 =?utf-8?B?cUVxaFltTll4MFFiRGRNNXJ1UWs2d0taRktjTDVLbnoyRk10Rjg5OUlGV2x1?=
 =?utf-8?B?V2VlWldubGVqQWpnSDBxcWJtQnVncklhNGdBR0lpYWNsM0JvZWsxM05SSURt?=
 =?utf-8?B?UktnRTlpK0lMMitqSEFPc2REQkFEMWZhbXNsQU5JNWxHWTBUL0t2cFljWmpr?=
 =?utf-8?B?V1FocDZ4ZUdJRUZhMGx4eDM3bTVmblF0S1JLaFRURjNXT0RqTWxrZkVEd3pk?=
 =?utf-8?B?Mmp2S3FlZ0pTZWFITGErU04yM2ZON2RuWExiMjVQWSszTFg2UWozaW45OGNT?=
 =?utf-8?B?RjlHQnBUYjgyejcyWGZKKzM3NFNFSkdORVRpUXE2NmhCQ2kwTk1jU0piU1FK?=
 =?utf-8?B?ZGZwcWUvRHJnSTM3MzZpbnhFaWhESTlpOEFhMEhNTis3UmNoRjB4c2wzNFln?=
 =?utf-8?B?Tm92NHVGNzNLS0xGSmRSemlpQUhBUlVwTURBTUxqaURPYWtqcDYxUDRoUUx5?=
 =?utf-8?B?LzRwVWNGVURldzJxV2hIZE5KTzVPSXQ3Z2hnd25hMXRselJQZFM5VVlHTkZt?=
 =?utf-8?B?TDg4dDhPQjRSQnlDeEVuUnJLMXFwTjV4ZENHMVdTY0RkZC90NnVUQ3RLMER5?=
 =?utf-8?B?U3VURXNPTkwvNnFlRXMvTFF3M3NWUVlzZVBJK2ZTcjZWYWZmU2JZdU8yR0FX?=
 =?utf-8?B?b3pDbkxvVFViWXB1VUpubGY4NitYMjhXWDh2em5oOUcwZXNyaVhQWGNsSnR0?=
 =?utf-8?B?ZXZYOFlrVTJGS2dXRUo2amNFUGlmTFFxOFNhWmxWUFJvMmlOdHljVlpibTJU?=
 =?utf-8?B?Z0xIRmU0eXlvWGV0amhOSmt4Y0Z0UzM0cE93NVNjTDV6WUxDeUxPcEhVWGdW?=
 =?utf-8?B?cFBDc2dINlIyM3d2dnVKTVFiWUJHcFRIQVBSTlJlZU43Z1pMT2dUcFo1RDJC?=
 =?utf-8?B?NUQzalhCcE40bEh2bDhCanA2VkRuNkdVYmVPL1VCZlhFWjBOYmdwOUJtMGZN?=
 =?utf-8?B?djlBaC9tRXVJZWlmcFlJRnNWV0NwME11amp3WDhLVnIwTzVsL1JWdG1jbWl4?=
 =?utf-8?B?OS9hZm8ra2pObTQ2bFJiV0dFb3NuMTlsRDhrbVBGME5pVXNrWi93aWZnQWta?=
 =?utf-8?B?RTVPT2RINHBBNXZPMXEyb2FuOHVCTi9QWThlTjZSdTF2dmNyVGJUWStldjJt?=
 =?utf-8?B?WWtzYVg2UDZQcm9qY3hOQmgxNkNyeC82QzdTV1IrVTdIckVrUEFsNGhUc2tD?=
 =?utf-8?B?Y1FTMlNSdTNxNVZyUW8vRFQxT1g1VXcvdXRhQmtZWnJGaTZSS0xFZEVQRGov?=
 =?utf-8?B?eURJSFR3Nk80Y1B3MUg5ZFBtUmR4em1yZG9nTVZyS3JCTk83Tnh0VENoeUtG?=
 =?utf-8?B?dGRvQUZkOGppVk1DNmpHVllyWXJxMHR6bWp6UkU0eUdZdUh4LzNqV1VVY1J6?=
 =?utf-8?B?RTZnbFRYejVHd0l1WnBCYUZUT3lKUi9hQXFCWTM1aE1mT01meUhDSm4wVmdu?=
 =?utf-8?B?eGFzWWRsdlpyakR1ejE1cXV5SkQ5VGtVZWQ2cVJoc0VJSGxId294ZHVaV1Mz?=
 =?utf-8?Q?QcjIQPM2O8NIuxhs3Pf58Yaue17hUtUkGMZLi2b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12af8e0-cb86-4edc-0cec-08d9954223a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 09:55:54.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 03:13:24PM +0200, Jan Beulich wrote:
> Assuming that the accounting for IOMMU page tables will also take care
> of the P2M needs was wrong: dom0_paging_pages() can determine a far
> higher value, high enough for the system to run out of memory while
> setting up Dom0. Hence in the case of shared page tables the larger of
> the two values needs to be used (without shared page tables the sum of
> both continues to be applicable).
> 
> To not further complicate the logic, eliminate the up-to-2-iteration
> loop in favor of doing a few calculations twice (before and after
> calling dom0_paging_pages()). While this will lead to slightly too high
> a value in "cpu_pages", it is deemed better to account a few too many
> than a few too little.
> 
> Also uniformly use paging_mode_enabled(), not is_hvm_domain().
> 
> While there also account for two further aspects in the PV case: With
> "iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
> none need accounting for. And if shadow mode is to be enabled, setting
> aside a suitable amount for the P2M pool to get populated is also
> necessary (i.e. similar to the non-shared-page-tables case of PVH).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder whether this isn't enough to drop the "PVH dom0 without
> dom0_mem" warning.
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -318,8 +318,7 @@ unsigned long __init dom0_compute_nr_pag
>      struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
>  {
>      nodeid_t node;
> -    unsigned long avail = 0, nr_pages, min_pages, max_pages;
> -    bool need_paging;
> +    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
>  
>      /* The ordering of operands is to work around a clang5 issue. */
>      if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
> @@ -337,53 +336,65 @@ unsigned long __init dom0_compute_nr_pag
>          avail -= d->max_vcpus - 1;
>  
>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
> -    if ( is_iommu_enabled(d) )
> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>      {
>          unsigned int s;
>  
>          for ( s = 9; s < BITS_PER_LONG; s += 9 )
> -            avail -= max_pdx >> s;
> +            iommu_pages += max_pdx >> s;
> +
> +        avail -= iommu_pages;
> +    }
> +
> +    nr_pages = get_memsize(&dom0_size, avail);
> +
> +    /*
> +     * If allocation isn't specified, reserve 1/16th of available memory for
> +     * things like DMA buffers. This reservation is clamped to a maximum of
> +     * 128MB.
> +     */
> +    if ( !nr_pages )
> +    {
> +        nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
> +                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
> +        if ( paging_mode_enabled(d) )
> +            /*
> +             * Temporary workaround message until internal (paging) memory
> +             * accounting required to build a pvh dom0 is improved.
> +             */
> +            printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
> +                   "If you get crashes during boot, try adding a dom0_mem parameter\n");
>      }
>  
> -    need_paging = is_hvm_domain(d) &&
> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
> -    for ( ; ; need_paging = false )
> +    if ( paging_mode_enabled(d) || opt_dom0_shadow )

Do we also need to account for opt_pv_l1tf_hwdom in case dom0 gets
shadowing enabled during runtime?

The rest LGTM, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I'm also fine if you want to remove the warning message at this time.

Thanks, Roger.

