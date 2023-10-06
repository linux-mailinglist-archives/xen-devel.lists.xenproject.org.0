Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099867BBADC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613704.954423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomBN-0000bg-6f; Fri, 06 Oct 2023 14:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613704.954423; Fri, 06 Oct 2023 14:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomBN-0000Yw-3j; Fri, 06 Oct 2023 14:52:01 +0000
Received: by outflank-mailman (input) for mailman id 613704;
 Fri, 06 Oct 2023 14:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qomBK-0000Y4-VV
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:51:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e499e78b-6457-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 16:51:56 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 10:51:53 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7343.namprd03.prod.outlook.com (2603:10b6:610:19e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 14:51:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 14:51:49 +0000
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
X-Inumbo-ID: e499e78b-6457-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696603916;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=1vko/4xx0yxaNwNK+5LTWXnm3f+gh5vMcGKvvtElVRY=;
  b=TxWmMlo8NI1MazHVlqODPFHLr7k5TbErrxqH5c0xhB4F2u9vP0lb9myZ
   +Hn7IJMeJxjXtNMqo+JqXxN1A83eiuxVdtsMn1IGYQBbuK5EZasyoVUWZ
   l+h+e6DX+260XLDBonuzw2i++RqKakvHQEcfNZhPu3kc8mManF/0OeUSB
   Y=;
X-CSE-ConnectionGUID: FHRUL8jnRQy6fDcKc8vKjQ==
X-CSE-MsgGUID: 5QIwnenDTTenro3/yofWaw==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 124701934
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0w/IvK41H/DSrFAPm+oMFQxRtPvGchMFZxGqfqrLsTDasY5as4F+v
 jRMD26BM/aJMWqmf9F2a4rnpksF7cCDzNJgQAdlpH1gHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgT4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 9wiFRRdbBa5vvPozp6waeI8mOchFZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3+kANtDT+HQGvhC3WSy2WoeDjEqaVa9u/7izV+5Ve1WN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9QnWY86qSrC+jfy0cK2YNaDUsXQYD+8Pkoow4klTIVNkLOLGxps34H3f32
 T/ikcQlr7AajMpO3aPr+1nC2miovsKQEF5z4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:aSY8paBmajtQThXlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AR5moVmj27eHYj1osKKhj4VVyIzJuXF3n8VOAIUm?=
 =?us-ascii?q?CMHc3RpGealTA5oBmqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7boHhg8uAGvhJp5Jx13BmDKQf5pRwruoBUYhrak?=
 =?us-ascii?q?LvdODbmthPDmihSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124701934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly7x+ga73p2NocDOgDhQ5jomCf4kratyMG0bgz9lzFQabv8WB4n0h2o56IpW/z2bzVSqxQTegp+gCdJrTkESyvQUerGYS5EEgpDoBazVMsW+Gxrl0emd/2MOCtPL72EJkY+mfOuDPfLxyYAPievhPg07iPxskU5ZjXFr54PkTKcw2m8CnyrFqm4phD0tMzdtUo+fYX2EMz3jkxzZZwqKLhPyBrUWNcyKELQvUC2rWJo7sqWJNaadFwUmPC5ww11mn62nTBOJAI0GsChNPK7PJJ1rn74xGH4Ff8jLT6yu+a4pnPOIpvVUNi0RfNDESVscbyU6/DiI/PHTRmxdPv8fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnj1Ab8dn8NDQ8jLFdQwRkAZP8ogg9fDaL/cApnkaWM=;
 b=DkVaCI0r0l76O9LQNiITv9IYJ1Gau+S3RySRuqq6mM9zyLlzsfQp1dXWnLIb6mHwL+fPsQpYsMykVVj/r1Jk7GG949KKLIjjGLQRKdjbSiJ0WWPM2kxwzI8Di3XHyYcaBAKvFiZWLW3K8LsS1Uw5QsAacFlVNIdST1y9nRtzfDkTUB0EmYxY03aDSCczwJg61fNSfFm2q0W+DrPL4xCkXsZKIelPtBVDG20PA2wThKdVCbfnsCw/ipnGQhQGLCWtTRPG6xM2K4Z17ovNmzmnV4DZxmrfTJXDQLKal+VJW3YMLp12UXEpyGe1TUrbURtzy9DwdT8fNw5FuPoYd5Ku/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnj1Ab8dn8NDQ8jLFdQwRkAZP8ogg9fDaL/cApnkaWM=;
 b=nCUHa4/UtMVa3iS3+hrEMb3j1nIQbSp+cToNfepSeqWUnrGq8Teg33EkdFKJRO/a0RDsxgEUGgYKJtxIiysuJTy9BFJ9kOkBEjbudRzo36fKiWZfsCtxwyGdjmbqJesI5sbZlDg6JwSXn9mHpmcS1NQ9OVxunItAruWPMGNf6Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenpvboot: remove as unable to convert to Python 3
Date: Fri,  6 Oct 2023 16:50:46 +0200
Message-ID: <20231006145046.98450-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3e944e-002d-4699-7c33-08dbc67bc4c5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EKrMF6v4cnFDLwl35bh09ZnrdtEhzblRgN01aBJaLtCKWUilOVISjMYAg+5ehJUILPeHou7aFFtwlTkaptU45k1LsvsqRJtpsIlulhQpAbxg7t7Ypjfuj4HtnoVmU0gn1UO5c/5wj/xHVkwjGJP1lH3zVDzrTEqpSUDiZHfcnjtH2IcMjijmk+4LlVRv6VazT5/EPAL+zP678mZDYcg7dx8ZEGOdRdhOwdr7dWAkJcW2Eb8rfHCqdBQqnUct7HN4aoAIwghtD1SZfXEui5RFdXgJbGA3gfT2vWnH56hlPp/RxtUaml8z7KtHDZocKq25Ew95RjrhBYeW35cXaTiJLnUm63+B1xwCOvoheH42J4dYNult015muz6cZL2C0nofwjpJ0hhXAmJkjBZ46cv5GFmyYPLp7LCZ/tvfVVV97BbqcvuTGcugp2QNtsC5tfSAGhSF9pmNlwybULKBU7QTGZ+B7v7Lbm31wTTZNZfnwHXZSA0Tn2XcDWDtdI62cZW/hKZ9W5VCUQ7SWXBq5tKyoPyyeTZtWHyUuWRSj5/HRIBW7UKCe8Xm3ewu92/6VGML+52vU2P1iqehiuNH83n711mQm4hOJeg2ksL3/PHsc1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4001150100001)(5660300002)(8676002)(4326008)(8936002)(30864003)(2906002)(2616005)(66946007)(316002)(41300700001)(6916009)(66476007)(54906003)(66556008)(6666004)(1076003)(26005)(6506007)(36756003)(107886003)(6512007)(82960400001)(966005)(83380400001)(6486002)(86362001)(478600001)(38100700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVwbzF1L3EzSjM4YlJTTXI3cGZUc2VmeXUyWDBIWGlyeU5PcEtLVW4vUmpS?=
 =?utf-8?B?M0JQNVBObk5nc1VoTzV4a0pEdDh1aTZPMjNnWTZKS0RqVkpWcEUvQ0ZDNHND?=
 =?utf-8?B?RjEvUWF1dFJxczVOQklxOTB4ZnNpaXM1aTNtNXd5QTltVTZqQXVUcEl2M1Zh?=
 =?utf-8?B?R2ZMZnMxQjFHVGcrdGdaMTZiWS8yOU5kVVJncXlCNCtqWXFKWkxoSXdhT3o4?=
 =?utf-8?B?aUJkaUlPOEx1b1lud0NrMzdFUTFHb0tINmdGSXVnN1h2U0tTaWlPRFpMVFVV?=
 =?utf-8?B?d0pmMk0va0FYMWorcjMxVkJScUVZSWdwWVZLdnludWtlSmZxRHBjaFJVV3dK?=
 =?utf-8?B?SFZVdEk1VUhuSW0rWm9pUHFLbDUxOGtjTEI3a3V6WUE2dkovVXd0a2lYcmRH?=
 =?utf-8?B?dVZjUm9mbFhveGxVek5IbXF3dHF1alVZZXR0bjZPT1lFemRiU1hQUG9RMWtL?=
 =?utf-8?B?UVFwT0kwWTQxakwvRnNwWjZLQm80dUxubTlQdkFlNVlreWhxVkhXRU9FbHlq?=
 =?utf-8?B?bUxwcEJxb3Q4UzBVT3E4cktSWWpNR2d1UmVrNGhaWmlxTHlWZWJJZ3hJbG9y?=
 =?utf-8?B?NStCVVN2SnNVRFlZdUh5UXBPdE94U2RuVmdTRUJvUjZyL1ZjeVlab0xCT2pN?=
 =?utf-8?B?bUw2UHEvbFA5NDZMUzlmakhMcU90UVNyZlpvMVd0T2FPcjRCTFpiWjJJUXFP?=
 =?utf-8?B?bG1YRHpXTFZHTEZUS2hPdk9WTUxJQ0lsYUYyUlRhVFhZdFJGVFBpTG82ODhQ?=
 =?utf-8?B?d3hCNXF4TjNkZ25Ua29kbC84WC9TYXJEODFRMUNXdE5nMGdKblJNeVVFejhs?=
 =?utf-8?B?MU5WWWNSeXhEeXhOZlBFdXR2ZWZCWHdEblNTR2VTQTlyeDRWeWxEcnNycElp?=
 =?utf-8?B?a2pWclZXc0p1OU5RQldXNEc1cEtFbE5CbmQyVTBJVWErdmRXSlJGcVZUTHBy?=
 =?utf-8?B?M0J5NG8zWHFjWkZ5NTBPUjhXT1ExYVpJd0lCdFFFNjM2L3pydHEzVUovWTE5?=
 =?utf-8?B?SlRlczg5TWpETm40TC96UHBNNC80cTBSMlRpSmFlNWVVaEVKS2ZCQXR2TUNC?=
 =?utf-8?B?SmM1eFBZelVBZ3RyWTlqTytYNExEWHZWbWV6TGluQW9sRnQwM2JQNkVOV3BZ?=
 =?utf-8?B?ZjNFdzM2aFpvOUEzTGt0aVV3MDZXS1JBaUE4emFKV2UySkMybVZkUVdoTnhI?=
 =?utf-8?B?bVNBTUl1RGlZblN3di9TbFFBWHBOWG13TG1HYjloSUdhYnBuODNHQkFLek91?=
 =?utf-8?B?RWtnWVNEaEZoZUJSbVBObUpNN1Bud1VxTmRVczJDUGxEd2svTFFzR0JSeEdS?=
 =?utf-8?B?UWNUN0xlb0VOZzU0WFRFMTBMcHo2UVVEa1pZNzluWTNrdmV1cHRyUmd4L1h0?=
 =?utf-8?B?c2tUT2hkL2hnTDVGd2xZMzF4RjAxTVZjbDJ6a1lRQzBXSzZ2Nk83ZzhHMW9I?=
 =?utf-8?B?Y0Y5N3RheWZEYjM5R2thM09zWURyc0pYY3JxOHVZUHk0ZjB4ZDFVRG1KUC95?=
 =?utf-8?B?Q1NpdEtVZHBKaTFybkVqajIrYlVCWi9EWHNScDhuN2NaRXJPY3lhV25GaHUz?=
 =?utf-8?B?RWpKVHNieVVUOWZ0clppSlljNVNCUm5OOGJNTXgycWl6QkFEWEpOUG1iVTk5?=
 =?utf-8?B?WG5yL3NDTzViVi9GTWt3c3gxN3FlQk56amRQbHcybnhVcUJmV1RKOVBSRWRy?=
 =?utf-8?B?TWZZZEpqa3cybm05M2c0dis0UGRGNk91dFVHTGoySWh4bFR0ejNBMHFLNldz?=
 =?utf-8?B?b0NKTllyM3Rmak0xNXQveFV3UFBTckM5aWtTbHhTN2ZxQkkzK05sVUhXODMw?=
 =?utf-8?B?OEZYNjdoc1hkdDBSWWY4M05OcG5OdFJHczZVckgxL1BIQk5pK3NQY3d2cUk2?=
 =?utf-8?B?aHk1RTdLYWZ3Q094SmhWWnhmZXFFa01lM0tTWVEva1ZWdWZwSWxNblRUVDNB?=
 =?utf-8?B?R21vZGJRWEFlaXRYaGlROFppWVpQSHQ2R1JpTTljd2U3OFMxMDZHNTU0Nis5?=
 =?utf-8?B?SGRBdGpnLzBGRCtYY1dDbWF1SmZxVWZlRkJ6MzExaC92bm1qanpHMG1OYS9n?=
 =?utf-8?B?WjZRWHBianFaT0V2U0t3a0I0WC9FMklWVFB2UlJxakx2VlhlUHB4d250K0li?=
 =?utf-8?B?VTVCU0crQndadVpZNWlOODhNb3FiQ3ZBQ1RsblhFMkJhQ2trNGpuY0pZakd0?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CVBNTwRNWLBPm9BJ37qYCrUhiSerzWOgrgeD6n6yLgjLDa8po16+vGMtiqwGb4BJHUK0m48kUX8EXIqihW+AOvuh6ENiil/zwcDxCQbdA7Fwczt4zXwW0XHt6toAuBitoSOpuXm3gUNMcr7P6PIi3vMjQM/wOQQ4pa1fPaThObC7gn3OO/pZTGsOOHCAYQgarUb7oB/lmC1U6yRJidrAbIdClvPDU+ny0QgXNpwpiXt48cN96WKU/QLSi8GYvS4SILlZBepLJihIVOSBgRtGfNh9cQSL8ffSEDsig0K64nehnTmMpBPzJgWpo7BvcHhcFcUjcaUlSpfmoP1D5GPkposx9MaYhQCJnyx8Sa9r6/dKuZQX4PnvagP9HCO5kSiJz6rw2GKCNYHv6xSuOfkGFfvdjrIxuwQzjirCR6/O9xSXmf3zgsAotD4pDT3geFSU4FWCYaJEHYrDhjpCkNYCa3HarjuA8gMZlomRLDoycxs27OCCUODpBv3ptbuzMcU6GhRD8Qk4Uw9RTzIGc4BGFhPn/8BYfPdREHf5qnrI+zf1Pqsx0ncQoK56R2PddNGURPF+9WqsxaYvYdNqDTvwL8b7os7tq3QZccvxycS5xkw56NgJV6x07eUuAzVT/FQYVQw/iRB6oU4j6AjTXdigRuOKdhI1TBmaKHrq/7wxBFGwlAOU7SzSwtNKvS7QHLOetOQA1hLBMFbWtcOfWyg8k3Tn70xo9M/KWH7VaqOyhEHnUzUxkXzSTJvIYJUzn/PVU8CixXljaB05mTGYk8r7UowlsR7OI5ZqG976TWUUGULCvnygMwsXK1uI8ZSnfG40sIG+PVFdl4d3UYDMRjchyTZaeGv8uz/ou1Ma3BBL+Ww=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3e944e-002d-4699-7c33-08dbc67bc4c5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:51:48.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fkk285VZRvX3/p/nmy1rLXecBuNR2J/EkCG4vlWWgMhDXUgeffugUSBTDh39git2H5SuaR0lA3xnyBOmgFoWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7343

The script heavily relies on the urlgrabber python module, which doesn't seem
to be packaged by all distros, it's missing from newer Debian versions at
least.

Also the usage of the commands module has been deprecated since Python 2.6, and
removed in Python 3, so the code would need to be re-written to not rely on
urlgrabber and the commands modules.

Arguably the purpose of the xenpvnetboot bootloader can also be achieved with
an isolated script that fetches the kernel and ramdisk before attempting to
launch the domain, without having to run in libxl context.  There are no xl.cfg
options consumed by the bootloader apart from the base location and the
subpaths of the kernel and ramdisk to fetch.

Any interested parties in keeping such functionality are free to submit an
updated script that works with Python 3.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md            |   1 +
 tools/misc/Makefile     |   7 +-
 tools/misc/xenpvnetboot | 291 ----------------------------------------
 3 files changed, 2 insertions(+), 297 deletions(-)
 delete mode 100755 tools/misc/xenpvnetboot

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 47ea9e275462..165c5caf9bea 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -38,6 +38,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86, the "pku" command line option has been removed.  It has never
    behaved precisely as described, and was redundant with the unsupported
    "cpuid=no-pku".  Visibility of PKU to guests should be via its vm.cfg file.
+ - xenpvnetboot removed as unable to convert to Python 3.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 233a7948c050..9938bc235968 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -36,11 +36,8 @@ INSTALL_SBIN                   += xen-livepatch
 INSTALL_SBIN                   += xen-diag
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
-# Everything to be installed in a private bin/
-INSTALL_PRIVBIN                += xenpvnetboot
-
 # Everything to be installed
-TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN) $(INSTALL_PRIVBIN)
+TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN)
 
 # Everything which only needs copying to install
 TARGETS_COPY += xencov_split
