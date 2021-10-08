Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44253426FB8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 19:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204837.360020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYty4-0002Gr-7x; Fri, 08 Oct 2021 17:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204837.360020; Fri, 08 Oct 2021 17:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYty4-0002Ea-4H; Fri, 08 Oct 2021 17:47:36 +0000
Received: by outflank-mailman (input) for mailman id 204837;
 Fri, 08 Oct 2021 17:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPMe=O4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mYty2-0002EU-62
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 17:47:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bc2eb9e-e785-4108-ac6b-8fd08061e2d4;
 Fri, 08 Oct 2021 17:47:32 +0000 (UTC)
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
X-Inumbo-ID: 0bc2eb9e-e785-4108-ac6b-8fd08061e2d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633715252;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aMlesI0+7uJMZe7h2usGprOtuT8Wsboe91YJEkmWQ84=;
  b=KDPH/wEeiGzl+6y8k0JbxLQCVGlsklSPpCjChFsFjmwD1yoOh4vBSI16
   Ae7dpcIQVfXQma21iCIV7Iv7B5SK0gMjk+OpHMhn+NpMgVb3+SKzx4s7w
   FuEf1Dfjsiyckr5uhACokwh7A5kQtUlxKvLD1iSMlBSVWIXN5ThRJAc2+
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sn36cWkJVwc8Vatuu2bFiiC6Bk6FSbpxRdG90zom02Tr4vm/RYmffrRkAzq8+qnS+rTYXegfoM
 Pzlex8Xcm8bHK1qIDAuEwP5oojyon9lf7rMTANi40eGaW3Ddf72q2zx4hQSmxy7CgoTMA0s+z+
 MKxD9e+jW+rOst0sj2rZRAiXNsk+RZwYZzG0huwVT1azeZ3iL9vANlAbbBrk7vnXs+vQ4ktkuL
 c6qVsfcCV8aE8oM/laOXZNr4pBxCHkVEZsFbrvAadomklQ+JEK3/973W12bpektuCoONxXRp0c
 iFq2Iqif1rsKxG/fqD/DzYs3
X-SBRS: 5.1
X-MesageID: 54724177
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VgmbX6+OcYD2bOUb+6rmDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WIcC2DUO6ncZWX2eNxwaI+z8hlXucfWyYAxTVc+/3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhx2
 chUh7moGT42P5+ds8MAdwkJL3lhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0SQqyCP
 pVGAdZpRDiQakFxHG4zM4sjv8S6iCTebhlK8E3A8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+Sl+TsfS/zEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0W8tNCt8f8FG01avmsi2+G0wUHwIZd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9dzFbOn5dJecRy5yz+Nhs0kKnosNLSvbdszHjJd3nL
 9lmRgAQgK8PxeoCyqm251zOhz/ESnPhFVVuvlS/so5I9GpEiG+Zi26AtQazARVodt/xory9U
 J4swJP2AAcmV8HlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyaZhfI2SxM
 BaL42u9AaO/2lPxNsebhKrrW6wXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGOqdRNcgtQcSRibX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TMhiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:3M8m16A3AZuIpMvlHeglsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6LS90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOkNK1kJ
 0QDpSWa+eAfmSS7/yKmDVQeuxIqLLsndHK9IWuvUuFDzsaDJ2Ihz0JejpzeXcGPTWua6BJca
 Z0qvA33QZJLh8sH7WG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNxN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wiJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABCnhkjizy1SKeGXLzMO9k/seDlFhiXV6UkXoJlB9Tpc+CRF9U1wra7USPF/lq
 /52+pT5elzpmJ/V9MKOA47e7rCNoX6e2OFDIujGyWTKEg5AQO7l3fW2sR52Aj4Qu1F8HMN8K
 6xGW+w81RCIH7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,358,1624334400"; 
   d="scan'208";a="54724177"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0xe2+8FZB/IHamOkW0wfb4U1E5cHOpU1NOqwMs6kyP6B/z6dR+CPYjj3rBoi+E3kVSDe0qAQiAKr1xqbwtbOU1uDSK899bcGo/YMepoIXMAt7cefGH7d+5rn/Yya1VriM18sytOyPLhB3NXSvp+77RTUlfR7zrK0m3dMJTJ5NbOjEzM2ncZjvz7mftMmCUmDfQ8i49H0T3Ucq5NBGuaYMg0HFiOCAMjl3ggCD4GyYDi1KxZZSMZmFtj45MlQ0eTFJMDee4pGLA9shGnIbbsD13svD8Z21+qn4p2lz3lFLuPOS/i3CUk3MUrD8vO+XZBt82lwCoUgaBbMVfo2WexVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0KdzliHc2dA5QvYlsgTDGIQ7D6YE/u6JPG8M3eblIo=;
 b=lUMvxcEzHWdrBndbVfTjWtIkcPS6RoKPJ07S7GynmQR4SQ2j21ZsDYePCWWJ9Z9dr5/7EkdTB4x/e+r+dLv2fMipugxK+NBjveCx5QtnAue6pjjPP2oFZcAyf4V9mabALo7SyK9xbaeS1Fegw001cWzlZhIVK2wyncnvF2+MPL49/QzdUsa1VljoTu1eQMXQ7ksIqA2ZdSb5J1etc3WyHjLr6b6y3LMyhFDgsIstj8MKSTLlznZpMUruI04yZ0iyLB/y6qmUjPAJ2iIHG/YedCGr2DB0dt7FZkW7yCNIYDtwU3SdqA/R2Kuy86dMCTDsp324FkxZ15UBybCkKzP0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0KdzliHc2dA5QvYlsgTDGIQ7D6YE/u6JPG8M3eblIo=;
 b=O0ag8yaGEhBm207isCaJPXF/1pXmgokdJoMzxjevx2+EEbF00hQrk2wJReWnFOwwp03U4jbSJUUL1j+BCJ6WW75fCLO3z9X0rJoWfOe0euaIU2UV7IupvGrkLDn9Tho8Cxw6tQdSPRTYmaM3+bCTQJhOP34dcLdbNOdBDId2iPE=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <e8d21433-2f4f-f662-dd45-1543da8f4caf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV32: fix physdev_op_compat handling
