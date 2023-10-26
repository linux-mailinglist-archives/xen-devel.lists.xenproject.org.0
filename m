Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFC7D81C2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623725.971852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyT2-0005oo-Or; Thu, 26 Oct 2023 11:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623725.971852; Thu, 26 Oct 2023 11:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyT2-0005ma-Li; Thu, 26 Oct 2023 11:24:00 +0000
Received: by outflank-mailman (input) for mailman id 623725;
 Thu, 26 Oct 2023 11:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvyT1-0005VV-Dh
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:23:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2658671b-73f2-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:23:57 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 07:23:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6125.namprd03.prod.outlook.com (2603:10b6:5:394::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 11:23:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 11:23:51 +0000
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
X-Inumbo-ID: 2658671b-73f2-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698319437;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fpNUc2qPcpf7xbyVtuZnJLSQa2I8Y1u3vHDuulFqNJw=;
  b=DgxyzwRG3MC4GVvWUUzBuW0MyX+XqqjE9+wRQSAQx+73uaF4ZF1WvQc7
   zJzhiP5aDbBhbILXkM1qapgoPIpkAVelJy/gDkxTT2Og+f2HfAx2KTLCv
   NT/wfzVWel3w+Rl049UpG9b1hO2rNoxfeZPEjJeuwDbcEVdwRYb0M+Jhd
   w=;
X-CSE-ConnectionGUID: pkzta0rmSUCr/8HOk1YIwQ==
X-CSE-MsgGUID: e70xru6nQNGnflBTnZW+8Q==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 126582251
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:AcPFcqxRhOBHX7IpvHl6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 WAXWzvXbPyJN2f9Ldt+PYmxphxU657Rx9RgQFRoryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXlN5
 +ARcCoIVS2onaXm4JW4E9hNmf12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WRwHOhAt9LfFG+3vM12E2J2zIVMTs5U1W/i8W/uHH9C+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFUD6ty6+IUr1EuXFpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:yrdurq4ntWIAg1MStwPXwPbXdLJyesId70hD6qkRc31om6mj/K
 qTdZsgpHzJYVoqNU3I4OrwXpVoIkmzyXcW2+Us1N6ZNWHbUAHBFvAa0WKI+VLd8kPFltK02c
 9bAspD4NCZNykcsS7xiDPIdurJz7G8gcSVuds=
X-Talos-CUID: 9a23:iRxeAWHK47WnkXuwqmJ/91wIE5g/d0bg522Xc2+fCj9YaaKsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AC+Zc2g3DanUuuMiMNo21vMAsbTUj7vv2GFoQz5M?=
 =?us-ascii?q?/neaCOyhaBzGvs3fne9py?=
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="126582251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT2h8ccx1gC96Eb0POCGZH81iPZR/ihgB8XBa8/kwSBWMAXNJScH93fmXqLxTpslZc7uc7XtUHOO0O0Ep7XqsjDHdPTzesmKUzRNeDvl+cP2YQ+YFZXhLavXgxxx9UR+v/lW5amA7HCMogfVng4xNSmprX+ULP5xRWykAqCCPUyB03gL4uSJEfig+kYxjwD/hGOxcWzEnTphJdjNivmMjvNY4eEpqpNu+iRrEKa6V+1L3TT3Grhlh/Omji9QtdSWDa8Eo7crj5vPkjVD1+qI8quMB+TJaRlCL8TjLnqd6hhxGEy4mGXMJEI/DTTi9rXI4N7B0l+ydZ85ffrzl9omhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS25JM1+kVbzP2J+xDGbgTNLQsO8xQ2gyhCu/OQN75Y=;
 b=UHkGoqehrXBx76SWfPaLAeweK56XtD1l88MzF0FreEBXdWQUZ01Tp7kT+S8z8Q4p7Zepq7QPbJZlHQKpylLYyIJrsExOX+Hb0vY38Y+8j/QVHKpatQlruMUUTYqqw0fOIBbXDyPtP+80ctZoSLLy1pPVmyRetuUrMufMyz2qmOFfL0iTz42Mm13hJHM99MAlGMLCKu1URjSkjUq6bDc4IJPEHuXw6pt813BL5wtzH3680Ww0Gl9HGTjeieE5eRvVkXJl+MkMllk/KvVyptu1ZYm6cNBFubzxGZSuaSbMg7pFKklS+otjAdZGfLiws8xKw8rDeLFclIvHM3ksEh/Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS25JM1+kVbzP2J+xDGbgTNLQsO8xQ2gyhCu/OQN75Y=;
 b=l8wlb4sy0Oi7EteUc7rIuRmymlP18qr/R8cAdCQMO0WbTk0V9ZY93e+Sqo0AD8TPJNNyB/seHLsXe5VdINDQXzaf0paxqqO7EAUZs5uLa0T+VNPlTzb4EanJIwtPvmmr5pvS0q6Tj/AWSD36mu0abHJmZe2oAKWsiGsksjnHe5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 13:23:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/i8259: do not assume interrupts always target CPU0
Message-ID: <ZTpMQ9fs2I4xmt_-@macbook>
References: <20231024145340.49829-1-roger.pau@citrix.com>
 <e3daacea-79c8-32ea-70b7-7654f542c9de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3daacea-79c8-32ea-70b7-7654f542c9de@suse.com>
X-ClientProxiedBy: MR2P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::33) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 05823a26-4a99-48fc-9e43-08dbd6160785
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h23GE2/V5Fzi93iYmqRbLP34i7ezelJaw6kCO2yUU6lzh6sLlX8XbYFPdutj1Q+TXY2EifHcMtZ+QIwAHBJIX41DDirXkiGSMygyNERD5ub1TFMPYlLybt9gm09T3+zaje9uy9lqL6dwYPtzePNUa+0GFleMhVVq7hxbmZSe4h3V1HxkFCGlgb7SrqHNTBkIzHwZ9mEQpu8s5fkNA2Q6aYJasiZfdtjpQ2YxkK5PNqJb8LNAmAcoCxOCN41Zs/TILLPFqsq66i08UZ0+jrj4lQuifianh+53o7wstW4e1ktZsoUTV7n/X8nM1hhdnC5bVTN1cIbQ13Ws9YCQreoEDQJk7sx4cto+arE8pGwYncVyGJUxZ9PZ8hxhuOKHQzEvoK+BH2y3xhwe2SNvAdCP5IlFJHQ/yFuYsCfNIBdA/ccapjzNDKwYhMh1CWQ+gVQQtd5Abg19YfK7cDT5dYzeJ4La4UbvkUnZZuOsyBtBv1KwybJF2/abkCdZAHE8UM4FQcBiL8n4qiCr9buT5CZCCq97AF6XQdxy8kMsmE7uVg2xhuUSqqDzwB540ezmFsvd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(8676002)(8936002)(2906002)(41300700001)(4326008)(5660300002)(33716001)(6486002)(26005)(82960400001)(53546011)(6666004)(38100700002)(6512007)(6506007)(9686003)(83380400001)(86362001)(54906003)(66946007)(6916009)(316002)(66476007)(85182001)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1U4TWhtM2ZuY2hBcThvRVNYb2JRTEdzSzB1ZU1CRU0vNUlhV0VFcmVwOG93?=
 =?utf-8?B?and3Q013cFU0VDBRY2s0Z3lURVVrdGZIQkhoVTYrS2xVU3ZqUTJIRmtVcnhk?=
 =?utf-8?B?SExSTU1nMTY2Rlh1RHB2N3JoQ044cUowaDgvYUtrN2I0eGt0N2Z5SGNWTmVV?=
 =?utf-8?B?UkMwSCswc1B5cVNGTWs2TGh2cXJlUDJMRXNzMmhxU2JBN0xFTmN4TnZHckNB?=
 =?utf-8?B?T204WVhJS0czZjE2RGFlV2RmTURkQ3BXQlNMNmhIdG55YTNCL2JsRXZzOTcy?=
 =?utf-8?B?eVhESXZIa1dzcGVPYUZLUm80cEJ2ajlxcG9EOFoxK1MrNk83Sk1KcHUycTNV?=
 =?utf-8?B?dzA5R2F4UC9LUmErVENhS2xORkxHSmY0SGNocm45VHVGS0FSdDFXeU1ubjVD?=
 =?utf-8?B?dExJNERHS3ZFS2JkSDdhS3R4WVEvNzFubGYrcnB1Y2tsY0tiN1JXV05nTEF6?=
 =?utf-8?B?c2lqajltblFiWFVSUlU2NkNLU3QzT2J4SVA0ZzJnWDhxY1Z2SG5laHpzbkJ6?=
 =?utf-8?B?djY0VStIWm81YnAzYkc2S1FyZkJoQ1JRSzhsUFBNRUpOaW9lZ1ZoemNmNlBj?=
 =?utf-8?B?WHI2dHlxYWkxMmQ4c3AxYzJ2RHRmOW54b0FDcCtiODFqM1lkczJiODhoZlo2?=
 =?utf-8?B?KzJTcU9pNEs1OXMxdnlPci9lc1Z3TGJWWlc0OEFIb3FpaEowb1BmZm0rcldt?=
 =?utf-8?B?dTJIKzd1ZW10U0YzVVBkMzl5Q3g4SS9wZUlURFhyMk9pMkd5TXM4RU9sZzM3?=
 =?utf-8?B?ZmdsdUFDUzFFY1hXK1cvOEVlWG43UTNFa3puZjU1VFpQOWhrdUpBdVpSamU2?=
 =?utf-8?B?NzNEWlB1c3lTTU1FOE5mV2QrbElNcjNtMytIVXUxN2RaeFVlYjZxa2pXVm9G?=
 =?utf-8?B?K24rQmJUbDNIZnBoNm1DSTBLSVFYcjVRVGdXbERUaFdBRWx3Zzl2aFRya1VS?=
 =?utf-8?B?L0R3c1Y3UFBDdXJpUWlYSVp0OG0ydUdFVW9MOTZrUVN4ZGhRcHkvQ2xDWFlw?=
 =?utf-8?B?Ri9pNWh0NGtNUFVhbDFWTGRwekpja00vcUg2czdnV1l3a1dRNGl1eHdXaWhB?=
 =?utf-8?B?aUhPeVdBaS9BRmR2aDJmeFNCR20vNEg1UzJvL0dHV3h1YjJrVVY2RXBRTDho?=
 =?utf-8?B?djJVQ2lnOEJ1aVg5WXFscTB3Q2hlUHJseHozSWgwZVdSejhyWGJuWmRleHdZ?=
 =?utf-8?B?R25SbUE1bStPYThWMUdEaW9BNGdlUzczY0srRHF6Sm1YbndLVHJFaVMvYzk0?=
 =?utf-8?B?YW85aTA5ZU5mT3U4TEd0anZQbnpzR0E2b0hUZ2JVMlpJWnVLM2gzbjZRSnpE?=
 =?utf-8?B?ZFRlNkpxbTZacWtMMk44WGdlb0ZJYy9EamlXNzFwTkRISW5Pb1hBQ0VpYVZW?=
 =?utf-8?B?azFmdW9iOGo1RlBBVEtSQWNJcUFybWtKS0VhVzJXQ0ZOam01Qmx1Q0lBV0pz?=
 =?utf-8?B?M1VHdHhFdW5XZDVSRm1jUm00MlZudWRSY2FzaTJ0K2lPY1pDZnBCN212bDZN?=
 =?utf-8?B?QTc4K0JQZlI0dnhyZ3lyZGhrMHJERkhacVZXS0FDNUNwUi80dGVWaFAzajNp?=
 =?utf-8?B?L1FCaFBCVzFNK0hDdVFWcmJ1YXI0UUtVRUZBYXAvaDQyMzlZMTlyZUUxbVBh?=
 =?utf-8?B?TEd2c1VGcmRQUGpSa3FsUm15S3lwQnc3OHVaamxRaHpRZlE1dHJOcEU2clBy?=
 =?utf-8?B?QXQxWmg4cHJTcmhocVMrRDluNVpvbVlYUUNTOVEwZkk3akF5OUJLanhhSjJK?=
 =?utf-8?B?ZHVrVXB6VDI4OEYvcXpFV3Uyc0tiOVRwOEdKazdwaG0rZWJEZGZXSGN2N3ky?=
 =?utf-8?B?YTdLWFZ1MDdQU3ZhMTBhT28xbVZTaFBsSlVTOFJ6aXZTNzd5TDNLSm5DZ0dr?=
 =?utf-8?B?TFljY2MyV2FlWlR6VVNqSnVoRFVOMCs4THY0ampJTVFGdjg1OFk5ZFVRTnBi?=
 =?utf-8?B?M2Y5d2NUekVRU2hIVCtSSHhvY3VQZzBPbEk3c1ZmRWZITFlqQ051ZWMrNkVp?=
 =?utf-8?B?Q1ViNUtDa1RJQ3NCdUxBVEV3ZVVCYkpCK1hxUzhpMlZFWDg3dExaWDdaNTgy?=
 =?utf-8?B?K3VaYnlVWjA0NXQ2cUM2QlFtOVFVTGZvb043RmRZamI5dkhMR1ErRm15akov?=
 =?utf-8?B?RXNqdm5hUVNXajhCWC9ldzR2bkdOTlN2dmxWTlE2amZDVW9UVEcyTWJIR1Rn?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PWMHhp8vPi9QrBTAMMqC41mSgyS7/XeBjwhL+K4q5ptM4+l5gED8cGMTmJH4XGFEtfXDXdocF7l6a7FPejvXvOJEpevP1zuMIV5ws6omTlfarnrRXWcLudByJFRw0ZQFEOfxfIlgdxUmUhibyzPplz9s08V9HhcB9orWFNOmRVTEHuB9DrvOCn3VJ6rBaca4cN/4wrBn9Qgk+OGitAbIV7ZZXj3v//svZ9AXz/7Q2QSe4o7GQj6vXEM4wbruoNnNTmQmNTuirmI/moc3IubBAU4ruyeiCLkmFqi95v1pPWCOOET0P7yQ2Acq/FoKb/H2KoDrOEf/4oPO5nYle14AbCjMJ3GAwNXjmZaZqO6lkAQwAEyAU+59vOww8/ywwfmpmBqrAh3BCK//VCXq5p1VfS24SeKITYHJYeEdIUGbhieu2ydZE2Gk8se67qH78n2qQJNJthheVg0HPTC03xOviPl4mrdrYabMDgJHXCXWaDKgV62hL26Lz/0VUWQ8VqRGssfBHbu1XdMWpgSdkloX2FjEAq1Y3V8JABWHrjWAK48yMOvxDCakceskiwuqBAMw+BteuD4/RCmappVjv4bfzTMzXDaV1cP2copqTSlqm9EI2qLg2qIx6ka+HM4UMZx/bK1FppAhYc0Fp6Ucg4Z1I5E5UvadfG0/8fc2s25Sp3wzr59uHcodo14dNpmRx+TNDiM5vr+UKHX8mN3c6jRkUCrESYbgtjYqFZ0/+u21ThGXS5hDGcPa4jXEkMq5ySDuj+tB9tjwqHQEDRTgkn85bCqPzynzY4P0SVk29LhvdFc1vJEfDLJ4RF9FwAOSSVrwAtk9cFPURGK0ykyMvUF+6A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05823a26-4a99-48fc-9e43-08dbd6160785
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:23:51.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S93aJjjF6OQI3dVXu/Q28RrshiWLvx1WUGzdi++9PtOhn1GH4x3wHugJlV1NHuyWESZoFETubuR+jZjPUHPN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6125

