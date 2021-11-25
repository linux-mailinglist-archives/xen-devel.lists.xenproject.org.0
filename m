Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CF45D721
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230773.398940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAze-0001Ny-0n; Thu, 25 Nov 2021 09:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230773.398940; Thu, 25 Nov 2021 09:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAzd-0001M6-TK; Thu, 25 Nov 2021 09:24:37 +0000
Received: by outflank-mailman (input) for mailman id 230773;
 Thu, 25 Nov 2021 09:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dIP=QM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqAzc-0001M0-H4
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:24:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f4e28fc-4dd1-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 10:24:34 +0100 (CET)
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
X-Inumbo-ID: 7f4e28fc-4dd1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637832274;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5el3UpuLiQ1ljGI1fLUlp3BSaUVBwuneRtSO2f/vKxE=;
  b=Yr6W7k7xxdT84pB5O6YFeU19SPqC/Y7dkqPOdzyghjzwt2VPRBkqL7tu
   0XaDKY6YObTI1UE373UcA8fYZkpk0zHLG/pLhhoOFFXtZ6JrxhmMHf5oT
   oiCygucqYZol7okmRR3t6IWVbuFSyG9Jxx6QFuNw+SRfXFWNmSiM4fMtk
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0z85WXdirYH6+SxV3AJrv4yBlZrxRKZipvvBJn4hodXnvc3C8W2+vbEEkFzrNFjthSQ2RhiTQx
 a/LnwISg4nydDzA3c9H/g/wQkfR8PpqTcxhq5HPVlDZToHhiheb/LTeVJPBDOcUVcRLjf2W8l/
 pm+EfWY0mKxOPZG6t19tvuDVFgaZnA+GC1AfNq56ivyA7B7gAIr6oODMtX1SRzNQwoQ+pO1Neo
 nls7TgFdRvEHy2lqxmUBcHJ8ykwcBTIu/SE+b7ScV9AsmRg1aCP//6iPP7mVyfbkxA4eSZT2ak
 xAPAJD2ThWi5hY9Bmgh4XUI5
X-SBRS: 5.1
X-MesageID: 58604072
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yHLDkasJdNfO9tvLG18fM8wFqOfnVLFZMUV32f8akzHdYApBsoF/q
 tZmKWmAb/eCZmWget0iao2y8R4C7MKDy4UxTlBtqS0xRH4V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrZCWVj4jPaD3k7okCgh/SSxfB6pY0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25AQRaqGO
 JBxhTxHYj7eRCYWCnwsD6kDh/mlvFTaYQxEgQfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9Ghbc23FymSJ/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZiZNTsMfvsw7fjd07
 waYuInkJAZorpTAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TBhAztJcvU/MBofAnqNOv0j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN4lwOu84DbCrwM/4fj2eN5yMCl/aIKDgYfqqMMoomjmZZKGdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7cQpXcCNlXM+u8KS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:cJot3qHp4OsefTLhpLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,262,1631592000"; 
   d="scan'208";a="58604072"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhtBEtJvancO7QulRuNajrnB4hl/zJA3+ri76d/VOOsIFe6iYqvTF/WB/YGS3LwTLvRoWvR5OxmvJN42zANbKej4YkJ2jtgqrCnEIedEaXUkmU8o6t1O0xML8OuT5KGOaH5mhEPNQAEDCQJ3F2YvdEf8ZLb2wVZHfbkeCxXrEitND7S4Bcb+DsomjVGiMbqcnXGXcdmL5AztTu6it9VptkLtrmtY2OGwynEJU5+g3aTexYCeZzhltVeSLTTe3UJcH18WlpW1+pMnvaqRdp2aIMnwVQGlS6wq+cY8OBWEZR+LOZrSUY7mNnadyeFn/QXG2yt6NUWm18zl3b9EwKyPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnFv9LvI7mKi/swmefPyxLvhUBwfrxUZDCF5Hhq/V+U=;
 b=T7DZZE91pDpMd9q6Jzy8hbEvv5V0+VW+ICi+QFNRGLgKuuYaT1kwtuk9lM4sh1T9sfcrf2bWfX7uX9428KdQdyGJxI3Pqj+3KJUyPDQF0RrOEhLg/xZPtBDc3ySHOr6UgJJLTFMawMhvgknCmB0ISRBIXHh0iXl3qxc3lNFCyVaTDFPAtnzp87xY6ILbtyTGLoSMRHysAiSmj44Xy1eVklG5mLTPksYL3wv03APaJm/eEva3WCYVHLxlNiMaBMXHWcB7iEGQWugU26AjecYdo+We/IYlS3wd1HmS6ZUdIHJd/CWBWXKG0pj/nTEC80Me7m+RueepzHZ/IE8X1AbgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnFv9LvI7mKi/swmefPyxLvhUBwfrxUZDCF5Hhq/V+U=;
 b=isGoscU1hOJMF8sPxGLlGnJdqIrUVLCu0wIlQ1z3QHmEsZgdiVQG2pdCy0HSYACL0wXHItlP81cfsNjxs/pJP/bFvX9PiEJX2X8lrEZtCGnknqAP06Dmi9xTG0efXHyKQOzRgi5oq62SYQUyXM5MXiRPPKbUTF7wespSNog7PlM=