@@ -59,11 +56,9 @@ install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PYTHON_PROG) $(INSTALL_BIN) $(DESTDIR)$(bindir)
 	$(INSTALL_PYTHON_PROG) $(INSTALL_SBIN) $(DESTDIR)$(sbindir)
-	$(INSTALL_PYTHON_PROG) $(INSTALL_PRIVBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(INSTALL_PRIVBIN))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(INSTALL_SBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(INSTALL_BIN))
 
diff --git a/tools/misc/xenpvnetboot b/tools/misc/xenpvnetboot
deleted file mode 100755
index be972b9e19b7..000000000000
--- a/tools/misc/xenpvnetboot
+++ /dev/null
@@ -1,291 +0,0 @@
-#!/usr/bin/env python
-#
-# Copyright (C) 2010 Oracle. All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify it under
-# the terms of the GNU General Public License as published by the Free Software
-# Foundation, version 2.  This program is distributed in the hope that it will be
-# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
-# Public License for more details.  You should have received a copy of the GNU
-# General Public License along with this program; If not, see <http://www.gnu.org/licenses/>.
-
-import sys
-import os
-import stat
-import time
-import string
-import random
-import tempfile
-import commands
-import subprocess
-import urlgrabber
-from optparse import OptionParser
-
-
-XEN_PATHS = [
-    ('images/xen/vmlinuz', 'images/xen/initrd.img'), # Fedora <= 10 and OL = 5
-    ('boot/i386/vmlinuz-xen', 'boot/i386/initrd-xen'), # openSUSE >= 10.2 and SLES >= 10
-    ('boot/x86_64/vmlinuz-xen', 'boot/x86_64/initrd-xen'), # openSUSE >= 10.2 and SLES >= 10
-    ('current/images/netboot/xen/vmlinuz', 'current/images/netboot/xen/initrd.gz'), # Debian
-    ('images/pxeboot/vmlinuz', 'images/pxeboot/initrd.img'), # Fedora >=10 and OL >= 6
-    ('isolinux/vmlinuz', 'isolinux/initrd.img'), # Fedora >= 10 and OL >= 6
-]
-
-
-def format_sxp(kernel, ramdisk, args):
-    s = 'linux (kernel %s)' % kernel
-    if ramdisk:
-        s += '(ramdisk %s)' % ramdisk
-    if args:
-        s += '(args "%s")' % args
-    return s
-
-
-def format_simple(kernel, ramdisk, args, sep):
-    s = ('kernel %s' % kernel) + sep
-    if ramdisk:
-        s += ('ramdisk %s' % ramdisk) + sep
-    if args:
-        s += ('args %s' % args) + sep
-    s += sep
-    return s
-
-
-def mount(dev, path, option=''):
-    if os.uname()[0] == 'SunOS':
-        mountcmd = '/usr/sbin/mount'
-    else:
-        mountcmd = '/bin/mount'
-    cmd = ' '.join([mountcmd, option, dev, path])
-    (status, output) = commands.getstatusoutput(cmd)
-    if status != 0:
-        raise RuntimeError('Command: (%s) failed: (%s) %s' % (cmd, status, output))
-
-
-def umount(path):
-    if os.uname()[0] == 'SunOS':
-        cmd = ['/usr/sbin/umount', path]
-    else:
-        cmd = ['/bin/umount', path]
-    subprocess.call(cmd)
-
-
-class Fetcher:
-    def __init__(self, location, tmpdir):
-        self.location = location
-        self.tmpdir = tmpdir
-        self.srcdir = location
-
-    def prepare(self):
-        if not os.path.exists(self.tmpdir):
-            os.makedirs(self.tmpdir, 0750)
-
-    def cleanup(self):
-        pass
-
-    def get_file(self, filename):
-        url = os.path.join(self.srcdir, filename)
-        suffix = ''.join(random.sample(string.ascii_letters, 6))
-        local_name = os.path.join(self.tmpdir, 'xenpvboot.%s.%s' % (os.path.basename(filename), suffix))
-        try:
-            return urlgrabber.urlgrab(url, local_name, copy_local=1)
-        except Exception, err:
-            raise RuntimeError('Cannot get file %s: %s' % (url, err))
-
-
-class MountedFetcher(Fetcher):
-    def prepare(self):
-        Fetcher.prepare(self)
-        self.srcdir = tempfile.mkdtemp(prefix='xenpvboot.', dir=self.tmpdir)
-        if self.location.startswith('nfs:'):
-            mount(self.location[4:], self.srcdir, '-o ro')
-        else:
-            if stat.S_ISBLK(os.stat(self.location)[stat.ST_MODE]):
-                option = '-o ro'
-            else:
-                option = '-o ro,loop'
-            if os.uname()[0] == 'SunOS':
-                option += ' -F hsfs'
-            mount(self.location, self.srcdir, option)
-
-    def cleanup(self):
-        umount(self.srcdir)
-        try:
-            os.rmdir(self.srcdir)
-        except:
-            pass
-
-
-class NFSISOFetcher(MountedFetcher):
-    def __init__(self, location, tmpdir):
-        self.nfsdir = None
-        MountedFetcher.__init__(self, location, tmpdir)
-
-    def prepare(self):
-        Fetcher.prepare(self)
-        self.nfsdir = tempfile.mkdtemp(prefix='xenpvboot.', dir=self.tmpdir)
-        self.srcdir = tempfile.mkdtemp(prefix='xenpvboot.', dir=self.tmpdir)
-        nfs = os.path.dirname(self.location[8:])
-        iso = os.path.basename(self.location[8:])
-        mount(nfs, self.nfsdir, '-o ro')
-        option = '-o ro,loop'
-        if os.uname()[0] == 'SunOS':
-            option += ' -F hsfs'
-        mount(os.path.join(self.nfsdir, iso), self.srcdir, option)
-
-    def cleanup(self):
-        MountedFetcher.cleanup(self)
-        time.sleep(1)
-        umount(self.nfsdir)
-        try:
-            os.rmdir(self.nfsdir)
-        except:
-            pass
-
-
-class TFTPFetcher(Fetcher):
-    def get_file(self, filename):
-        if '/' in self.location[7:]:
-            host = self.location[7:].split('/', 1)[0].replace(':', ' ')
-            basedir = self.location[7:].split('/', 1)[1]
-        else:
-            host = self.location[7:].replace(':', ' ')
-            basedir = ''
-        suffix = ''.join(random.sample(string.ascii_letters, 6))
-        local_name = os.path.join(self.tmpdir, 'xenpvboot.%s.%s' % (os.path.basename(filename), suffix))
-        cmd = '/usr/bin/tftp %s -c get %s %s' % (host, os.path.join(basedir, filename), local_name)
-        (status, output) = commands.getstatusoutput(cmd)
-        if status != 0:
-            raise RuntimeError('Command: (%s) failed: (%s) %s' % (cmd, status, output))
-        return local_name
-
-
-def main():
-    usage = '''%prog [option]
-
-Get boot images from the given location and prepare for Xen to use.
-
-Supported locations:
-
- - http://host/path
- - https://host/path
- - ftp://host/path
- - file:///path
- - tftp://host/path
- - nfs:host:/path
- - /path
- - /path/file.iso
- - /path/filesystem.img
- - /dev/sda1
- - nfs+iso:host:/path/file.iso
- - nfs+iso:host:/path/filesystem.img'''
-    version = '%prog version 0.1'
-    parser = OptionParser(usage=usage, version=version)
-    parser.add_option('', '--location',
-                      help='The base url for kernel and ramdisk files.')
-    parser.add_option('', '--kernel',
-                      help='The kernel image file.')
-    parser.add_option('', '--ramdisk',
-                      help='The initial ramdisk file.')
-    parser.add_option('', '--args',
-                      help='Arguments pass to the kernel.')
-    parser.add_option('', '--output',
-                      help='Redirect output to this file instead of stdout.')
-    parser.add_option('', '--output-directory', default='/var/run/libxl',
-                      help='Output directory.')
-    parser.add_option('', '--output-format', default='sxp',
-                      help='Output format: sxp, simple or simple0.')
-    parser.add_option('-q', '--quiet', action='store_true',
-                      help='Be quiet.')
-    (opts, args) = parser.parse_args()
-
-    if not opts.location and not opts.kernel and not opts.ramdisk:
-        if not opts.quiet:
-            print >> sys.stderr, 'You should at least specify a location or kernel/ramdisk.'
-            parser.print_help(sys.stderr)
-        sys.exit(1)
-
-    if not opts.output or opts.output == '-':
-        fd = sys.stdout.fileno()
-    else:
-        fd = os.open(opts.output, os.O_WRONLY)
-
-    if opts.location:
-        location = opts.location
-    else:
-        location = ''
-    if (location == ''
-        or location.startswith('http://') or location.startswith('https://')
-        or location.startswith('ftp://') or location.startswith('file://')
-        or (os.path.exists(location) and os.path.isdir(location))):
-        fetcher = Fetcher(location, opts.output_directory)
-    elif location.startswith('nfs:') or (os.path.exists(location) and not os.path.isdir(location)):
-        fetcher = MountedFetcher(location, opts.output_directory)
-    elif location.startswith('nfs+iso:'):
-        fetcher = NFSISOFetcher(location, opts.output_directory)
-    elif location.startswith('tftp://'):
-        fetcher = TFTPFetcher(location, opts.output_directory)
-    else:
-        if not opts.quiet:
-            print >> sys.stderr, 'Unsupported location: %s' % location
-        sys.exit(1)
-
-    try:
-        fetcher.prepare()
-    except Exception, err:
-        if not opts.quiet:
-            print >> sys.stderr, str(err)
-        fetcher.cleanup()
-        sys.exit(1)
-
-    try:
-        kernel = None
-        if opts.kernel:
-            kernel = fetcher.get_file(opts.kernel)
-        else:
-            for (kernel_path, _) in XEN_PATHS:
-                try:
-                    kernel = fetcher.get_file(kernel_path)
-                except Exception, err:
-                    if not opts.quiet:
-                        print >> sys.stderr, str(err)
-                    continue
-                break
-
-        if not kernel:
-            if not opts.quiet:
-                print >> sys.stderr, 'Cannot get kernel from loacation: %s' % location
-            sys.exit(1)
-
-        ramdisk = None
-        if opts.ramdisk:
-            ramdisk = fetcher.get_file(opts.ramdisk)
-        else:
-            for (_, ramdisk_path) in XEN_PATHS:
-                try:
-                    ramdisk = fetcher.get_file(ramdisk_path)
-                except Exception, err:
-                    if not opts.quiet:
-                        print >> sys.stderr, str(err)
-                    continue
-                break
-    finally:
-        fetcher.cleanup()
-
-    if opts.output_format == 'sxp':
-        output = format_sxp(kernel, ramdisk, opts.args)
-    elif opts.output_format == 'simple':
-        output = format_simple(kernel, ramdisk, opts.args, '\n')
-    elif opts.output_format == 'simple0':
-        output = format_simple(kernel, ramdisk, opts.args, '\0')
-    else:
-        print >> sys.stderr, 'Unknown output format: %s' % opts.output_format
-        sys.exit(1)
-
-    sys.stdout.flush()
-    os.write(fd, output)
-
-
-if __name__ == '__main__':
-    main()
-- 
2.42.0


