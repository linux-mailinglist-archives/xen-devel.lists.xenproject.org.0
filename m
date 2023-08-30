Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272678D695
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593010.925894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMM5-0002K0-E5; Wed, 30 Aug 2023 14:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593010.925894; Wed, 30 Aug 2023 14:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMM5-0002HE-Av; Wed, 30 Aug 2023 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 593010;
 Wed, 30 Aug 2023 14:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbMM4-0002Ft-4C
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:39:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0913efa1-4743-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 16:39:34 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 10:39:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6637.namprd03.prod.outlook.com (2603:10b6:510:b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 14:39:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 14:39:28 +0000
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
X-Inumbo-ID: 0913efa1-4743-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693406374;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FjgOLLcUBeLy6Hk3UnFDpPnFCKSuGNkDzqsZPtoGUWY=;
  b=DEra2bfbg+y2noYSHcYr6rUj9lq7Kr6JqoFHXz9j+8NM+GpejlKuKYON
   1hIUdAA28zbjVPKd4Sjtfw3ijClzq8wu58fMh49hYTNu6W5eQPEDkdu0e
   H6jRWL91dKIuE3XuxXA+gUwEhkkHZw35yGSwgO3l6vkH7gLTpdpaQpt7W
   M=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 119807306
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e3WPc64WY87MEoiAYEM1cAxRtP3GchMFZxGqfqrLsTDasY5as4F+v
 mJJDDuAMvuLYDShfIglaoy180hV6JeEmoBgS1ZkqH1jHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaAQ5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 PkRKB0wLTe5of/n5pCFG+devocbI5y+VG8fkikIITDxK98DGcqGeIOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0otjNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtDROXnraY06LGV7l4tEC89ZXy5m/r6lgnkQYhiK
 FQw9AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnM03Qzsqk
 FyAmdyvBiZHv7icSHbb/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7nLNKi8cOj/+/5Qqf327qoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaL5l8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:zu4JNqF4UnO45zl+pLqE/8eALOsnbusQ8zAXPidKKSC9E/b4qy
 nKpp9w6faaskdyZJheo6HkBEDtex7hHP1Oj7X5X43SPzUO0VHARL2KhrGM/9SPIUHDH+dmpM
 NdT5Q=
X-Talos-CUID: =?us-ascii?q?9a23=3A+mEBV2gaksN4mzR+rq+quQAfFDJuT3jUzFrtYGi?=
 =?us-ascii?q?CL3s4bp+rGFGiwOBcnJ87?=
X-Talos-MUID: 9a23:bU/iEQY/adKg9OBThQH0thpSE8VS4OeyTxoXy6gFo+2KHHkl
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="119807306"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa+mdAaB7q3ITF+7Vnx5KFF2j/BSuSAaoD5DkYdAT3vq2Y8R2P1wAAGZRNG0OFWABhDfxTI9XMafezFY4363hwIihFPI3iKCXqNVWbsYIiNQLZbc75a8OowsI575uHrL8T5ufGTeghmxk3CznANy/Yv/ZJAdEyNpxUq8g8hhQaJJgO9Khdr8IOIoFJHPABH7GBz5STCV2k0UbrCvshkCOrAvDt2GxpSf/3dI4Kd82apHg8LWumU4g9NcIBQ1fO+w+7LKjkrQRbdOtUup9wGS2525s8YtBjUg7qCIC/GNKz9hdXUUgVEvhtUeFhED98I+24UoI5ChNlQ/tvyYvdda5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfUYJ6pgvUfAt8Qu+q/J+CYmOY2QUWi4QeQHOQDNnEU=;
 b=AwEjuhyVAxt0HR65SaZJwpqikw2iqrPb1jWSz/MYfL5QOA+V1Dp1848XQO9UCf3jPWcsZcXyVf+ZbMMIrudTeAkPn/AA/dJboRgGF9Pj0c3MfcrWDhHJahxy49nIbMfhP6qeqECTn2OwUcbdHPKclpSfsmQ87mjioOy2RMP6b+6yx808bOLEu3GmqDySF0sX+o1yUHTvhP3La1fOQQIfzPKEY3MJFThSzNcSEFfMKJAbqpBm1IQvJkX72iGpnTk46RvZTJZ/iEUp2n3xXmn45qUCg51POlXwPaUuOGfkTTY2Zrbl8Rikk5p36UmN4lmCgGSw8buOYbA2WXt8cLJZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfUYJ6pgvUfAt8Qu+q/J+CYmOY2QUWi4QeQHOQDNnEU=;
 b=dyqOW+v23opgHXPW+B2a+GUmu9EQ5hJA5I8Fs3txBqgGs608wSZSE0TuoWUcrUo0wMUQOpc/RQQuR3VjNBJMBj7NE0n53NfJCUnn2hNXBV13yLJFf1i/ogSnza0diQi5uWTB6XVRnwcGiskxKpAPVpP98lat6RU1o/KLqSvkfoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ae70bcfe-072d-c6e8-d672-a22c850f602b@citrix.com>
Date: Wed, 30 Aug 2023 15:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <457bd388-afc3-af34-eb4e-755359bf4772@suse.com>
In-Reply-To: <457bd388-afc3-af34-eb4e-755359bf4772@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 081eea58-741b-4bf9-e8cb-08dba966ea11
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m370nVtbYCg5mBu2rrVXkDqBqimMxcRiuXLkulnFTr3ng1rHgHhMlhae+T22mZCGRw4L36iWvWUoHafr9GJGlJCI/8QrCvWvKf5p7faMpIdyJJ6gM7DKlLem6Cv3doyg4UL7AE5fGC0MpuECkTjWcXREpkdpyuzc4pZybjVsZb4piyhASjXJNaOaBn3AyCJtSxnYzWinRDP8GzEX+2e7ppPtp8K416VY83m+re9coyPQRDejrZMpVcG6dGrQNQkPBmpzr52eXzhaXfRLLnuJXvFlsFzND5qd5SpTkVAtV6dkokBV32HRgplJiYf4wF1fIKYYSa01wYBwtyA0KefwFDouKkGcmfr71QY4sX1/lthIsCMz//h9K3ney7+cm09tmsAK4ss84puiqDXpURxtanoyppAS9w1GpvangQQOat84cOlZ99U8rU374JTECdPJPo1wqzZNCvRfht+MqZFZhIXChVYXUITij6O9esnW5deGNTXKGxT4gIdGa57bJdV0rP6worrtV829gErVeN2PH7RX1/qez8AqP7qfh5JXBzQ0u5BR7teTGwNSiLtYXm8TeFdIyr/Si/ngSPNs4miWMMdkzucC7SPt93fZWfUn647ULEiK5O4GRwxDm7ezuYeRsuVqjniqNdEFXmnIaPzgfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(31686004)(478600001)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(2906002)(83380400001)(2616005)(6916009)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnQraHkzVGRncDRJaEpBVjRHekxLR0dRUGVqOGZLRk12SElGQVhNZmc5ZkFY?=
 =?utf-8?B?SnBPQi95THM2enFrbHNKWk5Fek51VG5hNVJIa1FuWnB6emR1WTlnNWJRVVMz?=
 =?utf-8?B?MHI1VHR6N1VjSGJTVWJpbkVxOG82NWpjZHFnV0tENGptQUI5WjNPN2dvVktY?=
 =?utf-8?B?RnZ2UXVJNExVYWplVGhTQ3BVcXJEZ0RYWFBnUlFVb3VaMDNBMGZ6U3NweHFG?=
 =?utf-8?B?SHBkYjYxbTlGclQwQmhDakxFczlES3ZlOG1OU0FzSzJ1L1Vic1BIbEMyLzJQ?=
 =?utf-8?B?RnpRbENzRiswNWo3Z0pYVnVtOTM3SDlCRWwzeHdzdWdMYkF1Snc0NkQxMjVM?=
 =?utf-8?B?V0w1cXJoWi9RYTNKY1BIL1d0NXNPMDBhT29VSEhnNExWSmVia2NkUndONUJC?=
 =?utf-8?B?Y2NDbGFGZkxWWHYvZ0tGT1doaFUzMFBnTEYxbXExOEF4c2EvWlNZNy9yUXNr?=
 =?utf-8?B?cWpUbkp2eWNhMzFLQ0d3TDM0S3d1VU5mMVNZbklMc1gvY01tLzdhVVl6Nk1Z?=
 =?utf-8?B?QlFBbXgrclRIQzdWUHY0NWdSdzZUOU82aGRpVnFVSTE3Wkd5UnZzdlFKQnh5?=
 =?utf-8?B?N1dBc2V5NVVRMlBQRmp5S3B4R2hjdTgrekV3ZSt3cEU4Z054dVhaUHp0YXNC?=
 =?utf-8?B?TUVZRlV1U2VhRmZCTzV3TUNKb1NLVkc0NnJsVkc3RTZDdzZGUHpjR0NVR3BF?=
 =?utf-8?B?azV3cGVOZlV2TjlYcWp5T0dtVnBFcDVsMTNkQ1RIcjF0djhSaHg2UWZpdEMz?=
 =?utf-8?B?V1B5TG9aM0QvakQwUWtRaXBsdkEwODFXbThlVUhnRWZRSFRnVklZYnZ6MHN0?=
 =?utf-8?B?dHV2NlR4UHNObzhOb3ZjNDJCSGN2SlpPb2JabWxaaWlnQmt1THNXdWJLbEV4?=
 =?utf-8?B?UHJCT29KaVdMRm53dFo0aHBXdjhMdUp0YmpiS2Y2d3E4eHZDbjdNcm5OTFVy?=
 =?utf-8?B?WG8yc3ZWUFU0TWxJKzRpYkRYUlhYWWJLemVFc0dXK2VVa1FWMVd4R1NqYTFG?=
 =?utf-8?B?QmlsN1RBMFlSa3ZERndvWmJIb2twSi9Haks5U0FYMGJjNjFUeGJXdk1uTWQr?=
 =?utf-8?B?azdCN0hkOW5qWXFLb2htNGg3QlUzZ3p6TG5UVFIxSVhsUGhyNzlFZ3pSaWhL?=
 =?utf-8?B?V0FOVVFYWXpTemdhaEFPSlpSZ1AvUGNmOCtWNW9WanU3U01jM2o0aXRJV2wv?=
 =?utf-8?B?dEZMOFhtRU5sTFZBbTZpbnFPM3BRY0RaTmlYMmcyYW9EVEtpSDV2eDI3VzVR?=
 =?utf-8?B?NUN3TEt0YmdmQUR0NXFPMDNpTVM2SWxLOFJaZDRBZ1llWlVUNkl4WktnbXVL?=
 =?utf-8?B?ZEk5TGwvb2hDbVVKY1NLYkpRSVIxOTJacHBlSFVoUVBPaCs1SXJObWNZUERM?=
 =?utf-8?B?K2RoRHVTM05tdGxKaTNpWUJ3N2RtTmpRc3E1NTlqb0RFNjZpMmdiN2srNyth?=
 =?utf-8?B?S1h6K0dhMzNHaGhpRVhJOVJGbEpBbUlCK1pjL1ZraUJTTlp1OS9JRmZoQXBm?=
 =?utf-8?B?dXh5amh6QmtrQllRNmMvZTVicytSM1JLMnNaNmdLWE9WSWU1QW1rZHRHTk5U?=
 =?utf-8?B?NkhoNTZBSWpENzVDc2w0dVFWSVpMY1F1VlVHZFdXUGluT0tLWkUwbSs4dyts?=
 =?utf-8?B?WEsxWnZGWEs2Vnd5WUJPeTZZTUgrQi9SM3hvMDBObVlDOTl5cVpDaGNnTmU5?=
 =?utf-8?B?VS8zWWlKYWQ3b1FXUURLKzFhanVFQlFqKzAydDN4c2VMa0ZNbnhPaFRnRHBT?=
 =?utf-8?B?ZGVnam03TWc1YUFzZlk4eXdxcTdobnhIdHkrTjd5S1FvRkJpQ0ZNZkFMMEUw?=
 =?utf-8?B?Z3hCekRvSmVZcnlzcmtGbmVjRDE4cE5VbzBsbDl4UENKR2JTemkzbXBScm84?=
 =?utf-8?B?cWU3SmtmUDhnaEMzNXY0NWtUei9HYkVMVHpTa3RXTVp1bWMyRFV1eWFmcmR5?=
 =?utf-8?B?Y0VVRkhXNWtrbExxdFYxOEZHTmwrK0MrTU1SeGhSaGdnVzZtMHdEM3lqQVZY?=
 =?utf-8?B?blpGcEhZV0ZxSTA1eVh0REQyS0JWQmR0L1dVWEFoVVpRa0ZlSUdBdzZCNHJm?=
 =?utf-8?B?SFVCWHE2RjVzVG9xRUFOQ3FYRTY5cHZyaUpKU2dvRFA0Z2N3QnFFTEpwemMx?=
 =?utf-8?B?bHc5eG9DdURKOGExWDZ3dkZoZTJRZWlWdFlONjdqYm5LVFIrdmpYM3JVeWFw?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mnlKgPPUjZK9g1hUaOni8G2mA5VYDN1L+lfSb9RP/cuOYvGS9gSWkjz4rMbXNRMbi4STTWbFBYEHWJ2cF4BPIf+2nXEIMNx+XrBDqO/hzDjNQPP/HhqCP2Gratcc93vH59e03dgKLEzVr93ISwUWgrkd2a5AVm786NB6RryYAOHbdoZr0vokScf3b9My+Zz6RQAEXoSscujlBYMK8/sKG+EYAMeu2hLmoDbdr5CwMXnaHevIMfkaED+FzcPp0Iz1F/74Ys73bVunxWnv0G/gUCnytBH+9xN+YMRe5yFms2OLmTU6MOnEhOwaZd1jWQRm+FZNw0G13cwgE3pBjs1r8gUbnL3bGFq5iKO5H0+wADCnwwZLRqwMtE89ufkrxu7N3B0WKq/eQnV1wLgytcKviMIe4Sm2k3k2fdrpuGSzNducIBvVko4dpEPurjG2wlQQipbWbU0HKldBDf0J5l3/QwAEduDcct8iG+i9kJHvd2zPDLYf8HD41q9Ca48PgYyxp8ZvuVIaq7w4vitXTS8ueKHTtwLqHxEQCBHeaulFb4cc1FZveCYpLZjqbxDGmSQyGIdeEwZAA8OSuqOdFrPuwuKdF+V9f3+Oc6aDvFh4cMmeJSQNGNA/y0cK2mOw4QGrxk4zlkHJ0dZo9XJdNRtyHGa9xCxa4VF/TElAGroQWvN/Od533FpLObv+nkTlo5GF076LZxnRlz96rAc8JEMF/oeYd2XZUpN0sAWKPRKsSboipWQCKoxQ1IN+EsDaOmqjvVvxRGpHZ47/gGA/Ii5ic6eRUfqi4IA/LdcP7m8fcqDnrvIDEcWJT/37OYp/VnneC3RLd/oxA8UQD5DH26CvPRS23v4zqYTOCH6FzMWKX4k=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081eea58-741b-4bf9-e8cb-08dba966ea11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 14:39:28.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Jpq+r3qvsV5hK+dHsc5G18wXOaizWWwwloOM4hmhvx8MZSEYI0kxWcbmvKyle010nd+njtSQR/tXk06OKmx9Ngz05TU6Mx3Esh6E9K+SP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6637

On 30/08/2023 7:46 am, Jan Beulich wrote:
> On 29.08.2023 15:43, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>  #endif
>>      flags = c(flags);
>>  
>> +    if ( !compat )
>> +    {
>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>> +            return -EINVAL;
>> +    }
>> +
>>      if ( is_pv_domain(d) )
>>      {
>> +        /*
>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>> +         * subset of dr7, and dr4 was unused.
>> +         *
>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>> +         * backwards compatibility, and dr7 emulation is handled
>> +         * internally.
>> +         */
>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>> +                return -EINVAL;
>> +
>>          if ( !compat )
>>          {
>>              if ( !is_canonical_address(c.nat->user_regs.rip) ||
> One more thing here: v->arch.dr is an array of 4 elements, i.e. doesn't
> cover %dr4 and up.

Correct (as of the same changeset relevant in this comment).

> That's not directly visible here, though, so the
> comment ahead of the loop talking about those other 4 registers is a
> little misleading. Would you mind moving it below the loop?

Can do.

~Andrew

