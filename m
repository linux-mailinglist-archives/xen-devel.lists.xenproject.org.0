Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D84D3174
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287929.488249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxv3-0004h8-0C; Wed, 09 Mar 2022 15:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287929.488249; Wed, 09 Mar 2022 15:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxv2-0004fG-SP; Wed, 09 Mar 2022 15:08:04 +0000
Received: by outflank-mailman (input) for mailman id 287929;
 Wed, 09 Mar 2022 15:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRxv1-0004fA-E6
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:08:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b570fe41-9fba-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 16:08:01 +0100 (CET)
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
X-Inumbo-ID: b570fe41-9fba-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646838481;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MRcc3SMMzIOe17Ity2K289oP/AuYescw4pPRiIvdLSM=;
  b=WhgC0zatNMxHx8mLx3aWDajHvJHQo03TJOHmE7JzIF8lgLqO0sDzG4Re
   zkneV07yPCKrbSeUVnpnNI/9rR2ixGtTpsBVTNgu9qAUgUyE+L+C5j3Qv
   T6lGg+N7M/5ycYBKvY7yK1M2cJpur0O5LVCnpWnHBZU7vDgYy2V6EySdD
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65756988
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gZhDEKCqfiy5sBVW/6jjw5YqxClBgxIJ4kV8jS/XYbTApG8mgjwCz
 2UWCm2FO/fZa2Xxftl1bdzi9k5UvJSAmNNiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhM8
 /UQnpLoEj4wYJ/Xme8kQUh2HD5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWht2JEeTZ4yY
 eImRxd1MhD7PCFeFUcHNrk8x/W52nvGJmgwRFW9+vNsvjm7IBZK+LLgKsbPc9qGA8BchF+Fp
 3nu9n78RBodMbS31j6t4n+qwOjVkkvTWo0IHbm83vdviU+UwCoYDxh+fWW8pf61m0uvQeV1I
 kYf+jcthaUq/UntRd74NzW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKkxkxbOQ9BLAKOzyNrvFlnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhczUVuy7ZBjmc911Lf4+uXp75x1fE4qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDBoxaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifapEmChmbKhggBdXTAd4llZ
 /93lu72UR4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgfQMb5ltvPY/FmLm
 zq6Cyds408POAEZSnOLmbP/0HhQdSRrbXwIg5c/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnmMnK0PGHX3CWdQS3TMygLQOq2Af5X8CJqVQRxbA3A8yVyPu6SAFI3KsJfkU8Pr7c4k5aZj
 pAtJq29Pxi4Ym+eqmpHMsWl8tAKmdbCrVvmAhdJqQMXJvZIbwfI5sXlbk3o8iwPBTCwrswwv
 /ur0QazfHbJb14K4Br+AB53826MgA==
IronPort-HdrOrdr: A9a23:KUvYQ6EqCSnPuV8OpLqFBpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ak854Ed3AVV0gK1XYBNu/0KDwQeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VJN1xN/dfWVa9CC4lDgqpUCHa/ec8Sjbwl6I=
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65756988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmNM7ySE/qFdO8KXIwon4DWZbI2WFCQ0WQ0GNGGZcxphRDJg8NT90r2Om0kgDbXhDQEfRhRLjyAz6j+xlWrhKTrQbj6+SLQlJv2FC8SxqSPeGfATUicwcNv1DCKs05XV43DXOtlrG+ch20S8s4rmbSPYggAaotX1W2pEE2BIzDp/tfukQxsOvpAvws5rkEKTQ7cOKveNYhYhBdxdniB2y0KCTLQkdGa8gpPfvTeIH19fUaqeTIAXMSjIhS6+bX9ceS+uEG0CEGXJCfhlnKbB0ijg+zMMv+Pod5GKFOV4we09+ZrkRSQ3mxejWxh3BqDEyMFMIku3oCcXRftn2/oLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=611DOdpLMuTwMAqQwGS9L1cjcG9t+GEoCqlhXsqn3WU=;
 b=d9WTtTMm7EExx+WnakrMb2jv8jk8CIUbh6fY6ulopX/4x1bAPtSl7gscAQH+XnCZxXgHAGE1vwyGaEhwlJYRyhhc15AN1xqcraQRdrDA2KA2Aol+a85xfIIA0Bs4ZBmJmkD63OUFfRHJ2JS1pQBqrQRkU9diVnkXPeo4KHcxTGpdXru+sLZ6v1yZxKWmc/DljpSBLP1hBbl74nXtS+fpTjiPmabcvf1qvGxyAsLZXdWWZ59bJELjiVXK+A4nDVe7GyW9A5U9o0TwQLz7zkFPsCZW1rCc/swULduFs4QAJO5bEibIIr/RBbRUWEftesT1V/QB/4AKkAVwY1fCZo+H7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=611DOdpLMuTwMAqQwGS9L1cjcG9t+GEoCqlhXsqn3WU=;
 b=El08tMB77Ybz/sQF6891ol+wwOLvg0ANoXLGyn6pIrUHLiJsqZLdjkTOaBMmjL/pvamWdXfks9vyt0IGEa4zU1fUnD9tXavVxJkvpeouuUAjpSFTpeWxbuF9y1gVI4QIQSQf99q1srzAg+pOB4Sn07OCzuoL7b2iQf9dTj16nH4=