Message-ID: <24595827-df68-816b-9356-935c3fb80746@citrix.com>
Date: Fri, 8 Oct 2021 18:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e8d21433-2f4f-f662-dd45-1543da8f4caf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a829ff1-1832-4140-e1c2-08d98a83aa0b
X-MS-TrafficTypeDiagnostic: BN3PR03MB2132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB213205DFC62B841BCFE76991BAB29@BN3PR03MB2132.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3vHBYB99i9aJAy7pokUnSshhBfiUU5hGmwGgCJ1/alh1QsGtZOKURWGlrdYs/9uUKlgIAS0zUepPPjYj0a5gYYsromEOquttM/FsgdGIETv0M4hpqN7eJvCsR2B1D6s0h7FxT18JbkiG54cXqfByWHLvocQP4g5U3jQPuXWbohY3xcnnonfWT62E6flqQLy5TcjeE3yhFz5j1rwP1Vrpo1zcIw5bn7XDO6ZPHgyAEPU6u8KNGk2VmCCpnLR5F3JnK/8ALUj13UUmlCcAkgnSJiiodRogbvidTCymfVTgsDwemZ6h4uZ/fdab0h3XuKnX/FMkR/y3iF+oUybXU0zbYAY3GhOJ4qc1+B21sdX4jQzJpsAPQepMenlUlyF71Y1RssAeohPHhIWI1SG2hKp5gAX+KZqsV59i2ftG/tjJ51lnBcQUoyV1qLXU+S1Hp1xVu8yeX4pOcJwa3IxO/3OupCL7jmZ1PJz8egEFV9pgmbONGTNDVg0/7Cn5AqmA8X9OAw2UwbQLE2INxs8wRSbAOfL1pwPSpzukkIlwk5j2ds7R1r/igs7ZAspDCmU30SrSXOQFxp5rmSJJUz+rrhXvj0rcxucHk0nnV4ewWFxyOkIW6EI3EVETfm7gXvBBL3vH8p9S1SfvItLGpdjh8RRsKrRUqWky7m416t4gW1v9VbK3Wa0SAAGZQg/4QViDKYF/NFh2rZLYqw1a2OUCypJOMDhinuqxm79Kj0uFRqPbisZ7qlqxrwaJvAwujFdVx0r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(110136005)(2616005)(6486002)(186003)(16576012)(316002)(8676002)(26005)(4326008)(8936002)(956004)(2906002)(38100700002)(86362001)(53546011)(31696002)(508600001)(5660300002)(66556008)(66476007)(6666004)(66946007)(83380400001)(107886003)(55236004)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2U3NG94UXpCb3gvMVpodXVWcytmcTM0WC9RNWVLUDJCaTNJVWlXZHNQOVpj?=
 =?utf-8?B?VVBaMGFUMEI2cndGUVoxS0RrZ3ZvdHh4Um51ODl5bmwyLzR6MmJzVUw0NEhW?=
 =?utf-8?B?KzZDcGY4bi9UN0t5TStQNHEwSGtNazIvSGxXekYwOVMyZm92emtGNHF1WXZl?=
 =?utf-8?B?ZEpPVDlXOGpuNEsyandhRHZjcy9QTENQUFB6SUZKY1c2Z0NBZ09VWjhDVHpG?=
 =?utf-8?B?bHpRcEMwVkpHQ3dCSEFwQVFLK0tJMU9zYXFRUXgxOW9JY2VMdnpHaG05RUFk?=
 =?utf-8?B?M3FsY09NWnJXd3NBVG9zUGZleEc1YjlBMnJmbXZiTEkySkZrWG56UGpWSk5t?=
 =?utf-8?B?TFdLNDE4MDFqQUErd2ZBN2FUTGxPdUZpbXlFTlhzd0Y0NHJic2pOQy83K3g1?=
 =?utf-8?B?dFBtNXgwZTUvK04zdmpSVFdQZjFUaHRCRzUray9aYVNDdWJ4M005akVUMUEy?=
 =?utf-8?B?amJLc0pSUVhSenlya01QV2o5K2hYalI2dWRKWkZBRkFySWs1RWxEUXFuWHN4?=
 =?utf-8?B?SGplQjgxYzB5dzJudzBRaFdKOFAyRDFTZ0ZvVW9VVjRZcU5BV3ZWdWNWaEkx?=
 =?utf-8?B?MVNrUWx5cW85MWM5VE51MXgzSnlFOXQ1THNUWXhhSkVZc2N4RzNDWVVwaGI5?=
 =?utf-8?B?TGFOQ213dUd5NDBCbGhIRHFSbmZ4bTBSTGtVeVp1QW45NmZsZXBEdithUWRF?=
 =?utf-8?B?OWpxZXROTndkaDh4eCtad0lONVA4c3dqRDBMdldFaWdWS3VhMlhwQXoxcTFq?=
 =?utf-8?B?Q0o0bGZSN2tOQ3Zia3pSbFlXRXRwSWx1c0JSajBZUy9DV2lZY09jRHR1TS80?=
 =?utf-8?B?a3ovTkIzR21EMDQ2RllrSGpzWHlhVjlDQ0lvQlhvbGZRRW94V3k5ZUQvbUVZ?=
 =?utf-8?B?ZVNCL1F3Wll6cis0ekY4NG1IODE1UVNndjdxbjM3MEdpK3h4Vk4zeUpuVHRK?=
 =?utf-8?B?Zm5RZzkxbkszbGMwbmFheTk3MW96VFl5MGRvUTdlck5QK2NoUGdhTFhiWDR5?=
 =?utf-8?B?V21Sc2tjKzgyai9kbzF1ZmxzK2ZwMGk1empjNDhuVndIYldZSnoxbklQSlZW?=
 =?utf-8?B?enB5QXh0eHlYeG4vOFpmS1VaN2w5YUVEZ2xCb0gzUTlJSWZiUWFjRmp4aEVk?=
 =?utf-8?B?R1FQMEFJSGlPVWlkallZZVBBYWw2emtGOElrVjk1VjNSbEtKMjZYM2NDTGti?=
 =?utf-8?B?ODFOa1BPaDdEYnFQQldyKzkrQjFRbkN5RG5Ycmo2eis3TmxuaHBOZm0rL1hu?=
 =?utf-8?B?WkN4R2VWdGo3dHpXQmhPWFIveUF5alZYcHhwTU5TSG9iWnUzRzNZbmk2WTF2?=
 =?utf-8?B?R3VBUU0wcGFpQkdub3hnV2RyWTN6WlJNWkQvR1ZVRCtWcjBoNzFLbWU5MjN3?=
 =?utf-8?B?Smg3ZUgvSE4yVlZmbHRsTFpQTGdBbnJZd044WUdiZ2h3MlN5U2lrWkFPcHZ5?=
 =?utf-8?B?aU4rQWxsdjYwMzZBekVWbEdJU3Z2alVTUmtxdkNrWVJ2REd2Nkd1T1NkcDFE?=
 =?utf-8?B?R3dpZDhkRDBMV2lBSGNpczk5NDNxSmYxejRDSlZBamM5OURWMXlKQVlKdVRC?=
 =?utf-8?B?bnRDNVppQ2JVVTlLamJOdWJSQVRXQytQSGhZb0kzTEhTUHUzUFNMQktncUZp?=
 =?utf-8?B?cER0ZEp6ZitQcVNnMUgvb0cwZVhIZldFOFdNN2oySWhGYWhTN0xRR3k0SDNG?=
 =?utf-8?B?VWIvY2psMElZdXVoWnhRUER1SGQ1YUNJTWJRbVpodEwyWVZmSWZmSkIrTDBv?=
 =?utf-8?Q?y52cqCa3KFyXDym5McVGzJganb4CRdQicDK9rc3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a829ff1-1832-4140-e1c2-08d98a83aa0b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:47:15.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi5yiy7HEEieNVs+c2vJueOnA1CSwI7qPJLm31YSG9cmI+Ug8uxHX7B4BnVBfjNRjDXPQQxSJwmrToZlloMN7oMlpsk/Z+IepBW5sEEP3PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2132
