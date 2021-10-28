Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D843E0AB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217981.378240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4JZ-0004l3-Uw; Thu, 28 Oct 2021 12:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217981.378240; Thu, 28 Oct 2021 12:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4JZ-0004i1-Qv; Thu, 28 Oct 2021 12:15:25 +0000
Received: by outflank-mailman (input) for mailman id 217981;
 Thu, 28 Oct 2021 12:15:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4/Z=PQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mg4JY-0004h1-A1
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:15:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b907f645-37e8-11ec-849e-12813bfff9fa;
 Thu, 28 Oct 2021 12:15:22 +0000 (UTC)
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
X-Inumbo-ID: b907f645-37e8-11ec-849e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635423322;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wo3lZqbfES5TyRviIoqJ3nRNqzln6OQQuxUlfM6B6OE=;
  b=AtgzeQVWZNaQAVomFBrHQ0G8AK6RpdPmHggO+5HMbCvNS/0okzj86tv/
   rvCJYkbkruCPWTu+F5sqD9UuFez773Ld003W1c6mKiamf+CK3DtG5paCz
   QxUhk/le3j9jGDXL1evri+XImUpDk+Hq82hnbAYGZD9q3FtADRXpMFxIM
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Fuqpa7iZ9W9k1Q1kd/LsSTcO9O22zglR7w0PNQcxbG5VJSCeULjEer2u4HXwEeKmuUwwHuoBs
 rExq21cQOdI8rc3GU/egxMlgk0/KxVgUZ+4PMIDQ1xj3D+pgCrWdnqILbyz605oR16qHKmaSeu
 pOONfDPIk6iejv3kM5cLWKse3yWj1dT5jc6pBwCps+s2QTHyv4JKMHMRz1i5CSv32fgTJGEe3h
 oOqk/fB7ZNeHBits6bicK0FCYCnRM1/WTPbfmQCaIaCCnPRUkSs76N/ZZo+H4tZerbIMTfrhJ/
 Of3/0UYmnDAhMRR0wyMmx258
X-SBRS: 5.1
X-MesageID: 56532491
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LmO7Fa/wcnLLZzK2ix5gDrUDfXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WQdWzqHM6nfajagf49xaNi+/EMBu8KAxtU3SQNppS48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhoy
 ecUpbicSD0AJ5/ptvYTcyNcDjFXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0QQK2EO
 5tAAdZpRBqZODFtJWpOMskVhtzvwXPvVgVS9E3A8MLb5ECMlVcsgdABKuH9WPaHWMFUlUawv
 X/d8iLyBRRyHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+VES5iem0jFakXNBSI
 FBS/TAhxYAt8GS7Q9+7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZYae5/pOsaRAYDz
 22sscHnJQZrra28HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44T/br1oyd9SXYh
 mnQ9nBn1up7Ydsjjv3jpTj6bySQSo8lp+Lfzj7cWX659UtHbYqhap3ABbPzvKsYctjxorVsu
 hE5dymiAAImUc7leM+lGrxl8FSVCxCta2S0bblHRMBJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsPtnvU55xk/mwSbwJs8w4iPIVO/CdkyfcpUlTibO4hTixwCDAb4lmY
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzB8VaWJm+p9K+SIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILO+5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:YABEYakJiUJJF9jZ2bSt3JhYSXXpDfO8imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOqXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6S60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKcQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOifx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Ss1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgv/DWVZAVwIv66eDlGhiTMuAIm2EyRjnFoivD3p01wt67UEPJ/lq
 P52qcBrsAGciZZV9M6OA47e7rDNoX6e2O7DIujGyWUKEg5AQO4l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56532491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/fJ45rur22KrHXaUIVbmesWJBOKha/wpD9rkuGVdmKT8JgEnb3OqvdiunZMmD/hUiptd+SKlg8/fb18hGwiudorKj/sNi4r0+ggGIxqoTmVAkzhhyE8ye0/AwBLB0CMvmNaz1SY6BXNQeJJ1yospViicNLeKvBvvDT/pCfvVu8Isw2p4iwDmmwM6iX6Dcq5Sp/5Jzq4QHhNeqsdBcT2QWGZjJ1WXxUkUXKAfoYu97dkYSRFEiQx2TS7yOeCA+ZKbYMLTADcLZxUY3pHk7LefOJR3VAvpjByF7H+xv+SwSivQAPmceKuIRsQPgKP/QxEvQUwvD+nMgW5H8wDIG2vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v16CIS+WGRPeYy/jCskGG6tDbOi3oFXX1GfOs71dYM=;
 b=Qk9NWUudZrLL5h7FT9pRvnJEa4AcTImicP+U0i7xDZ8e9M8OoBcoYRfl9gTqhL7LCUsW8GfkpGpl1RwRvhXbXuNB87h+pT6il4u582ZvvTJWuLntezp5wqsEJJtyd7WgBypVyYeCmDnZcAKX4pulw4393JRv5X1UhgFQhqNRK6LKO+hS2GsRe78OiUNnCHX6V1aHEPVphNmeMqNXIdGsWTsr9KtzN+Z013MbnIGiiDsCl68Nv7uDX3AGvhZozAV/nViqzGR93fgXHd8nxczpCQMGfdVHGVWmV1olY3gCmiJHIuZOzYJdbXyfJ1gA74HpcXzkB/F79Fs2awHTDTSUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v16CIS+WGRPeYy/jCskGG6tDbOi3oFXX1GfOs71dYM=;
 b=qwNyHypgvu8Fvzw+X+//0nzg4b3oAKGtfj3RoYYF6iM8vbqDtHzC3jCissj1Md4WIeCKBPCBZp01AYMySgWXj/CZxt5t0WK0FbKY0YpuhNGIjzCr2JRG6sB+6SbLFlNqFZgvIxBV0bES8SeocgZQsRovCeE4nIRBlbqKvvTIL1c=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <YXpRzHEawUZEU87h@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