Date: Thu, 25 Nov 2021 10:24:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Message-ID: <YZ9WSfy3pYp8uzqI@Air-de-Roger>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f3d1707-c3f3-43c8-0b9b-08d9aff56194
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-Microsoft-Antispam-PRVS: <DM6PR03MB52734435E761139ACD018D918F629@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7nOMBicj8vJHoHXmZev69xPGtrYU4lHVfCRFxPZMZ/t+HyZg01tKgGSYXIsX8WVjwCBfDpN3p4lTwYR+/ucO9sFgpSWpV7bVGip222hNy+sj08z7oyLiFPlUZ+IB73uoeZTKsF4cvX9QQvBQWbZWRttN17wd1Tpsn1i1Yv7uKhekeOH69SIsUAUY2MkiKmslEu/YXSx9bfyMrlKuXkNaKDxh3N3UsFyuc8YF8Lt76hhJ6wu34cg44CCC3hGDwIdNoSNiBb4jTSunuGtmkAGu7olemjBn4DN0UpqzeUjhE2gN7WmVx8bq850uePROHlVxny9X0BdoOtwLdBOcQa0B5/jteWGuZFvqPp15GEaOHWWDaOCs/mGKGZnSNbaedB0jSgfQrNMYbuzrohOdWVU5xwHG7n6hDrzjflrjnc2fS8YTRsjmmE3vtZJvMsMzuFBzAdRnFLuPaxcnQD80G8A5qmLEKywcqrxa2WNF1mKX018rExsilwVBZig2jqIgRLCnuh7Gc4amuE94hgT05taetmC1f/kA4o6AmnSMf3YsyWiTuqKJExamneAY8s2cX3ykaQjreLlaF3MRYjTRHCcMY/14xsJb1LQJOM6zZS8GW9px6Wy/Yuhb5cDGgmNXRCpxUR+cdcY/HjALqLtsvUOoec2lPPvuut9/V4c79BoCYrxFc7rlzHL7+EXDCS5zAptv2zNYCBJ8mGJMRoG24xEh4bLe79sRokdYRAcPbM23j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(54906003)(6666004)(9686003)(66476007)(66556008)(8936002)(2906002)(66946007)(53546011)(966005)(6916009)(186003)(316002)(38100700002)(508600001)(26005)(4326008)(5660300002)(8676002)(6496006)(85182001)(6486002)(86362001)(956004)(33716001)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3k3VE5oVEl0Y1pEaHhoZ2UydUNuWk9TdFY5NFArR0NCZnJ1Q29pNEI2cVFX?=
 =?utf-8?B?Y1k0Q3l6ZUVpaWtkZ3R0aDZRTUw5QWptQkQrQ01kNWtZVENYeVpCK0NhdUg2?=
 =?utf-8?B?djdxUU5NbHVMU0loRlh4MHAvUG9aTnVXMkdoSWhuODdGZ3VFbXRrTWJ0Zyt2?=
 =?utf-8?B?SUx1YTRWUFMreEZFUU9Ha1JKamJ4M1BxemdKT2xsTEJodFI1YUt3TEttUHhp?=
 =?utf-8?B?eTRRUjBYN1o3OTQwQzZTc1NYUmZhNXp1dEUrT2RIY0s2SGt1V3hScEM3ekdh?=
 =?utf-8?B?L0FjZnpnSXJ5NGRzN1BSaFJ2RTA1dDdzLzVsbWk3MGhUT1VxZll6N2RyMXVE?=
 =?utf-8?B?RDZSVjArbkYreEhUNmcxSitScjRMbWlQd051VC9ob1lDZmVvYWxpa2lZaDVW?=
 =?utf-8?B?MEJTczhUKzk0QzlPZXY0SkJvKzRURGFpTUxmZHMzZjU1MXVhNDV5aFlORno1?=
 =?utf-8?B?RnV1QXYwcVJaOTVVb2ZFUFZNUzVoSXozMFdRajIzS3NZYmZVSURoMFZHMkF5?=
 =?utf-8?B?QmVSK01xdkRFanozYUtNKzMvVDVpUEQvQTBWa0xONkdpVTJubC8xZkRGTE1v?=
 =?utf-8?B?aDA2TTFXanEvZjNDZXcvcm5rWmQzMi9HUVBGbkZVOThwa2Z5NmN0aFdzajdS?=
 =?utf-8?B?TGRFMGFlb05zelQ5emNYc0tLN21vWDRLU2gxQ2tUZDJQeXJRd2xKWFVKcC9l?=
 =?utf-8?B?RTFDTWpzVW1oa3hKLzdPRU5QdW9VaUc0NDJPSHRqTkZaSHd4STRxOEdKMkhy?=
 =?utf-8?B?SndNR0VlMTk4V1AyZFpNZzNKaGlnMGJiQmQ3N3pMWXdaeUlzWTRYaWRHSTVF?=
 =?utf-8?B?Q2FqWlpqcDZ3TTZsYnRMMzdUQWR4dGNhb3p0NkM2QmhVbnBkaUNoQk5DRlpN?=
 =?utf-8?B?Z3BOQVIvbjVhdzVwVGRvQXBTUFg5MDNpZGJlTTg3WEVnd2pPOHRJQTR0cFp5?=
 =?utf-8?B?anhMTFVoL3hXSzR1NEpMMUhiUmUwa0Y4MzhrMHZ4WVNlNGcwYzkxdFlPTGc2?=
 =?utf-8?B?dDNMZW5GdW1JbG5TVXZXOWtKUno0R1VFZWRISFpHUlduelpZbUtXNzdUQ1V5?=
 =?utf-8?B?QWlDbWZyQi9wd2lxSG80MXptbmJlMlo2aGNYNVZWaG8wTThDY2VvSGQ3SkdZ?=
 =?utf-8?B?VXUvNFJRN09xZldrc2hpdnhReVIzTXZPZWlRNEF4Y1ArSml0cy9HTUxUQTMw?=
 =?utf-8?B?TmEwUzlKaTNvcElNZjRMSmdlTWVlMU0xWllLN1B3b1FHbXprcm5ldUR5Tkd3?=
 =?utf-8?B?VmVOQk50dzR5QlE3K1hmR1dHaFdpK0ZIb2dRbktjZjkrZnY3SXRjOHR6THJh?=
 =?utf-8?B?aXJaVFZBRGR5TC95eVNaN1h6U2tpVW9sVGIxNjAwUGp5MFFZaGVJM3hkUEFj?=
 =?utf-8?B?ZmFYNlBhaUdBc2RvUU04amdYZGU2UHlSMnZHZFV5cWJqc2thZUd3Umx1Wkor?=
 =?utf-8?B?bWY2bHRScVpjZTd1NkltbGhMb09QdHNtUCs4eEZRQlRaK0VKMUZ5NkNqYUMw?=
 =?utf-8?B?VG14R1R6MnFLYW9UWnBYcCtnMXp5dEFPN0FuYU55dDY3U0J0UU9NcHBHaHl2?=
 =?utf-8?B?ZGMvTW0rbk8wb1FhSVVUOHlDNXZvRUhIOFdyV1BDQW5USE56bXBIN21JT0xy?=
 =?utf-8?B?LzFTcTU2N0o5YkJmZXNtSUx0ajVCVjBmTk50MVVhaDk4Tkh1cW5KR0lNWlY1?=
 =?utf-8?B?K05HTE9kTEs2azFZS2hUN3Q5WUh3S3poL0NtaEF1Z3BUYXlFaVVZbmdHWFYy?=
 =?utf-8?B?V2kzNEo4MVVZRWFZazBpQ09HWUlUT004MUo2OGo1WXVucC94U3IycDVTZzRT?=
 =?utf-8?B?ZHc1TWxOd2hDNmR0aVlkKzR2ZFZHR3ZWelAxeXY3QmhQZk9HbGVRVkVPbklU?=
 =?utf-8?B?RnRjTStwaXZpRmJzVXlKZ0pzVWlacmhWZ1NnUUxsd3JnQWJXa1ZFT29EWGtr?=
 =?utf-8?B?UkFrVUh2NmRYYWpqTXBGQ1ZOb3VNR1B3cGtwRllmSC9kWm9rQWlVckZTbkZQ?=
 =?utf-8?B?NTFxaDY5eXFUc3FpVG1QeGZ3RC9rR2k0ZE8xYTdTQlVCNC9wNVg2NSt0Nk5X?=
 =?utf-8?B?NHVra3BqSi9tVXRHU1pTcVhJbk5QZkZPVEU5eXBYOWNDSnYrdk41NlVqNkF4?=
 =?utf-8?B?b2hQNEJRQ1FrSG1lMExRYkF0YUljeUN0RVpQcHNJV2cyNnRmWnhUNTJDWUFq?=
 =?utf-8?Q?socUGEwMTI3X6ZWGNV6QUE0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3d1707-c3f3-43c8-0b9b-08d9aff56194
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 09:24:28.9751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUjJ32V5qRPw7ab7lUZguBm4O5ZYjbM6DmGeoWBEnZTYtrFaEmJhW5ozOkk9j0BfJoADjL1YQf8xcZF4jfd3uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 09:57:31AM +0100, Jan Beulich wrote:
> On 24.11.2021 22:11, Andrew Cooper wrote:
> > OSSTest has identified a 3rd regression caused by this change.  Migration
> > between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> > fails with:
> > 
> >   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
> >   xc: error: Restore failed (22 = Invalid argument): Internal error
> > 
> > which is a safety check to prevent resuming the guest when the CPUID data has
> > been truncated.  The problem is caused by shrinking of the max policies, which
> > is an ABI that needs handling compatibly between different versions of Xen.
> 
> Would you mind pointing me to the flight which has hit this problem? I
> don't think I've seen any respective failure. I also don't think I've
> seen any respective discussion on irc, so I really wonder where all
> this is coming from all of the sudden. It's not like the change in
> question would have gone in just yesterday.

