Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60D66057A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 18:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472823.733202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqKl-0005k0-HV; Fri, 06 Jan 2023 17:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472823.733202; Fri, 06 Jan 2023 17:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqKl-0005i5-EY; Fri, 06 Jan 2023 17:16:47 +0000
Received: by outflank-mailman (input) for mailman id 472823;
 Fri, 06 Jan 2023 17:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDqKk-0005hz-9H
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 17:16:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a47588-8de5-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 18:16:44 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 12:16:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6776.namprd03.prod.outlook.com (2603:10b6:303:164::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 17:16:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 17:16:31 +0000
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
X-Inumbo-ID: e3a47588-8de5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673025404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gLRhIwINg8SKw4p5CaBpYacg5GUGCKOjTC1xEUkX0UQ=;
  b=Ytqk02QEqvY9ZJzT/a7QuTp3+j3s07WKSjMwX3THD+XLQh9XZzQBW+k5
   QFKdLI+KB5cjEMGuSn+ui7TtBX2/D0lOtLNR4va0XVnV6dFyNCVm+3ZHg
   mu73ehuA5P3BtHyWEOUOCB1wiBW8JhudISqM7MSrCklaXrIguF+hSFbHW
   c=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 90455449
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ps99SKw+00Fh8a2Yr696t+esxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 zAbXW6HbvyNZDemf40iOdi+o0sHvpDVzNAxGgpsqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPa4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVte/
 K1EMAsdVwikq6HnzYzjRsdxmO12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAN5PSeHkp5aGhnXD/2sRVQNPCWGCsPqaklW3aYlBL
 hQtr39GQa8asRbDosPGdxe/qnSVswUcX9dVGusS5wSEy66S6AGcbkADSjNCc90n8swrXzsh1
 lyOt9zsDD1r9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjIgjuqooXCRyYv5xvQRWOj5UVyY4vNT4Ws6EPH5PdaaoiDR1+Kv
 WMshMSVqusJCPmlnyuLRuIPELi35u2tPzjVgFopFJ4knwlB4FamdIFUpT17ekFgN59cfSezO
 ReO/wRM+JVUIX2mK7dtZJ68ANgryq6mEsn5UvfTbZxFZZ0ZmBK7wRyCrHW4hwjF+HXAW4lmZ
 v93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:Q6PAEakmA/747Zojpcj75InezEjpDfIW3DAbv31ZSRFFG/Fw9v
 re/8jzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0WKN+UyGJwTOssJbyK
 d8Y+xfJbTLfD5HZB/BkWyF+gAbsb26GQuT9IXj80s=
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="90455449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxutUXdXhtsYDp/qqj4sO6WaRC5GSjPswhkGR2CC/FzLsy3hpfXYwUPecr6RZKgsP9UE/P/vpaLJ8HTfqxZWDVQEuanf1VzRIgBl4nX25koLiNBAIwRp8Nt+o9hzxh6OyznLDdr9JEZ5g+gEhBhxoucPui8yEkDXkivwLl3Dtu/rhHbsQYLgEydanGxALRqB6DHFhAwcUtGR6pj84vVv7W2iUZjwj+13Zl8qnfqDFpHbDJW841A93/vScLvIftLFulr5GxSrAjrVlC7WGEnfsAawbSPvitkHkDeY1u5qMTGaWSWEHcxKqA7gc7fid+XGHOjLtiWvQhN0yjBprFCTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLRhIwINg8SKw4p5CaBpYacg5GUGCKOjTC1xEUkX0UQ=;
 b=cQv5xgzXF5MSQCti70zoM3aDp4HMlB5szNkWLF3VrORWTneCRwXWikfz6EFNHkNzBlcwF6VXFDVWeVHYEBBSmoNjxMjvMw52oX5MXnpsuFTLSM9zZ+bYNNJ/SX7/d0/+ppMxHV9ESLpjG5A2EFIanlaPXeS0NiIq2AVugPRafKsRe86mblIwSFb11iZ9hxfVkmnXGFgd0a4W5uyw+sBJnOWBuzSM8Pkvq45UjT2JZsR1xNOIQnQ5OAEy9s2BwTfT+qJ2F1/kOykpJ3oguRMaYIXZyUV9X/oepcnfELzP67K8+g69FBz1vD2shZnoA4DTegv6ta+bgFN6b/yq6RrpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLRhIwINg8SKw4p5CaBpYacg5GUGCKOjTC1xEUkX0UQ=;
 b=AvWFFyy7w+a4lnwzce+FLOWzbc6UYbSujbJQKjL5AZ3eFd7hiT6TcnUxN614s8+q9wdOc5zeRsvd4LWRv079g4+qkk7JyAYJZaJF9Qg6H1r3B1Q7xHaNSQseKhGPXGDvclL1mlJhZP937GfSpzZD7vzWKw7pJJOMHzymaQgyGTM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Thread-Topic: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Thread-Index: AQHZIdDaR/Z8ZObOWUu8wVolwH1ydK52M2qAgBtuMAA=
Date: Fri, 6 Jan 2023 17:16:31 +0000
Message-ID: <320cc1b3-f03f-ad87-205f-d3c5db446f7d@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
 <Y6FUy/F0mbrvRP3e@bullseye>
In-Reply-To: <Y6FUy/F0mbrvRP3e@bullseye>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6776:EE_
x-ms-office365-filtering-correlation-id: f7a1615e-5147-44d3-3917-08daf009c13f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JiEODwImNz+2GnlQJbmMK/wHO55GC2W8oGAyCiZsGC93bsLDYtr2SMFkmPn5KXSPORVvQ3jgEynVlj2edemnEqtRdg42l2xlL10TGQPZLG4FuPj1y0lN/abG3nUBX96e4UhLn7gJ0Q75aLw7YnJoNYaXEb9hZvdAKKRC8U5Tiirw84JHaHt25xyAE/CD5RAf5UPagpODA+s5IGtP59+x0xjLAe6ecqIEqfWgr0LosGhyDDCwR9k/lrzi5JvD+Xq8uANL2ReU6RCOtOp5jwE705oO4iQMaekooNYnFdsUOXNUK46rYnVsBuFU66lcrdW/i/GRWZ4TYMDcEzQ9EsTcgUEuZGgGNbDxO+wqc+km6SuQXm2ExyremOWR5xexykbVIh9i7tyiyXSX+QSF3MdPnMxRf+KwRfb29bot/fVcRbCeBqvXsyV1cFDzAo3b29X7n/pw9MBl9a+wzNOKaOI2zDaZcPzykgDybqv5QeQMTVjh39FRoJTV+YzKKAkSq/F5S6wpMxjSDSZS91t2xfCbGMlM1usmxwJPKOuoyGGDlHcyBy48XgslpZKMgjwEcUw7LqqHo3od4aHIPk86usJvOB5h9w1HggoUNVJsfSe4w9KsUSPUOjQ9+hxXAMoRNT3rEWYGrBHIR3YmyW+AYRCqtlo8+4PQw9O4eY7U36ODweE4QDgYcNIl11JN8N5SaKN8XmCjzqt+nkmZDDJHFWZ+5kLNNiCCFvFBpM3cHqP/z46VxpuuLb+7EN5BJlwBZ/TGhq1on37+Xntf9/8tG7+sfw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(186003)(26005)(2616005)(53546011)(6506007)(82960400001)(86362001)(38070700005)(36756003)(31696002)(38100700002)(122000001)(8676002)(31686004)(4326008)(41300700001)(2906002)(5660300002)(8936002)(66556008)(6512007)(66476007)(71200400001)(6486002)(64756008)(91956017)(76116006)(316002)(478600001)(110136005)(66946007)(66446008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckpMbXdzQjlsbStXMUJFRElWVHRZWU04YXh2bWlpS1dkakRWdzhkWjQwUFB4?=
 =?utf-8?B?N2E5SGVSb2RqMXpzODJSckdoYWFnZk8xWnNpYi9kWS9KaUNvSnVOZm4rcTVK?=
 =?utf-8?B?Y0J0SjdJVWFLUlp5eitqa0lmVEtuRDBqbDVVU25VNWhWTXZGelR3VC9CUEJk?=
 =?utf-8?B?c09ZT2FDcVVibmd4TWNyRmRMM3JoWk45bEtmSUkvZU1FSEtpdkNyRkFWcWtX?=
 =?utf-8?B?aU9lTGk3K2sydnFadkVKUmVHY0FZRUtPL3NmV2xQVnIvS3B2bkw5cThQQ0h6?=
 =?utf-8?B?NzE4MFhCSDl3L2tUaENnb3ZpZjJFMzNNSk4zRjRTU1M0dEFJQ2JHWFNwRkpv?=
 =?utf-8?B?WW4wVzJjVEJmWWpId2tSNjhwVzBqNTBwS1JWbkdoUU4rY3VRUGVEVm52N1dD?=
 =?utf-8?B?MVIrNUIydUh0Smh0eTRRdkE0QmU3N1ZURk5YNEVZekJXVGNkenZqbDY0aTQ1?=
 =?utf-8?B?NWVMTitoR0RRRnd6dTlYa2NRN2FHMHdYakE4R2RGYkVhZXAzcGs4ZjBoLy8y?=
 =?utf-8?B?Y00yd3pBN29PMDdRTFJ5V1p6UXYrb0lSWFJwQUM0UGY5a2tWazRHaVFMeHB0?=
 =?utf-8?B?MGQ2ZitHMHhPSlhiVEg5UzJ5ZlQwT1lwR2tHeVhxRXBJSkVqcmtUeHVGSW50?=
 =?utf-8?B?Yk5IV0VNQ1ZaL29wNVFveThSTG5Sc1pyRkZaME96RnJxbitoZExKTkMwOW85?=
 =?utf-8?B?Qm1NaStSTTVhNkhkeEJ1dG1Ib0hBVEdCeDBIZnA4U3Q3VUhZM1RqOWhUc1BY?=
 =?utf-8?B?a1FBQ1dwSGIxb3B2WC9yc2VCaXh2RGtvL0N3Qmk3ZXhpVzdIbHFodDU4Tm9p?=
 =?utf-8?B?UWQ1NVBjaFNQMXdXYm1hMGpUdFo1K2YzUGpWWDZwdFViTXJyU2hnaGRTMjFl?=
 =?utf-8?B?ZUdZL1JOeGFON2JnREVkdGluZ1RJb0p1V0VUc3hmZVZjeE1sb0Nsb0RxVjJt?=
 =?utf-8?B?eGVFQ3BjZ09UUjMvS25wUHhEdTB3ZzBQYy91RHh4N2FzZzRGenF3OE5xYURh?=
 =?utf-8?B?N1RVODdjdnNUVmtkT1hEYlNhRXpaNGZ4TTdQOENOT3JqOXJZemtWa1djV0Ja?=
 =?utf-8?B?c1B1U1R3UlNYS3BJYVpmUDRJVmhsdmtiejlWMC9DRXcwS0xPdVBrY0VMejlv?=
 =?utf-8?B?WSszb2FIOVVyZE93YWJNYXJ0ZHJraklxdzdGQkU1bDljYldNeHZ4YmhEYkRF?=
 =?utf-8?B?bUx2Yko3bHdQVHo1SnRpZDB1TmVjS3QxaERhYkI3bnlyWWo3a2haL0RGdXFI?=
 =?utf-8?B?T3lmdWdvQ3pNTEJ1K0wwRWVrTE1BYU1tOTFTQm5wTU5BZGZRbmJWUC9EY05R?=
 =?utf-8?B?eUZiM1RObUlNOEp3K3ZxZXZvdVlOVjJJRXJXdTJEZWhnZGl3MGloTG9CZTYx?=
 =?utf-8?B?dkVVekExdklncm54bkV1ZnVUazdUMVhheW5EMTMwUHc4NW10TGRzY3lVTEhi?=
 =?utf-8?B?cm5uTHQ2Z3dOUTFTcDlEeFhmQmtCSHhtQW52Q2puYm1pQXgyNzJ0ZEdsSnlS?=
 =?utf-8?B?clNQRU9IN1E5MGVad0ZaT3BadXdHN1AwWHZKZytwUDc4SkpCc2IvclpzZFha?=
 =?utf-8?B?dTE4QUcwRlBoV01GZjR2R0xhZ0FPV3IyWmxWM0p2Mlp4WUx5NW92K3B4R3hl?=
 =?utf-8?B?UVZQeDErUWdlVlQyV1dvRmIzUHQzOTFVSi8wU0U4YXhCY0U0S1RsU3BPYUIx?=
 =?utf-8?B?a05xY05tV0RoWkpDQXJWMzQvQTFwblhQZjJhMnprcENwdTlVOW5QRVVmY0J2?=
 =?utf-8?B?Ry9RRkwyWGVuQWlCL3N1YmNwamJGWmNOTXdjZ3AyUDR0ZkRhRlBFWEdPNmpK?=
 =?utf-8?B?aHRjdWN5SzJ0eGRock1WQkxLZVhKMXdTSEx6VWI1NXJqRThhZy9qSlRuMnht?=
 =?utf-8?B?SEpEMVB5V09aUnlHTUlVRXlzTlN4N2NEeXF4YWtIbCtHZmJoRG9VcWZLLzlk?=
 =?utf-8?B?Mnd4Q1c4ZTZzaDRBNE5nbUJYRXovWnBkM1Z0Wk05ME5pMlZFMi9OSWJaV1JC?=
 =?utf-8?B?aWFUWmZjdXZYT0l2ajVXTkFteDBaUWNhYXEvbFZScnA1ZnN1ZnBydnFHR292?=
 =?utf-8?B?LzhjWXV1VEtiQWNjYjN6UlBKU2NCbFN5MFgzNTQzYTlRbEFoa2FpV214YUhZ?=
 =?utf-8?B?SlE4dXZWV2NjQ1pwQ2JBbG9DNE1iVWo0Y0VqY1REMEdrajRLWDVxWVpOSFdJ?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C38535D70A0BFF46BEE909E546DB8C91@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RE5zbUlyMnRGbjhOU2JLci80RmY5WUZrQXBJN3dMZmFzdGZEVzJyTlQva0py?=
 =?utf-8?B?RjlsQVBlclU0WVF2b001TkU0NXZRdWdsaFEvWHdPaXdiZkpwWHVyY3FTNlZj?=
 =?utf-8?B?VnNuYmlmYTVXZDdwNVVIY1FTSFNXak1uY2drcWYxb0g5a0o3MDFkZkI1dklP?=
 =?utf-8?B?OUd4a2M3TjVWMmxpWkpLd1E4MGtjaHhqdXB1SU4rektoMnpKNVd2Wml3V1ZY?=
 =?utf-8?B?WkQzSXQ0UzFKaGkxOEpIWXB1Z3duYUNvakYxSGlNeU5WbEt0K3RXMzdXMnFI?=
 =?utf-8?B?QWxEQ1gvUVhvRk4yTzdlSXBnUTcrZ0hFVlZhaFRVRjRuN3ZGTWJBZjRjdEZF?=
 =?utf-8?B?ZVBVMEUwaEVJNG85bUs1VlVFbTBFUDh6bGF0VGRCRjBGQUJXQUc3YzBIOE80?=
 =?utf-8?B?OS9zTVJGS0sxWk84VFk3SFN5UzdkQllRcjU4Z0RuYmhDKzlBNWduQ29tdk9Q?=
 =?utf-8?B?cU83bkN6cFIxMHVOZEVJd2JwQnlmNlJPRDFDbjJSZm5qRXpLQWhZOEl1L0tH?=
 =?utf-8?B?bXpocWZtZjFHTnVqdWUxRytnRHZ4cldrajBuMGhwbDFXSnpwZ05FdjREZTBu?=
 =?utf-8?B?Q25YZ2xyQkFZU3pyb2RHa2k3QTQrT2pWeTdNODlkY24wZDhGZVV6LzBiK0oy?=
 =?utf-8?B?VlFmMFZlU1BvMjNQU3J1VXZpRUV1SXFaTElKaTdWUXl2d1RZeXoyM2M3RXVJ?=
 =?utf-8?B?UkJvZThIV1N3ZjZJSnZWOEl1cDNUZFlpTDM3SmYySzJZaGVDem9TWlNLcUh4?=
 =?utf-8?B?NmRTcng1clA1UE4xTU81d1pOSHJnQk1uSlA4TGlETjJtMzVPNkk5SUlRWjdH?=
 =?utf-8?B?NlZpekhPS3U4R2xSWEQ3Sk0zSGNaam5qM040NFVTU0FJaVdsZzZBMU9GTVhi?=
 =?utf-8?B?VXh4YmI0SEY1NHFoOXBQelVnNXVBUk5IMndQTnNhcDNnb1VsLy9yMDQ1YmJB?=
 =?utf-8?B?eUk3Qk9MZ2NqL25aSGNHSTEwRFNDNkplUkNVbzAwMG1ZUERObm9pczFwK0pU?=
 =?utf-8?B?SFlhTU44TFZRckNzbGFKQXFvUjczNlJndFd5SXM5cXZxbjAwR2VBTWpmVGsx?=
 =?utf-8?B?dFovZ3gzTHJPWlFWM2xZRjhmeTNtTG0zSE0wVnh0SjZ0ZEN0VlE3Y3VNbXVP?=
 =?utf-8?B?cmNnUWErUU1UM1lhb0JXdlpzNGNLaW85RVNuRjJpbzFVbURLUzZsTDY0SGdl?=
 =?utf-8?B?YnZ1VHhyWTkzZ2ZFclRUU3RrVU10emdKeThzODk0NVhhaWZYQVVTMzJmM3FN?=
 =?utf-8?Q?9wGmK6NMmRm8Vqb?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a1615e-5147-44d3-3917-08daf009c13f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 17:16:31.3239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ae54frv2IRlJmslBHhoP5kW6SLZ5QpwmQfzyH2owvxOiyOmas7ZqX9yfwCY15J769g+7wEYNgz+xlQGFnWdg3uf80xR74sJUHJTG6DXhGEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6776

T24gMjAvMTIvMjAyMiA2OjIzIGFtLCBCb2JieSBFc2hsZW1hbiB3cm90ZToNCj4gT24gRnJpLCBK
YW4gMDYsIDIwMjMgYXQgMDM6MTQ6MjVQTSArMDIwMCwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToN
Cj4+IFRoZSBwYXRjaCBpbnRyb2R1Y2Ugc2JpX3B1dGNoYXIoKSBTQkkgY2FsbCB3aGljaCBpcyBu
ZWNlc3NhcnkNCj4+IHRvIGltcGxlbWVudCBpbml0aWFsIGVhcmx5X3ByaW50aw0KPj4NCj4gSSB0
aGluayB0aGF0IGl0IG1pZ2h0IGJlIHdpc2UgdG8gc3RhcnQgb2ZmIHdpdGggYW4gYWx0ZXJuYXRp
dmUgdG8NCj4gc2JpX3B1dGNoYXIoKSBzaW5jZSBpdCBpcyBhbHJlYWR5IHBsYW5uZWQgZm9yIGRl
cHJlY2F0aW9uLiBJIHJlYWxpemUNCj4gdGhhdCB0aGlzIHdpbGwgcmVxdWlyZSByZXdvcmssIGJ1
dCBpdCBpcyBhbG1vc3QgZ3VhcmFudGVlZCB0aGF0DQo+IGVhcmx5X3ByaW50aygpIHdpbGwgYnJl
YWsgb24gZnV0dXJlIFNCSSBpbXBsZW1lbnRhdGlvbnMgaWYgdXNpbmcgdGhpcw0KPiBTQkkgY2Fs
bC4gSUlSQywgWGVuL0FSTSdzIGVhcmx5IHByaW50ayBsb29rZWQgbGlrZSBhIHJlYXNvbmFibGUg
YW5hbG9neQ0KPiBmb3IgaG93IGl0IGNvdWxkIHdvcmsgb24gUklTQy1WLCBJTUhPLg0KDQpIbW0s
IHdlJ3JlIHVzaW5nIGl0IGFzIGEgc3RvcGdhcCByaWdodCBub3cgaW4gQ0kgc28gd2UgY2FuIGJy
ZWFrDQoidXBzdHJlYW0gUklTQy1WIHN1cHBvcnQiIGludG8gbWFuYWdlYWJsZSBjaHVua3MuDQoN
ClNvIHBlcmhhcHMgd2Ugd2FudCB0byBmb3JnbyBwbHVtYmluZyBzYmlfcHV0Y2hhcigpIGludG8g
ZWFybHlfcHJpbnRrKCnCoA0KKHRvIGF2b2lkIGdpdmluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IHRo
aXMgd2lsbCBzdGF5IGFyb3VuZCBpbiB0aGUNCmZ1dHVyZSkgYW5kIHVzZSBzYmlfcHV0Y2hhcigp
IGRpcmVjdGx5IGZvciB0aGUgaGVsbG8gd29ybGQgcHJpbnQuDQoNCk5leHQsIHdlIGZvY3VzIG9u
IGdldHRpbmcgdGhlIHJlYWwgdWFydCBkcml2ZXIgd29ya2luZyBhbG9uZyB3aXRoIHJlYWwNCnBy
aW50ayAocmF0aGVyIHRoYW4gZm9jdXNpbmcgb24gZXhjZXB0aW9ucyB3aGljaCB3YXMgZ29pbmcg
dG8gYmUgdGhlDQpuZXh0IHRhc2spLCBhbmQgd2UgY2FuIGRyb3Agc2JpX3B1dGNoYXIoKSBlbnRp
cmVseS4NCg0KVGhvdWdodHM/DQoNCn5BbmRyZXcNCg==