Message-ID: <64788530-a18c-332f-c287-84478a200816@citrix.com>
Date: Thu, 28 Oct 2021 13:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXpRzHEawUZEU87h@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32eaa458-0f5a-4b5d-1f80-08d99a0c9bce
X-MS-TrafficTypeDiagnostic: BYAPR03MB4615:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4615B808B6560A0540B32CFBBA869@BYAPR03MB4615.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chi8N01ZnJLFGXWVQT1LE/Z+rcx4YwCa1gVpohx75vHmGiRkOhbJFw6n9qeIhG4Q6vwMoyLZRPKx9pJULhz2E/OWvZC6VOyTqs1t6Ia3vBY1u5G5BCr2V3JBIShdL8Cb3PgjEskPgbBRxlCsuD/8PONKURSF1PX/b/K2LDBcKUwLSXSOheMeswmqBQ0KPofSyCUOhy2OU1IClM8f9BEjsaJNCIIl6iCg2ADhyVW2+YxqYSoNwVK3A5q6VjRfGV9SZlN08nkNWXy65zFc8lR5u/CYD/i1UUfdikg/SOp10r3tPbWCnZTrQUs6PkunPgngKH96EFJl9/VQgn6WX4Oxi4hvGxCwLYVDfjhav3mupoXdUgdu8v2jOm4wAAtQA13tMSljVSfxgflE9DMFmoPHCp/yjH+SA8mHDVD/3FBAHMhhqA8r/bjn9cOSlpM24YivGUMFozsDqFCMaCYtOM/HH9Q8Pd0ShOyiCpoJtolmviTbD50NGyCzNlVRDv8F6wiXNIP8brNs94hb/5ROFHj7MwYVp6k1zShOUyEqXVbh/hlBDeqisAY2ZjVYyzlylrLblR8IoZPR4V2iv8fHIdzcN45adag9zzBdN7y/4HRJ/vc7xJTtxyXtnW4tfz79nm6hMyBiEze4b1K2Ml9OYTHOraDX4jZ+vKIQYHueo08LRpZWqUU0pM3bUBv81YZ7naQj2rg2F+h5QjGGGqT8XrrivVn5gxR7oI04BiRYz98zTIfZ9ToE76dTzyUB3k4VveQs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(508600001)(186003)(66476007)(16576012)(37006003)(316002)(8676002)(82960400001)(36756003)(54906003)(26005)(956004)(6636002)(66946007)(86362001)(6666004)(2616005)(66556008)(4326008)(38100700002)(2906002)(31686004)(6486002)(5660300002)(31696002)(6862004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVdnWjVYNmpDVVJaeE1UYVVpTWpVWmtQTW9maEx0OEprRStVRDFhTDB2dDlI?=
 =?utf-8?B?a3QzQTRiazJ6eE5lNDZ1ZlcrTFdBSHlHbFFEamh4UE5XSVR5dlNlNk95QnFV?=
 =?utf-8?B?aXJ1blVLUUlnaWgvcHR4emVVdEM5K1N0SHoydng0WDhISzFpOFEwZ1lUankz?=
 =?utf-8?B?c2pmdkF6ekM0WDBQc1ZDSkZpanBodHlPQjBKS2lvVEtQZGFqS21RYnZiUkZo?=
 =?utf-8?B?R2F5VDFGTml0dklxVWt2QTh6Sjd1REplNFNNQVF4Y0UrM2VVMmt0amN5bXJF?=
 =?utf-8?B?TzhyTVVlRlJCYnR2Vm90MnJCM3gyWGRTdjhoUmViY1ROWWVjcGJTUi9WYnFH?=
 =?utf-8?B?a2RIYnpXU2NMU3FLcytBK1lkM0NVdUJRWEtZNXVMZktoTHR0S0hPanQ2ZXln?=
 =?utf-8?B?YVluNXdOZm9BWmpNdUFUemh3a29mZGFOcTVuQjJVamVrcXBtQjQ0ZXJPKysy?=
 =?utf-8?B?a0MrV2tFT2IwcTRTRmZ1bDFzUG82UjliK0czbXNNTEw4S2hrWURoTzJZVTVo?=
 =?utf-8?B?ZFhDREIwKy9FdzA3Q09LeGxFU0FjaGRjNGJOY2R5SWsvU3ZRSFVGNTBhb2FV?=
 =?utf-8?B?ZjVERHFLTmRLWlE0amJSS1htbVc2ck1jVjZPajNFTktxOXlaUjFlZnp2Z3l0?=
 =?utf-8?B?S2JpZGJRTzFuQUJlZmIwdTg2bm4yMlJUeDVzWVUzTG9QZUhjdFRQdnphY3Q0?=
 =?utf-8?B?ZlNOL2FBOHFlZy8vRC8wNkFTMkZYMnA2UGp1UTRHMHlrekJpSDZRczJmS1la?=
 =?utf-8?B?anA5Vzc3bUxJN3dnQlhIOFZlRW13VzVaOUpHNDRIak5vQnJvTXVjcmY2em1F?=
 =?utf-8?B?WTd1dHY1Wkt1Um1BT1J4M0FpbzhJaVQ4Z1ZRR3hBZXp0dllEK1dHSW5rdFRG?=
 =?utf-8?B?bGh2MEFxODFnbUplYWJsdHNLYnd2OHBibTE5T3d5OXYrd0lGdkVMWWlWRDZp?=
 =?utf-8?B?ekZ3dTlLZmVqQk9UNmRvZzY1UGVOZzE4d1U0MFJzTUw0dWYxRHE1eVBkd29O?=
 =?utf-8?B?MnJ4dmpCSUd6WGtMNVVQZm1BNjNJRTROYTJyRU9TNks0eFc1RDhzYjFIZTAy?=
 =?utf-8?B?RUdmenVET0JjWklIRlpNdXRSWksrbmVENjRsYlFzcDYyZEdVL0wzeWFJWmdJ?=
 =?utf-8?B?RllZL1RXNkFzVUN5WW1MSEZoM3NJRXJjb1NtWDFlMWQ1MHBld1p2bWxsNGc0?=
 =?utf-8?B?WTNLNWcwUEM1aVY5K1pIMkl0Y1NMRGpjanAraDJlWmRieXFqZUgyNElrVTcz?=
 =?utf-8?B?U0ZoaFBhZmo2MGlDc0xHN2hJVXMxT2ZDZmxadUxFVGV1dEtkMkZBSWhWU3Vw?=
 =?utf-8?B?dVdPYlhjN0s1bFB6UEU3TDBRcllRNlFDTFZrZ1JsNENBcU43UlN5ZEVJVVpp?=
 =?utf-8?B?Nm5Ba3Z6NUc1bjJhOTNTSU14eDV2bzE3T0VxbTdmV1NQdnp4WHlCMFhTOHpl?=
 =?utf-8?B?T1NJWkdyTGZqY0NVZXBJcGFZZi8zY2MzTldPM0tERllMZTJzU2ZWOGlqQzVp?=
 =?utf-8?B?N0xsclpKd0Vla0hDY0QramsxN1cxaHlkVzVFaTBNSThpendLL0xSNUVtbzBt?=
 =?utf-8?B?WHNJTVhrSjlhaEFSMllGWmJjakVIcnJiWXVsbkVIOGlqTHBZc09SRFBFN0F0?=
 =?utf-8?B?OXpHT1ArUHVZK0xiaC96bCtCNFJFbWphUXZaQXJCTmpYS2NPOFR3YnZTK1du?=
 =?utf-8?B?SUNva1B6Zmx0K3Y1d0gvRXpHOEtrZWhFL2xFNmFBSmRkbUxqUE05T2xsc2Ry?=
 =?utf-8?B?UFZOUEhab1dHR0swM3J0TnBvQXFwODNhRzNaOFdEcmF6V0VzbHhRVUVjQW1v?=
 =?utf-8?B?VkQ4T2lGT21YNDR5SlgveXFjVGFOT2lvcVJxM2RGMjY4SkJMelNpbFoyWFd2?=
 =?utf-8?B?WlZMY2p6M3Vjb3VUUURCNXNyN0N1Nk1ib3Y4RHUrUmZidTdEZmVCUFBxSHRR?=
 =?utf-8?B?TFhFSlloU3psWDhtNTBCV0ZrdDdyVHk3K1BZeGxLa1RnR1o1MStVVmNaMmtl?=
 =?utf-8?B?OGptandSbmp0a2w0TmZBaHdRck1ENEZ3V0NwTGdlTkswaTdxVDJUalNudGpy?=
 =?utf-8?B?ZUc4Ylg0MFVSWVBiU1p2NDhPNDdxMU03TzF6Q0tvQVNiazEzbyswZWxvTzVh?=
 =?utf-8?B?OENyanJLVkdsazhJNFJPcmFjYy82N25jNVBzT0hnUEk1ZHZ6bFA4My8wNHFS?=
 =?utf-8?B?bUFQT0ExUUFJZ0c1ZSs0aFZBSzNzbkdzS095RDhDR2djS29jVWdoYVZYUWEx?=
 =?utf-8?B?U3hXN2ZUMU1Dc1FESmpzaGxqTllnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eaa458-0f5a-4b5d-1f80-08d99a0c9bce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 12:15:19.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VH/beKBmPMU8e6a1MFlXt3rN1pZPDDyDlANROfJnXEVJOMf6KGXZBSUfc1Ujfa4viBcEqOzjpUsX4fu44ueb8Ht8OeDqSU5WRboUnSf2pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4615
X-OriginatorOrg: citrix.com

On 28/10/2021 08:31, Roger Pau Monn=C3=A9 wrote:
> On Wed, Oct 27, 2021 at 09:07:13PM +0100, Andrew Cooper wrote:
>> GCC master (nearly version 12) complains:
>>
>>   hvm.c: In function 'hvm_gsi_eoi':
>>   hvm.c:905:10: error: the comparison will always evaluate as 'true' for=
 the
>>   address of 'dpci' will never be NULL [-Werror=3Daddress]
>>     905 |     if ( !pirq_dpci(pirq) )
>>         |          ^
>>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
>>                    from /local/xen.git/xen/include/xen/pci.h:13,
>>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
>>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27,
>>                    from /local/xen.git/xen/include/asm/domain.h:7,
>>                    from /local/xen.git/xen/include/xen/domain.h:8,
>>                    from /local/xen.git/xen/include/xen/sched.h:11,
>>                    from /local/xen.git/xen/include/xen/event.h:12,
>>                    from hvm.c:20:
>>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared her=
e
>>     140 |             struct hvm_pirq_dpci dpci;
>>         |                                  ^~~~
>>
>> The location marker is unhelpfully positioned and upstream may get aroun=
d to
>> fixing it.  The complaint is intended to be:
>>
>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>>                   ^~~~~~~~~~~~~~~~~~~~~~
>>
>> which is a hint that the code is should be simplified to just:
>>
>>   if ( !pirq )
> I likely need more coffee, but doesn't this exploit how the macro
> (pirq_dpci) is currently coded?

The way pirq_dpci() is currently coded, this is nonsense, which GCC is
now highlighting.

It would be a very different thing if the logic said:

struct pirq *pirq =3D pirq_info(d, gsi);
struct hvm_pirq_dpci *dpci =3D pirq_dpci(pirq);

/* Check if GSI is actually mapped. */
if ( !dpci )
=C2=A0=C2=A0=C2=A0 return;

but it doesn't. Getting a non-null pirq pointer from pirq_info(d, gsi)
does identify that the GSI is mapped, and the dpci nested structure is
not used in this function.=C2=A0 I would expect this property to remain tru=
e
even if we alter the data layout.

~Andrew


