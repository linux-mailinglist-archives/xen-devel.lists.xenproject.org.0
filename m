Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4632A68BE47
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490439.759138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1bV-0008Vx-TF; Mon, 06 Feb 2023 13:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490439.759138; Mon, 06 Feb 2023 13:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1bV-0008Tc-QL; Mon, 06 Feb 2023 13:32:17 +0000
Received: by outflank-mailman (input) for mailman id 490439;
 Mon, 06 Feb 2023 13:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+3J=6C=citrix.com=prvs=394ad1b64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pP1bU-0008L5-Le
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:32:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9db4d6d-a622-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 14:32:15 +0100 (CET)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 08:32:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5304.namprd03.prod.outlook.com (2603:10b6:610:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 13:32:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:32:07 +0000
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
X-Inumbo-ID: a9db4d6d-a622-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675690334;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=InO9gJ7kMuXjTwPa9Y6tCCmbMQnhfZbGhGYBO6/nUY8=;
  b=bbOS/k/3OuWetqA0zHaZFYSK58Zu8EXHRvpdf1HKL+ghUkWgpObXdFSC
   cOdoX1bUM9ovOOHWZc3MpIWOXfvGYQNMZ7KZ31oOpUdhAXc9NZlwG/5Ps
   Keg/RkvjAZytAiBz1l986zOcpd38DbVtAWo3oFItkb47TfU+fEsVSj01c
   o=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 95759350
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aZZNyK3/AQY5oXS5ffbD5Ttwkn2cJEfYwER7XKvMYLTBsI5bpzEGn
 2UXXG/UPvuIZjame9wiaY3g9ktSvJ6Bxt5rSFQ4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZmO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE3F16
 NwGFgk3NzOvxNCQn+24Q6p1v5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFcZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKmB99DT+DgnhJsqAWI2zUtLRwYbH+2mNqC03DvY9kCD
 HVBr0LCqoB3riRHVOLVVQCisneAuRIbRNN4HOgz6QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseIa3k9uzHzjzy
 jKLqSEWhrMPgMpN3KK+lXjEjiytoN7VTwczzgTRQm+hqAh+YeaYi5eA7FHa6bNFM9yfR1zY5
 HwcwZHGt6YJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74FI5CEN7VJdyUZJKXg==
IronPort-HdrOrdr: A9a23:fBjhpatl1+gwSG6VBUe5uXGQ7skDmtV00zEX/kB9WHVpm5Sj5r
 iTdPRy73/JYUUqKQodcLG7Sda9qBznhPpICOUqU4tKGTOWwVdAT7sSk7cKoQeQfBEWn9Q1vc
 wLHsQQNDSzNykdsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXgupbnn1E406gYzBLrMMvP+tJKH
 JejvA31wZJAx4sH7aG7iJuZZm3mzWO/6iWFyLvwnYcmXqzZffB0s+PL/Beti1uJA+n741SjV
 T4rw==
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="95759350"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NphLbh23SgsuopA7jSlpMoLEXR/WUTbuWDp5HRUY2yt9QtR2jyM0VDuggLKLnIXVMsABQX+W2Qgi7lOGzI84S39f1fhhcjV8UhENQQZY6SEOk+ZLmQ+HRrFRqYWnwclGMPVl4/clK3Z8Ha/iAcL6h8y7U9da3H+LarYI7ZtkcmM1QzlkwPMxRHPwZkcRPNZr7jFtodvit4xNV67fie0mS1RmX3CMSa7qSwILJTWMfpQh5kND5rizn+Qad2bY2LRZ+tqXO4/DZOasa7gVR+EqW0Wbvnp1+IdFTxICKh5WZFuMzWYqP9DuQvTx9xcXbGJjXZ+d2NwIP87uYreTSfAxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KU26XvtYAlnfDPio15VHdhXYtxe6k0F9zAXGw1cjtX0=;
 b=gc5XrFjZzmwXzuk6zKA+cZX21QUVUNRCdKR4pJr9KYHkTZoBfS58SlfmoWHvYFivQXstwaOQstKCihVsMJJ9F9kgEC7ipAAuy+Ers3GHD7N6V5sREmILgcLGlFwe+mjrkNXGIdK4jUdr8zN2L9l1LrAZ4vsoGNR4P4tkMq2Wuht0PGcRl2waxpzH44+Zf/45yLEAkrNB5NkZmlYvcAU6G/tngKIZ2JxnpwEpywIzK/CTq451FWvLu7juQNKlbw2B4T8h6nw//lnVRe9Hneanc0pkla2v4lZLjkXjG8Lpdjqpu94BN8GerhRjh+lGqqcf3bzmWxkoRec5a+udVFHNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU26XvtYAlnfDPio15VHdhXYtxe6k0F9zAXGw1cjtX0=;
 b=xR70zH3EsHquIL+++eHnQ8VSetzc19PRP1t1vljtaV7XKYhjNo3XSa1oHmZ/YOjfPpoki5lMok+k68ZvBST7m7zOll8D7BgGxCjAK8hkO+Y0Cx3c0uga9U5H1qDmSqtlO2VJccXghGFBSK2uoieutsBLpNQ+UcInmISA0pYEyC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <59a9d75b-80fa-a5e7-f085-d9813a10eddf@citrix.com>
Date: Mon, 6 Feb 2023 13:32:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230206125804.950528-1-burzalodowa@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230206125804.950528-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 572a4be0-5735-4c6c-0343-08db08468a79
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99Ry9GnednHTk77ccVJnmkABQ0lkGFKJ11SyNjjrLFqIMvekWcKkdXLUrEw4CkHR53mjR/WaKlh3vAuBHbczBFICNQeb6uv5H8OLddeH5LpHlyGZNo+RTkSD9Q9jL7TvIItgvZQsZHlpM6L/7puRxUqbyJRdRmvItM0UPsN4K+yWyD8UVV3h0/RCjsSMyMXZ+SCCJfgy/ccjhPwyOZDecF/9Y29i8AR57jAih7xsQ6jd35QP5KyWcMfkQTe0Gsxvy7tdGQ9fGVXMOEcU7hV7WkzDq2QpzY7OvyVBOaflf936xTo9YUvFcQzEnVnlVMaMgAJ7xfnPR3RmmM9gbmNt9Jru+opw0S2aZeMr0L0Ngw2y10S0ldweZKmXHkGblrTxyXhUgFZYlbXEy90Ty/ivNy8scJuITBYh930LVczKeUdJTeKkO1UT/vT0SMXxSIhL8tekpT+sQNQCr6aBzuiN/zctSV2H9hkTMZmAQnnhstveu/PpdKNDJOQ/FYxmrpMbSlz4Gk87TJC8WIjo9jj42ylnJhwK3PGVdrMb9Fgn0r+F7aGqLGNCjNhHpkQsJbc0A/CR/TMl2RU7bdbVcsSjRmeJFFdvGhHWoDTdzb/Ffg8kT5UkoeiuId2zSE2BgaVLetlTudj2VNFrmQqP/qUIjVSK6xZKtiFDBvpW0320HMADsN6p9ciVFcYNrr0Fp5Le7H+ZVC+pYmTzo8rQT59DnHGinNWoPgOg+n3pNpOhpCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199018)(31686004)(2616005)(38100700002)(316002)(54906003)(5660300002)(83380400001)(31696002)(82960400001)(36756003)(86362001)(8936002)(2906002)(6486002)(66946007)(66476007)(6512007)(26005)(186003)(478600001)(8676002)(4326008)(53546011)(66556008)(6666004)(6506007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGdCTXRYblJFbE5CS0RRRlc5cklPRWpoRUFHL214cjBTTTgydmNKR0tMOXBL?=
 =?utf-8?B?S1QvTnkydWtCTFZMQnRKU09FSmhyTGF3RUQ2Mi82c1JGajJSTWdENE4vUENK?=
 =?utf-8?B?MW51a1NpK2xOTWJiWUtBL1djbDdvKzFGeXdGa2cxTFJXV3NETHZ0UTAxeVQw?=
 =?utf-8?B?ZEE3WHk3bklOVlVLVXgzYzIyRkRIU3ZIdFI5UHBrM2dOd0hPbkFKQjA0UjN4?=
 =?utf-8?B?WWVTbmVZN1RSQUdXSjlVREl5WC85QXp3K2svZDFDSHJQU0Z5OUZtUjJYenJ4?=
 =?utf-8?B?NGx0dXdZNE5SdGdwZW5FaDRRSjV0YldPOHEwWFhPTk5qNWFiMUtyVnJpU29Z?=
 =?utf-8?B?YSswUVY4T2htK3psSG1DM21jM1pWVllyaTJJY05wNHlaN20wRUdsaFNvNWFP?=
 =?utf-8?B?N0xUKzJJenRUeURXaDRNdEpmU0xxS2VWU3R4OTAvS1R1clNyb3FHcmlURGxT?=
 =?utf-8?B?ZE1NRnpXOVkxMzVTSkVGcDE0ZTQ3UXBvM1N4WFQ0dnB6aEFJeVJBdWJrZ2tp?=
 =?utf-8?B?cWlzOHFQTXpLaE9vek9ZMjhaSUcvYlo3NjlLTkMycGxHL0RBSWp0OHczRWh4?=
 =?utf-8?B?WDJMc3A4ZWRNTGY1bkFFeTdkQnluZG5IYjR2YlRWWjZWRmp3VEtxSFBuUjFY?=
 =?utf-8?B?UUxycmpmQ1llVmxpQTlXZWZsQjdQdFcrbWRDRWxXcHJPdHQ5SjBpUE04WTht?=
 =?utf-8?B?Z0dXMktlUHBvWndEejNNbGtCb3hpeDRaM0xCNzZibTd3VEpvMGtNSXk1cDEr?=
 =?utf-8?B?YW5HQ1BYVjc5eTBOK0kzSEtXQTVSVnJWVmJDeVFvTklUUDNZV1l2VGF0ZTJj?=
 =?utf-8?B?aTJKR09oVHRGa3A3T05DRUd2NnFWZC84eTBoNXYvZlVCcVFVcTRKNHpiT21Q?=
 =?utf-8?B?THQ0c2RnYnhHMElZV0JsLzZRd2hIV2tPQXM2R0dvcVM4dXROODdwZnVaVFV5?=
 =?utf-8?B?NmdZemJHNUc1N0l4VlJSQUdwZUQ0bEEzOFNCZ0JLZG83bHJQbHBidERRNFBM?=
 =?utf-8?B?YXhQejFQUWdlVXhGRXY1UCtkU0tWdUtrWlE4dDc2MWozNWNIK245YlNlVmhX?=
 =?utf-8?B?Z0hhdXpsb3BUMEd2czJzc3FWVlJVYXdZS0dEbUZTemJ4SE1hcDZnRHhsYllV?=
 =?utf-8?B?eFZzTENhcGR3aUhuVFg1c0IybnlUZ085SUd3SVB4L3Uydk5LNFRXczYrUHlw?=
 =?utf-8?B?WWw4M1l1eFVZSXJvMENOWUtJbm5GMzY1WkZlMmthVEJUdFMvV2xnWVdZaHJN?=
 =?utf-8?B?NWNEOGxOeVM5YjExV0NWS1AxQzd1MWJxd09NTTI3Z1JvakR4ME9EeFJuRUQw?=
 =?utf-8?B?c2JmK2pUcllyY0kvTVhmMDNGYTVQT2xBUmRyVG5IUStxcWpwNkRydy82cnJ0?=
 =?utf-8?B?a1AwNWc1Q21mWUVoeTB5RUNNTEVQWnY5SFdIVWh4Smh6ZlZoak1lN1dXQ1l1?=
 =?utf-8?B?dHVSNitxNVFWZzdlUTkxdGh4VzF6TnRhaGFGUnY5WngzOHJYUzZEZ3puOFFt?=
 =?utf-8?B?ejJha1grcnd2TnlpYU0vVjBoRkpoQit2VWVkb3VkTGFZeU14NmwwajU3MVYx?=
 =?utf-8?B?N1hnVmhsK0pTRmhkMVB6amZwaExKN0NJM3ViaHlVNkEvTDVGN0I4WWw1UTh1?=
 =?utf-8?B?Z2VaWTZnWWJvWHA4RWdoZDlmSTlvZTg4ZXZvQXhldXROaFNtUTRYMy9HUnND?=
 =?utf-8?B?UFRGaWNpbld2YXg4YzFlcTdBNStPWERETHRvRlBzVG83bDRrcGNvVW9UaGJI?=
 =?utf-8?B?UUhQcDBnZ3BTenE4alRWS09GZnlSM3ZSeEhmRTA1TmdGbFhGTmZMeEVqaXFM?=
 =?utf-8?B?eEpIUkxzNUIvNWpaSjNsZkcxZzlLQjdjRWlWbFA3ZE4rVVcxTjlWRktxaEhV?=
 =?utf-8?B?QkVLdXBjMm9oeTU4TGVhK3pMVHhyUzZCMWI3RDV3UnVzZ1Q5NlhZTForSmVE?=
 =?utf-8?B?anU5a3NiUm9qbWpqbHVhcTF3d2VyaHJqMzdkNENXd1N2Z1pNaUNFcmJEME9U?=
 =?utf-8?B?dlNrZEt4VjZ2NE9NZllEUDZVbjZQaVZwbTZvdEI5WGp3aFhtaERBMy9hZVp6?=
 =?utf-8?B?MlByV1J2WHl1dE5FaXpveUgzaXhxanBOTXBKeE9rYjBQekYwKzRPZHJBMEVM?=
 =?utf-8?B?R3VQT1N4QTZCVnVJcitGV2JoVEpCM1JpSzB5QjcxUllBZ0pMT3l1UWo0SStu?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	alFPSYCtObVmtQb7CFI0j4YES4iGIEoyervTS2NpVriZ/mV+JisAbO8HtsLTnGvkK409jmY6I0/SKbJ48p5naO40h0lz8VX1IgXQlC9sq3lwy959NVjhGU8vxfurTuPVTjsbxkJ5BJy5aNoI7vLSE8upQ0hlTR0TVi8ZBWGwlJoFrK6hEKVCdQ7TDeWi4RWtYRPTUgXRwjcq//qsu5bNQCh/mdanDw6RgXGw+LTlRdsx29iDTWb/MvAH/kiwr2YlfkWBIeSkV9QafkPUeEGNEu8qK44N3r0ST4wf8Gk6S4YV0mTwSBb4EVZUccL70DczNDxV5PJTXh1gi4Dwy0P08OjtkzyjIS0IHloPngMA0iAd910RR0ndaYlJYW+pMpt+mm6OWLHFLOQYvIM94T6SiOS4qiEUyOW/Dq1iVLNCTx0oQddY46Y7LkqSh3u9qFLxnMmeSZr00FfhoT0cfwoLF/upXkw3qXwjZOXgSc+cmlWsUpljGBfY9SBKuQWmOsLOiD9UyRTaVP7tYh1NKkUCr57E003reAXSSmiznW9T7xuHouTgHsqXSv1IALnE+GRSsvN/wIWXKv7kTrsAZiA4wfr+6FVcvR8TD7bI7Qt+wvFawHjkAZiy93HRW+6+W+0/YOoyNtQ9cdCSFW9e+Jsv1xs/Rg2eBwFSa2YloIy7WZz1fCQOPQ90JxwVpPDqA37gSv3Z4Xygjz1XZhXOxnU89R6Y3w/EBiuLVmnGsXgbQm+y9YQDAnJGI/cqURhfPT4tdFxUmiPCTpqyAfhABgvWjdbixCWz8uVpyv1yJPm+WFttCgonsXJwwlA8qdztZq/MmOeM6OFYYSu8OratJMTo31odIjyYgUp5zA64kTYEYWJ375dWVfnWodBS4PII/FNn
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a4be0-5735-4c6c-0343-08db08468a79
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:32:06.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+Mevp8Vlgb6PUAPuPItpcX6Ihs/AVgEhi4fLgum4WNu/iJTOJ+exoA/xFQxBloHPZ/yWIl4SeFpkRjV836AcrpYO10kKV2EJobdIPPzZhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5304

On 06/02/2023 12:58 pm, Xenia Ragiadakou wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 270bc98195..6138dc0885 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3011,6 +3011,10 @@ const struct hvm_function_table * __init start_vmx(void)
>          setup_ept_dump();
>      }
>  
> +    if ( cpu_has_vmx_virtualize_apic_accesses ||
> +         cpu_has_vmx_virtualize_x2apic_mode )

x2apic_mode is definitely wrong here, but I think apic_accesses is too. 
The top of vmx_vlapic_msr_changed() is buggy too.

Right now, the hook is called unconditionally.  Given no adjustment in
vmx_vlapic_msr_changed(), the new form (using an alternative) needs
calling unconditionally too.

Naming wise, Linux is fairly bogus too.  This should be
hvm_update_vlapic_mode(), but I suspect the hook will disappear in due
course.

> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 80e4565bd2..b690e2924c 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -786,6 +787,11 @@ static inline int hvm_pi_update_irte(const struct vcpu *v,
>      return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
>  }
>  
> +static inline void hvm_set_virtual_apic_mode(struct vcpu *v)
> +{
> +    alternative_vcall(hvm_funcs.set_virtual_apic_mode, v);

This has to be something like:

if ( hvm_funcs.set_virtual_apic_mode )
    alternative_vcall(...)

Otherwise, Xen will BUG() every time an SVM guest modifies MSR_APIC_BASE.

~Andrew

