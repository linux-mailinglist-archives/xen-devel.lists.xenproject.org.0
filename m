Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64841699258
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 11:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496461.767220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbvH-0001eR-1L; Thu, 16 Feb 2023 10:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496461.767220; Thu, 16 Feb 2023 10:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbvG-0001bs-UF; Thu, 16 Feb 2023 10:55:30 +0000
Received: by outflank-mailman (input) for mailman id 496461;
 Thu, 16 Feb 2023 10:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSbvF-0001bh-65
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 10:55:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6748ad-ade8-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 11:55:26 +0100 (CET)
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 05:55:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6597.namprd03.prod.outlook.com (2603:10b6:a03:393::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 16 Feb
 2023 10:55:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 10:55:17 +0000
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
X-Inumbo-ID: 6a6748ad-ade8-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676544926;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N+iHjd6KFr7RqVN+nCMWPs244jBPxgcJ9fO+4MoGuZ4=;
  b=QHpOQo5Gn6yL9+/vyRSwtcTdWh9Q3eU+6KwvVDRNJr5mut0V2UEZYBpW
   Hmos6+K/2sDozfL3W/JQNRn8levRCCagtJYv4AqPT7BBvqo1jNXtrzenr
   jMWpUHfH+JlC0szoDhFuMNC/CiU0Ts8kr13OkYm5m6oiuQf0onGjevmGl
   g=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 96127770
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UFdd4KnCE1Z7VQshbxWgo7no5gyiJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDGHUM6uCN2r0e9t0O4S/9kwC78CAx9BrGgY4+Cg3HiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fUgERASdSDYvumRh4mSTeVNjNY+Msa+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOaF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNMTefnqaEy6LGV7nACDzhJRWC2ndSksleFdfMEN
 FA0+TV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zpptg1hxeXFNJ7Svbp0JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:v3Us+a3cvDFzfutnJK0JIQqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="96127770"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmdvx09Z+EJ1w9Nhgm4t5/cLAJk4dhugBCYzzF+UnvxsTn50rEkdnGb3QfANpnRlHCZhdlhoXs55Rf3TLDNMKtjE76QEdtbE4xerYVuRJsWe6SBNEuA9bTpFm3cT5dAsRdoADawLm+pUj1M8E0YuPuFxt9YtC4MWHpDRovitOIt8LUw1qlMfalga1v9RjLvbjuQfxc4beoDNlpJJ0c8aQQRGSB9TJFIyPB45t1aqNw89v0eajvDKFEDAX7lJjnVuHvDcUisiGlLdwdPBln1bKo/6gj4pzzMfTMHJiKvu2jKE7zi7HUI+zfZIeHBfqYqWH8/t21DtImCDqViDGaPsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4nfn4Vekhn3GCdG0vdvtts/f3miz2wH6PD7FEmBKK8=;
 b=B2FT5RETGbwXGfnA1V3oVN+Pv28uWnfHPUyAeHwy8t9R5xE0lXBAINjyPESNKTiwccT2wXUC2poqKWJ7OZYjbVsFzR6OHJJmxM/cQzXWSvyt7CiBuIf3xvf6ProeBWaSOp+adZLMcH1o1C5q/KltfJgTzbueMZkwiuiBPk3ahIK8nSFUJGYrQwhosqbP17/Hf295RCMl7dBO+7+ttIfbMLQ4Z7Hgl/l/D2YzJf/cgDKmN/p9ubyX4qSQOdXz0VyBpE4a/wSwr62z3FSoitmK28G7ngpTfLUas1nascsLDvPQx5meUVCGNfDiMnjOOcDw53OUxqv0BqxyYR6wHZqpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4nfn4Vekhn3GCdG0vdvtts/f3miz2wH6PD7FEmBKK8=;
 b=QEaRGKWTlgt66cnWFTXc+wclkiytGYRlyNUoBJQmJXMOFeB4W5ooOAfXHWtb+xMgWOQ6FwhDFaI1sfp0SOG1sOF6l1JEaDfS9P2l+/pLbtvNvk8oOLwq8JclfnX2yXz8S0VeizL5bWw5qCZnifYRG+GCHciy/x8c2PuBih8pxl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bdd6e011-78e3-4f5d-9005-d9b385b859ae@citrix.com>
Date: Thu, 16 Feb 2023 10:55:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] x86/MSI: use standard C types in structures/unions
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <9f375055-eff2-010b-c904-e4122b834777@suse.com>
Content-Language: en-GB
In-Reply-To: <9f375055-eff2-010b-c904-e4122b834777@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: baa239b3-945a-4ad2-c112-08db100c49fd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eAc4hHu+25cUITjZBb41gAczXjKSoAuC6C7cYoOczdyLkDXeI6BAGvYdDZtZjsqV4Q080aGK76ZKUCG/0n+K2jSg4LeDCp9OeF7q3GKKWSCxnYdH2wCgxrBchKD/2Qu/fdbl0nwOQi0bbzxlBc8ATZfJ7oWgr5+zzMtZb5SnaKntafFtjZYptBUdLWA38IImxlXxHm3oqiufwxsLO9r8EjpodpDvi3J4cyiUk5dg2rGFbQ3Ein6cAsrNPHifUK/o6BuGf9mzElIEYcbDkX4rQZK1vfaP8acElS3KaTLpjZCkudoH89ia1LWhzQ2bs6ygtTTX5ljWuwAU61uM+YSxoPYjFgWtPi3R9Pq+AtWSCH4Tm2W0fhfRDnegxcBja4JD+OErZZQdeefcqIiBXM7yiFKfIIIOpTBsi1i0KJpFt5naklW2fnb2VyP5I0KyQsAPQ6EUmxG++amjFcMcODu+RL8Clxw09KY2k0l+wRt6djz+s3Q7tZDOiAb2OyQxQJBtnhuZKNeijrNWmK81AVlnXlfNcfjS0+JU+OB7pv82iV0E4LpcOgcKozuIMZacuIGRbRdey/NKGQ3+W0JzySA/SIWxA2iQl4H4XSe2qcUi+aReZ6xV4Tqf1DYjK71e8Q0hofX1uHG3Icx/lupAyYLZgVUauBQghCpG7BwlzRJcwKgLMKomvVWdmHN4pH2+JZi9x0u3oQ8/CF61GZ7xkD95mPluJ1xqmZJJkfBbvjx99OM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199018)(36756003)(66556008)(186003)(6506007)(86362001)(6512007)(6666004)(107886003)(2616005)(478600001)(8676002)(41300700001)(2906002)(8936002)(5660300002)(83380400001)(53546011)(54906003)(4326008)(110136005)(82960400001)(66946007)(316002)(38100700002)(6486002)(26005)(66476007)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VQUHNzUnYxZ3AraVMwKytJWUc5ZEpGMnM4SFltWWFPMXVta0hxUW1sN0t2?=
 =?utf-8?B?MmE2alpWMUtSTkxZbW9keVd4dHpUMWlLYktvQW5oTk1EUHFxQmt3SGFVRitR?=
 =?utf-8?B?RVEzOVM3M2UrZk5yanRPNUFJVXBUV0lMaDB5NC90b1ZwckltMjErMkwrYUQ0?=
 =?utf-8?B?TjRQVnJ2Rm8wamd6TnhQQW5XWG1ZMjBrYldna3JmRlZmUXFuMk9DdVhjZVZm?=
 =?utf-8?B?SmVFcmJQTGtlQ25OOVJ4UFBrSHVJQUlvQW5Qd0VTU1BoNGZCdkc5dW84aStU?=
 =?utf-8?B?aEQ2K3MxQjFNSkI3VUJPaXRVd0NqYWJkbDhqWXdqTklMYUJncFllQjlNWkZp?=
 =?utf-8?B?NXE1Zy8yb3hqVjlKTTVic0p4OFRMV2Q0amFaS2dxcVYyc0JYbjFqUUVET0NS?=
 =?utf-8?B?K1pyV3l6SWFhaDBBM2VBSklPTkJ4NmpYVGZ0SzRGaldXM29SM1YxdXQ5RkZ1?=
 =?utf-8?B?NjBGVHZ3QlJ0U2p2bVVrMiszMUUzNjc0MDU4aGplUmkyRUJWM3BMRm95RU85?=
 =?utf-8?B?TnV2K2s2VC8rZ0NUeTJBbHh2YTRYellCY1pQZDBKbHV6UkVmQnRCSlIrWFh1?=
 =?utf-8?B?UVpUTVRTRnJTUUFLWjVhT1R2Ry9FbStYRlp1cWg0bVhDNTMvcTV4YVFOaWsr?=
 =?utf-8?B?cy9qclVpaXE1UEVVSkpRYS90ZUtGQmQzNzRZOGE2N0JKS29LV0Y3UTFXSDIv?=
 =?utf-8?B?eXJqVDh5MHRLSUJQeDZrRG44UWZZVXZpN1d5OXRHSW94SGlTMEhTNHhrQzlN?=
 =?utf-8?B?bG92R29PWlliR0grNyt5KzdxK1RGK2xwQTlJU0RRZTFYR0pKenU2U2Z4SXY2?=
 =?utf-8?B?alkwTmRFcmpzdWE0NlRNZ1R3cjBnMWo3a2tmTWZaUmFNd0pYOUlaVldlSVNR?=
 =?utf-8?B?MmlCbFpKSmZ4QzFEbThKQS91cGJzSmhCY0p5VkY2dkUxMWNGY0xOWWdQeGNv?=
 =?utf-8?B?QXZZNlBnVU5xT2hMWHI2RnR0eFhaOG4vdnZBOCtBT25QYWRhMFlNUmdwNDE5?=
 =?utf-8?B?OUNCNU1DYmswUmJRTk12UkR5ZnRYbWlJU0dScjFZSCtHbjVidzF3RzdiS2x2?=
 =?utf-8?B?WXNrU0x5N2dQcDNFTzhxUFQyRnpiRmFCTEdnS3dQeFd4S0ZqQWwzT2lLWmly?=
 =?utf-8?B?aWV6TlI3cGFMSm14NGJxM2JRM2VyemlyMEZCOXorZ0FZSXlIZUFBNGFPaWVw?=
 =?utf-8?B?MFYxRllVNlRuWmdTb0lQcVhsUGlEUXEybElXZ3FtMTlHN0UwTFBHMjJzbEsx?=
 =?utf-8?B?WWxPUXNiVnM3SUZRSi9SWFd6dlZpYzNUQ0pNNzNQRjh1SjR5VlRsZElGbGo2?=
 =?utf-8?B?cUlzbmhleHcwd0ZvVzRMZytVUm1xY3ZPSHVsdGdhRGc1NXdTZVJNSklHQXNm?=
 =?utf-8?B?N1ZFMERyYW94bzc1MWhTUldGMGV3c0tmSkFwZ0pySnVpdjY5OXFPQVhNa0NM?=
 =?utf-8?B?TlMzc2hHM1UyK3dKb3YxQ0RiTWRtcTFqYTZ6RzJ3LzZtUThGbEJGMFRwL09Y?=
 =?utf-8?B?WW95Q0t2TXVHTXpNRVRDRjM3VjEwb0UrYk9JRnVGRUxpY0U5a1JzTUFKaEYy?=
 =?utf-8?B?QklIdmtseXlyMkhwb25pd0VsOFhPVHhZU2doT2xWQ2VDY28xYkdKUG5HeWZ6?=
 =?utf-8?B?UWN2UHo1WDVOZUNmZEgzOWVZUVZhb0Y0V25mak9UVG0rZ1FhVmpyVlNrN09C?=
 =?utf-8?B?cUR3Q0JZSjNUc2JpQUR2bUJMUlUzTGE4bHA4SUFhbkR0K2ZIcTdqY0hyNWsr?=
 =?utf-8?B?Wmd0UitkMzlrNzVQbW1RY0xteGRXdzZyOUJCaG1aajRQcjk5MGxQUzNUa1Nw?=
 =?utf-8?B?TnRlaEZxRmZJWm1DaGs4ckVjTzZ3QlZNUEhxbEh0N1lBNlY0OUlSQlQwb2sw?=
 =?utf-8?B?b05tRlF1RWtuNUYrL29iclZJK0svOWs2dEtCc2x2TnZ4dXpGQnkzSkg0UWRk?=
 =?utf-8?B?L1VXalRjQUFmWHFDZ2Y1NGVpRzJqOHRoVEpKWFo4TUxUakVNa1JWV2NnZUUy?=
 =?utf-8?B?M2ZrdVRZUHB2VmVHL1hQTjRZYW1XcDBqYzZDSHhvbEszeFJRaks0Ykp1aHkr?=
 =?utf-8?B?WUxDMDdtNlhBME1MakU2emhuSFJYOWMrT0N2K1NLYjF0VjUyL2hHV25rdUky?=
 =?utf-8?B?a3NBb2Vxbmp4N2pFam40YjdLRWJkSStEb0tpUjBTKzJMWW55WEdDTElvSzQx?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pOgsiZJs+uUPbuimjsy6gRA+bVWJWniUSs/mQXydMU19n/D34QP/NFix8xQyKbvx79eaYLJbl4dafQJKAIoutRrMaO2f5SqysdJwkVFzveRcSJR4eL7YvetAwHVHiDDJIHjhg1t5mZfH8B3XVt1IKks2jNCY4fjyLKXMy29MU6hmOIEY2dnZnFWQFNVTf3ZU/dmMfq7h3I5fx/cBF8Ij1JXOwCzB6hxPTkUK9KSBQ6iv2l+QJbDSRHzpktG9YlvEQvq1uDDBOGRHAindVhNoQ9HhrlT201HxXvn+RveeJ9pTKjVtEWPL6U2fNOJYP9X2AAyIbBW9Btgjml5JirsEMS1NdrajE+7RjA+CY+Z/UBg7ZMNSW893B25g85wWmkDZWZOuWrt6lzKNBfDPp4bZnFc/uzq71E79cXNbEYLoQkKOm3PxuULpJr/uTExuzupwHcFQw+BDXO1y6fjHdrqP53s0U3Id4yQHXrA2HGMXcRQgWlrATwp7TXWLu916mFxWHgghOetUybRKzi9yY0LvG3GuqsM+QydoriZPFPBYWZiX9F4dPtDSShdWc7u99t8JxIZzvx1nbAGSN3KW/Nsc4LtxFHNAPFs17bcfPAmyv/g2CO9s7LDccJW5zrRgFrzeFwBUAk6/vhEwHyQF4ffUIdxnSoQk+VN9d4E+qjbqfL+JpeKJ5MxXemYxgIkSP3lEnAwT79jhPw91dEj8K9RU9KFCMJySqp4TVor+LprPVXGh6AK0gB4I3iK2NECKElTM3zEP6TlRGOPUFAraLcjZ7aEdRwj046TZB28Zyj6y9nfLJT12Oas3lUO2RDGaoa1KbsL8zJKVtau9acFoDGXI8g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa239b3-945a-4ad2-c112-08db100c49fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 10:55:17.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teUPW9ETI6ED7yp/suWy6OIHrAhIqEGdHaQM2NyXnfjssspq0viyLoUR0SjnKm7mCp+bL+GCQ8v6vg0VDRjV3D9ecQpZYQwGev1Mp+1keOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6597