It's from a pair of newish boxes that Credativ and Ian where
attempting to commission yesterday. Since the boxes are not yet in
production Ian wasn't sure if the issue could be on the testing or
hardware side, so emailed the details in private for us to provide
some feedback on the issue. The error is at:

http://logs.test-lab.xenproject.org/osstest/logs/166296/test-amd64-amd64-migrupgrade/info.html

> > Furthermore, shrinking of the default policies also breaks things in some
> > cases, because certain cpuid= settings in a VM config file which used to have
> > an effect will now be silently discarded.
> 
> I'm afraid I don't see what you're talking about here. Could you give
> an example? Is this about features the flags of which live in the
> higher leaves, which would have got stripped from the default policies?
> Which would mean the stripping really should happen on the max policies
> only (where it may not have much of an effect).

I think there are two separate issues, which I tried to clarify in my
reply to this same patch.

Options set using cpuid= with xl could now be rejected when in
previous versions they were accepted just fine. That's because the
shrinking to the policies can now cause find_leaf calls in
xc_cpuid_xend_policy to fail, and thus the whole operation would
fail.

There's another likely error that only affects callers of
xc_cpuid_apply_policy that pass a featureset (so not the upstream
toolstack), where some leaves of the featureset could now be ignored
by the guest if the max leaves value doesn't cover them anymore. Note
this was already an issue even before 540d911c2813, as applying the
featureset doesn't check that the set feature leaves are below the max
leaf.

Roger.