Date: Wed, 9 Mar 2022 16:07:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 2/2] livepatch: set -f{function,data}-sections
 compiler option
Message-ID: <YijCuo4lppwesjAC@Air-de-Roger>
References: <20220309122846.89696-1-roger.pau@citrix.com>
 <20220309122846.89696-3-roger.pau@citrix.com>
 <48528d19-d6ab-d8ae-498c-091b5b719250@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48528d19-d6ab-d8ae-498c-091b5b719250@citrix.com>
X-ClientProxiedBy: LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e008c1c-24be-41b2-fbc9-08da01de8f85
X-MS-TrafficTypeDiagnostic: BY5PR03MB5218:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB52184157E23AB141262BF8A18F0A9@BY5PR03MB5218.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weinMwpBWjKz5fwd92N4mFaMYVs+3umhPrnu0fqk+/ulBLC3eIRZD5kyFR9LnFKAHg4Q52k1AV/BlVCEomKCZTSZKGXQ8vQsUIT/zpFxI77kFB9Fqb66pDM+ChiVIp/2i6xecxUlT++BTCnMSq3hNvtA/OEC1FHJ94BVUKzIYMTWp5Moij+OPeS/bXiqGch4PL+Kg9sVUgRYCqFa6BLywbHHgJQLJ1kPnkHUqzRr+4TEa/I0URwONZWoDQvs1clnE1m5UhoJUrmTadlcCrNx7w3hIHI7x8TWtm7zVl+5liz4MtDEHO8MJEfgFy7kcs4W5inE4yNPWNUhFeqCZVhlERCd/FEi56MUBQLHw1SAjJc2v+N9IVX/+gx+3PTI9tT2AERk4dbptTt3E62RCBduXzHai7dGwmD5Ki1MPfz+S0mUoKT+pGsa7h/3DHg0TAvd0vYjkOZQKgRUipVYniM7Y9SBEiyYaxNRwk3kqY09KyOegY/ejGMZV791VwGzlU6d8zKTl0ADXSCo7FnvldurE9oiedVWqFePwnKh5TII6dlS9aeVoMnK67QT4HJOeCHFeS68s4t1vdN3pATMVaHXd6d9bUVxIczQzUzSCpnVI4VVrmC9UoMOEHfh83IdlWtVLcLS1YzYkoDJc4Cy97j2qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(82960400001)(83380400001)(5660300002)(66946007)(66556008)(2906002)(8676002)(4326008)(66476007)(8936002)(85182001)(6862004)(186003)(33716001)(6486002)(6636002)(508600001)(26005)(38100700002)(54906003)(6666004)(6512007)(6506007)(53546011)(9686003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXB6UjlqbUN6Y0hTbUh3ZE1XQTRDT1UvY3Q2RXljZjZXaVlnZHNYMTh5WnB0?=
 =?utf-8?B?YjljRUR3SlFRNEtpNk1LZnJTSU5EMUpxWUNWWnR0YVhkQ0RzYXBFem9CelhQ?=
 =?utf-8?B?eC9PRkJsK1pZc3hWR1dHSFNIN3FaR3hKdXE1T3JXN2VocGVzdHRxYnNCVnVO?=
 =?utf-8?B?VGxzSHlONVk5N2JyZThHeTlsbTlVcW1LdzdobUhUUGVBTnMyYlpkMEJYVGly?=
 =?utf-8?B?UWhPYUlOVkFHVjFTYy8xMzYxdVRERE9BZUhlQkZEdEFBc2ZFWVJNcjlvdmtt?=
 =?utf-8?B?ZWIxYkluRm5FTVYyMzBtTHdOOWNtUHdUaHd5VGlGMU1mN043NlJCTEtaV1h6?=
 =?utf-8?B?aDR0czBPdlZ3UXN1eHQybDRQNDI3WHRvNUlBVzgwZ3JPc2dJRG5TaHlQdlgv?=
 =?utf-8?B?eExqVWlITldoeE5rWVFYUmRhdkpEVEpKMUUwb0ZHdTA2VnN5WUlBYXpObFor?=
 =?utf-8?B?UTdFMHUvWXMvQkZaQmxhZEU4TDk5RmhaeDhjU003S2Eza09TN0doTmxYS2cx?=
 =?utf-8?B?Z1VJV3R2Vm9OUW1zcWlLWktEY2Q5Q0ZUNXNJMzB0VzY0Sk9xN3hpNlR0aG9Y?=
 =?utf-8?B?U0Z0djJSajlmSjlhU2p2WDU3Wld4c1VBM0h4Vk55ZlZKaTRqb0R1YVhTQkdw?=
 =?utf-8?B?dkJzTGQ2bWRIc2FQb0F4UHJnMGQwcENrUkNaNDlBU1l5QlI1eWJRb3pxOWdK?=
 =?utf-8?B?dU9ocWlTa3RFcUJEUjVPU0NoVVU5NDJFRFBGejd0WUxpLy9EeWdTSkd4NGdo?=
 =?utf-8?B?cmEyNVlpTis1MDkzNDQrL2pWVk1OR2JCWWR2cVlzUE5reEVEYmhaajhmVno2?=
 =?utf-8?B?d1g2ZW1GMlpUZmlaTlhqM2MxMDlYQkdMSCs0U2UyaGpHTjE2V2VWTUFPU3VD?=
 =?utf-8?B?cG52RnNrY2RtZEhVSVVrUXlXT3pzSndqLzJ4SmxqaVdHT3Iva0FrZmtLYllD?=
 =?utf-8?B?L3RLcjVoSEQrQW96RW1LM1hCZFRjZ3V4cllOY3c4emdqSjlTZVd0ejREcmhv?=
 =?utf-8?B?YmdyMjc3cnAvVUxjM1JaTS9KTlNCblhUcGR5SHNwUWRkbzlnTDdnNmJFZWJR?=
 =?utf-8?B?T3ZXZUJxWUJ6YnNqUW93M3pqeWRxTWRWSUV5dlpQZXBselp3VDdWZWZ2cUVu?=
 =?utf-8?B?YUZieXlvOGFQSEEzVkxaMlRwaHptVFhuVFltaWhxRGJCMlZPQWNvZGY5eW5V?=
 =?utf-8?B?dk55cHpFWjNmYmhzOHlnREpMKzc2U3J5RTNWR0s0MDgrbHFSdVVyN0JFQ2E4?=
 =?utf-8?B?ZmdMUEo1N25yTW5xcStyTXRmVW1SM2FjM2YxQzFGaHI2SDdUVUZKVU9PREU1?=
 =?utf-8?B?VnN2d2w2bG5ScDU0SW9UYmFmc3Bvb21GMngrSWlBL0dsNG40b0YzUXYyNjEv?=
 =?utf-8?B?T2Ntb3hMblhUMFhMRzYrdURsQWJoeXE5N2NUV0sxWHROaG41MTE5TmJuMFJm?=
 =?utf-8?B?Ym5vTHdlUTNsMkJwUHJuNXpjdGgrNzFqZkdieFBnWjJVRUNBYnRZakNaWDZo?=
 =?utf-8?B?aEo3L1FKSUU5Uk93T0JqUVBWUGZVYzhnNzZNOGs5ajl0aS9JWEV5T1Q2Vzgz?=
 =?utf-8?B?Si94bVpUN3U0OWUrMXlCQU5OWjJPY0NhRnc0OGY5L0NVL29jMU5Wek1TdDQr?=
 =?utf-8?B?czZaNGFGUUZGaTJYVUcwQ0x5VTY1eWRlTk4xUFh0Ym5PS01sVHJSS2cweHRl?=
 =?utf-8?B?S2UwNmg1b2g1SVBSczlvWXZjT0VHdURMcG1MeGhkdGtWbko3eGF0WVRBbVJX?=
 =?utf-8?B?Y0hSL1ExYW45UmZDaldSOHRPVzNBVWs5eUpmanR4SDdkS25SNHAxcmIrTWdp?=
 =?utf-8?B?czhWbWFJN0o4Q3hMbG82TmdHbDlsZ3o1dHc2S2dXTVVDTnJTNkE5d2sxa3lK?=
 =?utf-8?B?SFRjVUF6NHBIVDNrOUt2Z21iaTJaU0s3ZkdLN2s1Mm9TRzdCUzRreW14M3pn?=
 =?utf-8?B?K2JiUkp1RU1UUWtNc2YwODZjVFJZTTg5cXJMUk9QYTl1eUh2b3FVazdGT0Q4?=
 =?utf-8?B?dER3dHYyc2VhcEJVUVRVSEZTbFRYViswRjVUYkRzcTdIQXhuRHkyZXA3TmY4?=
 =?utf-8?B?aElNQk51K3ViTWdIUnhIcEJya0RWeFdKa2dETk1vMkFNQkpsRWNjazJYNkEw?=
 =?utf-8?B?OTdzcUZXTDZ2UUZxOTNMcEJlZjJnd2kvelV6dkpzdzVWVUw2c0lUU3BrcUUx?=
 =?utf-8?Q?z8UNmHDpyXzTGYi4BrgUT9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e008c1c-24be-41b2-fbc9-08da01de8f85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:07:43.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmJLf516TiIws3r9XtEMqJMOEFm3FFCaN4cR5AIsCl3X+1ZFKU/4G2SzM3EAZ0+T1dCGBQaoO6g8RCPXr4aJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 02:58:06PM +0000, Andrew Cooper wrote:
> On 09/03/2022 12:28, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> > index 960c51eb4c..4103763f63 100644
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -87,9 +87,12 @@ SECTIONS
> >         *(.text.cold)
> >         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >  
> > +       *(.text.page_aligned)
> >         *(.text)
> > +#ifdef CONFIG_CC_SPLIT_SECTIONS
> > +       *(.text.*)
> > +#endif
> >         *(.text.__x86_indirect_thunk_*)
> > -       *(.text.page_aligned)
> >  
> >         *(.fixup)
> >         *(.gnu.warning)
> > @@ -292,9 +295,7 @@ SECTIONS
> >  
> >    DECL_SECTION(.data) {
> >         *(.data.page_aligned)
> > -       *(.data)
> > -       *(.data.rel)
> > -       *(.data.rel.*)
> > +       *(.data .data.*)
> >    } PHDR(text)
> >  
> >    DECL_SECTION(.bss) {
> > @@ -309,7 +310,7 @@ SECTIONS
> >         *(.bss.percpu.read_mostly)
> >         . = ALIGN(SMP_CACHE_BYTES);
> >         __per_cpu_data_end = .;
> > -       *(.bss)
> > +       *(.bss .bss.*)
> 
> Sorry if I've missed it elsewhere, but why are .data.* and .bss.*
> unguarded, but .text.* under ifdef ?
> 
> Surely they should have the same disposition?

The catch-all .text.* added for -ffunction-sections will mean that
.text.startup and .text.exit will end up in .text instead of in .init
and discarded respectively. That's not the case for the data or bss
catch-alls.

Thanks, Roger.