X-OriginatorOrg: citrix.com

On 08/10/2021 11:47, Jan Beulich wrote:
> The conversion of the original code failed to recognize that the 32-bit
> compat variant of this (sorry, two different meanings of "compat" here)
> needs to continue to invoke the compat handler, not the native one.
> Arrange for this and also remove the one #define that hasn't been
> necessary anymore as of that change.
>
> Affected functions (having existed prior to the introduction of the new
> hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
> For all others the operand struct layout doesn't differ.

:-/

Neither of those ABI breakages would be subtle.=C2=A0 But why didn't XTF
notice?=C2=A0 Edit: It appears as if my PHYSDEVOP_set_iobitmap tests never
got completed.

>
> Fixes: 1252e2823117 ("x86/pv: Export pv_hypercall_table[] rather than wor=
king around it in several ways")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Additionally the XSA-344 fix causes guest register corruption afaict,
> when EVTCHNOP_reset gets called through the compat function and needs a
> continuation. While guests shouldn't invoke that function this way, I
> think we would better have forced all pre-3.2-unavailable functions into
> an error path, rather than forwarding them to the actual handler. I'm
> not sure though how relevant we consider it to fix this (one way or
> another).

EVTCHNOP_reset{,_cont} are -ENOSYS'd in do_event_channel_op_compat()
without being forwarded.=C2=A0 I can't see a problem.

But yes - we'd have problems if any pre-3.2-available functions needed
to become continuable.

We ought to consider dropping compatibility for guests that obsolete...

>
> --- a/xen/arch/x86/x86_64/compat.c
> +++ b/xen/arch/x86/x86_64/compat.c
> @@ -10,8 +10,8 @@ EMIT_FILE;
> =20
>  #define physdev_op                    compat_physdev_op
>  #define physdev_op_t                  physdev_op_compat_t
> -#define do_physdev_op                 compat_physdev_op

This is still needed, technically.=C2=A0 It impacts the typeof() expression=
:

typeof(do_physdev_op) *fn =3D
=C2=A0=C2=A0=C2=A0 (void *)pv_hypercall_table[__HYPERVISOR_physdev_op].nati=
ve;

and the reason why everything compiles is because
{do,compat}_physdev_op() have identical types.

~Andrew

>  #define do_physdev_op_compat(x)       compat_physdev_op_compat(_##x)
> +#define native                        compat
> =20
>  #define COMPAT
>  #define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)
>