On Thu, Oct 26, 2023 at 09:59:42AM +0200, Jan Beulich wrote:
> On 24.10.2023 16:53, Roger Pau Monne wrote:
> > Sporadically we have seen the following during AP bringup on AMD platforms
> > only:
> > 
> > microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > CPU60: No irq handler for vector 27 (IRQ -2147483648)
> > microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > 
> > This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> > observed i8259 (active) vectors getting delivered to CPUs different than 0.
> > 
> > On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
> > descriptors to contain all possible CPUs, so that APs will reserve the vector
> > at startup if any legacy IRQ is still delivered through the i8259.  Note that
> > if the IO-APIC takes over those interrupt descriptors the CPU mask will be
> > reset.
> > 
> > Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> > when all i8259 pins are masked, and hence would need to be handled on all CPUs.
> > 
> > Continue to reserve PIC vectors on CPU0 only, but do check for such spurious
> > interrupts on all CPUs if the vendor is AMD or Hygon.  Note that once the
> > vectors get used by devices detecting PIC spurious interrupts will no longer be
> > possible, however the device driver should be able to cope with spurious
> > interrupts.  Such PIC spurious interrupts occurring when the vector is in use
> > by a local APIC routed source will lead to an extra EOI, which might
> > unintentionally clear a different vector from ISR.  Note this is already the
> > current behavior, so assume it's infrequent enough to not cause real issues.
> > 
> > Finally, adjust the printed message to display the CPU where the spurious
> > interrupt has been received, so it looks like:
> > 
> > microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > cpu1: spurious 8259A interrupt: IRQ7
> > microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > 
> > Amends: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit (which I think can be taken care of when committing):
> 
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -1920,7 +1920,16 @@ void do_IRQ(struct cpu_user_regs *regs)
> >                  kind = "";
> >              if ( !(vector >= FIRST_LEGACY_VECTOR &&
> >                     vector <= LAST_LEGACY_VECTOR &&
> > -                   !smp_processor_id() &&
> > +                   (!smp_processor_id() ||
> > +                    /*
> > +                     * For AMD/Hygon do spurious PIC interrupt
> > +                     * detection on all CPUs, as it has been observed
> > +                     * that during unknown circumstances spurious PIC
> > +                     * interrupts have been delivered to CPUs
> > +                     * different than the BSP.
> > +                     */
> > +                   (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> > +                                                X86_VENDOR_HYGON))) &&
> 
> Afaict these two lines need indenting by one more blank, to account
> for the parentheses enclosing the || operands.

Indeed, please adjust at commit if you don't mind.

Thanks, Roger.