On 09/02/2023 10:39 am, Jan Beulich wrote:
> Consolidate this to use exclusively standard types, and change
> indentation style to Xen's there at the same time (the file already had
> a mix of styles).
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

So I suppose Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> because
this is an improvement on the status quo, but I have quite a few requests.

> ---
> For most (all?) of the single bit I was on the edge of switching them to
> bool - thoughts?

Yes.

>
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -66,15 +66,15 @@ struct msi_info {
>  };
>  
>  struct msi_msg {
> -	union {
> -		u64	address; /* message address */
> -		struct {
> -			u32	address_lo; /* message address low 32 bits */
> -			u32	address_hi; /* message address high 32 bits */
> -		};
> -	};
> -	u32	data;		/* 16 bits of msi message data */
> -	u32	dest32;		/* used when Interrupt Remapping with EIM is enabled */
> +    union {
> +        uint64_t address; /* message address */
> +        struct {
> +            uint32_t address_lo; /* message address low 32 bits */
> +            uint32_t address_hi; /* message address high 32 bits */
> +        };
> +    };
> +    uint32_t data;        /* 16 bits of msi message data */
> +    uint32_t dest32;      /* used when Interrupt Remapping with EIM is enabled */

The 16 is actively wrong for data, but honestly it's only this dest32
comment which has any value whatsoever (when it has been de-Intel'd).

I'd correct dest32 to reference the AMD too, and delete the rest.

>  };
>  
>  struct irq_desc;
> @@ -94,35 +94,35 @@ extern int pci_restore_msi_state(struct
>  extern int pci_reset_msix_state(struct pci_dev *pdev);
>  
>  struct msi_desc {
> -	struct msi_attrib {
> -		__u8	type;		/* {0: unused, 5h:MSI, 11h:MSI-X} */
> -		__u8	pos;		/* Location of the MSI capability */
> -		__u8	maskbit	: 1;	/* mask/pending bit supported ?   */
> -		__u8	is_64	: 1;	/* Address size: 0=32bit 1=64bit  */
> -		__u8	host_masked : 1;
> -		__u8	guest_masked : 1;
> -		__u16	entry_nr;	/* specific enabled entry 	  */
> -	} msi_attrib;
> -
> -	bool irte_initialized;
> -	uint8_t gvec;			/* guest vector. valid when pi_desc isn't NULL */
> -	const struct pi_desc *pi_desc;	/* pointer to posted descriptor */
> -
> -	struct list_head list;
> -
> -	union {
> -		void __iomem *mask_base;/* va for the entry in mask table */
> -		struct {
> -			unsigned int nvec;/* number of vectors            */
> -			unsigned int mpos;/* location of mask register    */
> -		} msi;
> -		unsigned int hpet_id;   /* HPET (dev is NULL)             */
> -	};
> -	struct pci_dev *dev;
> -	int irq;
> -	int remap_index;		/* index in interrupt remapping table */
> +    struct msi_attrib {
> +        uint8_t type;        /* {0: unused, 5h:MSI, 11h:MSI-X} */
> +        uint8_t pos;         /* Location of the MSI capability */
> +        uint8_t maskbit      : 1; /* mask/pending bit supported ?   */
> +        uint8_t is_64        : 1; /* Address size: 0=32bit 1=64bit  */
> +        uint8_t host_masked  : 1;
> +        uint8_t guest_masked : 1;
> +        uint16_t entry_nr;   /* specific enabled entry */

entry_nr wants to move up to between pos and maskbit, and then we shrink
the total structure by 8 bytes (I think).

> +    } msi_attrib;
> +
> +    bool irte_initialized;
> +    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
> +    const struct pi_desc *pi_desc; /* pointer to posted descriptor */
> +
> +    struct list_head list;
> +
> +    union {
> +        void __iomem *mask_base; /* va for the entry in mask table */
> +        struct {
> +            unsigned int nvec; /* number of vectors */
> +            unsigned int mpos; /* location of mask register */
> +        } msi;
> +        unsigned int hpet_id; /* HPET (dev is NULL) */
> +    };
> +    struct pci_dev *dev;
> +    int irq;
> +    int remap_index;         /* index in interrupt remapping table */
>  
> -	struct msi_msg msg;		/* Last set MSI message */
> +    struct msi_msg msg;      /* Last set MSI message */
>  };
>  
>  /*
> @@ -180,48 +180,48 @@ int msi_free_irq(struct msi_desc *entry)
>  
>  struct __packed msg_data {
>  #if defined(__LITTLE_ENDIAN_BITFIELD)

There's no such thing as a big endian x86 bitfield.  Just delete this
ifdefary to simplify the result.

Additionally, the structure doesn't need to be packed - its a single
uint32_t's worth of bitfield.

Finally, can we drop the reserved fields and leave them as anonymous
bitfields?

> -	__u32	vector		:  8;
> -	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
> -	__u32	reserved_1	:  3;
> -	__u32	level		:  1;	/* 0: deassert | 1: assert */
> -	__u32	trigger		:  1;	/* 0: edge | 1: level */
> -	__u32	reserved_2	: 16;
> +    uint32_t vector        :  8;
> +    uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
> +    uint32_t reserved_1    :  3;
> +    uint32_t level         :  1;    /* 0: deassert | 1: assert */
> +    uint32_t trigger       :  1;    /* 0: edge | 1: level */
> +    uint32_t reserved_2    : 16;
>  #elif defined(__BIG_ENDIAN_BITFIELD)
> -	__u32	reserved_2	: 16;
> -	__u32	trigger		:  1;	/* 0: edge | 1: level */
> -	__u32	level		:  1;	/* 0: deassert | 1: assert */
> -	__u32	reserved_1	:  3;
> -	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
> -	__u32	vector		:  8;
> +    uint32_t reserved_2    : 16;
> +    uint32_t trigger       :  1;    /* 0: edge | 1: level */
> +    uint32_t level         :  1;    /* 0: deassert | 1: assert */
> +    uint32_t reserved_1    :  3;
> +    uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
> +    uint32_t vector        :  8;
>  #else
>  #error "Bitfield endianness not defined! Check your byteorder.h"
>  #endif
>  };
>  
>  struct __packed msg_address {
> -	union {
> -		struct {
> +    union {
> +        struct {
>  #if defined(__LITTLE_ENDIAN_BITFIELD)

Same here for ifdefary and packed.

> -			__u32	reserved_1	:  2;
> -			__u32	dest_mode	:  1;	/*0:physic | 1:logic */
> -			__u32	redirection_hint:  1;  	/*0: dedicated CPU
> -							  1: lowest priority */
> -			__u32	reserved_2	:  4;
> - 			__u32	dest_id		: 24;	/* Destination ID */
> +            uint32_t reserved_1       :  2;
> +            uint32_t dest_mode        :  1; /* 0:phys | 1:logic */
> +            uint32_t redirection_hint :  1; /* 0: dedicated CPU
> +                                               1: lowest priority */
> +            uint32_t reserved_2       :  4;
> +            uint32_t dest_id          : 24; /* Destination ID */

Considering that these fields are stale (its missing the remappable bit
for one), I do have to question if we actually use them correctly in code...

But that's not something for this patch.

~Andrew

