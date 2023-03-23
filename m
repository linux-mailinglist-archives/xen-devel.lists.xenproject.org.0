Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD46C7051
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 19:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514056.795997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPly-0006Xz-63; Thu, 23 Mar 2023 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514056.795997; Thu, 23 Mar 2023 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPly-0006Vh-3E; Thu, 23 Mar 2023 18:34:50 +0000
Received: by outflank-mailman (input) for mailman id 514056;
 Thu, 23 Mar 2023 18:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfPlw-0006Vb-Pw
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 18:34:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 603ae056-c9a9-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 19:34:45 +0100 (CET)
Received: from mail-bn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 14:34:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5792.namprd03.prod.outlook.com (2603:10b6:a03:2d5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:34:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:34:38 +0000
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
X-Inumbo-ID: 603ae056-c9a9-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679596485;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PRWVyNX0rL+Uq3kmbut4cvfDs0J0oQ/xgbqrvmSpcUA=;
  b=YuqDmNA5NbGsMvz0Z93cMuO7IcvV00SfwiD0VHwg3ZvWvWN97wOP5EBj
   jsCKP+0jWC9e7yrJZPHZLnFfX79tsIlThjQylSIepH6YmPR5mEcepE0bn
   al7XL0UTNjwIpPhiz64NzDbm1PlYjpEcDsDShPD88maa/P+sAl7GBdgyM
   Q=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 102083368
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VH1x8am3Bj2QNs2UNGzOenDo5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXWrXOP2CZmH0KY9/bI/koxxS6MTQztM2SAtr/ytkQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ds4DjMOaDrEvKWd7ampVvVqutsKPta+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTuXoraU00DV/wEQWNCMmTFeRu8W8kxelAt1WO
 XQRxzoX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTTMFSCMV7t+lp5s85i8jVf5mGa+xy9fzQDf5x
 mjQqDBk3+lJy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:0w3DtKgNMEJG6t5BkYaKFyNbOHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="102083368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll6rvBycCVk2eKjufpEQ7HO6KpBbeaIbGLGDp2/CVBu6uf0d7I4DYrBekNiuIcavG2i6ooEDC7coEgg4I4q0m2hK9tIG5pKXqzX+x0vhHokLmMDIbXL6qfJ6mTLh+pvF9uZQB/6CuAPydQhT7L8NWxMhhKI5pbMIzZlen8iAlNDAWsyEn6TroEuAMWdFy/H7lULtPiAmzoFwSDrZ+rtlLQpCx1TefzFKRZt4a70m/XVY/pqnicaFGS1UWR2AWsKC9UASHoXBdQjVRQJDtl5cyfDzEyaDeGMh5e1v2DRi7UvpZMAWs9ObjTYvZmxjIjDAwIE79Ou/RqCezed6efv16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRWVyNX0rL+Uq3kmbut4cvfDs0J0oQ/xgbqrvmSpcUA=;
 b=WpDiKpr49F4WHqb4yoeXorDaAgMbdNhAiIPpdit3Bk+jsAsUd+tnNAux77CR9oZ2cwWjNuTMN/1zy32CKwtQqZCni78z/wHjG+ou4OlKylqOSNEISE5FP0QCPpeBUQ79J1r+KyOJQaqOEftTqbLGgxNSiUNgMKQsRO8NUdANPxvNP75o06R1XAbpXOhcrcYZS7fYYJZ/ddQE57/sfaTyrgC57Vioe5fD/QVdJvm/6xRqVP9j21P6CaDeZhCINeBHimtSZR2HoimH58w9QyFAgZdqfVTNWFF49+iUqjKbmp+NWGsCkf+pInskhnRstz/W/kHjmLO/arGX7HhIaLg5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRWVyNX0rL+Uq3kmbut4cvfDs0J0oQ/xgbqrvmSpcUA=;
 b=o0k8GgzfSYcYSYlIuvIBXV+5IhorQ19vF18pMBGpB7l3rVzUG7TVU86K0bLAVgYxAeSKhpvzoSACENR9kPcBpH+AIJNRnDdkA4o/hcla7cZjkvVcMereNIY/4O7MXrSxU8ZfEcFtKDYoQfqsi1NwZWPwR9GtUK9FoNpUK/G8a9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e867ad2b-062a-8114-26a7-32a663e64866@citrix.com>
Date: Thu, 23 Mar 2023 18:34:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 16/16] x86/PV: conditionalize arch_set_info_guest()'s call
 to update_cr3()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <1c2bd7b9-34f9-bd00-cf36-7cf6e0bb8c3f@suse.com>
In-Reply-To: <1c2bd7b9-34f9-bd00-cf36-7cf6e0bb8c3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 179b58cf-5c6e-489c-b3f6-08db2bcd421a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T0wLZ3/KvP4KYIr6VgmnYZamjJEQSHZL2R9MgQD0dyvwBVv4niVEJQnmOJ/1Y9X3xeqmTDPTWZvd0lnuO5EFAazsh6Nyj8Q/G2a33EVwB7QEpWmNP7/KSJvCk2HLtHLCP6dVoZJUpHgwk0WiC5iMGMAxcB1ssoPMGq5SDIfG0w2N+0kADni+p9faPsMrZ11hWBTGYMih7ZLUU9YrsI/a4Dbzba0hj4JdKHWVFaqpdPLgIvGTqUIJI0ZzP5LNHjSh8VQS/RC4U2bDwwUnLQd2FRcbbj0pxLO0c9Yx5pG3hLEwdnEwxARzftF/VcotwtNXdGOX6A2GPc/EyqHBUlvX7YiyQAH3JjUURQgT2nmv4+jTAj6zPEZr5Q96CVu1PFrZU5WXphNsy72L6rW5cxRG7JGQuFdeuXPUQfsmEzOVmaQoTeMmL/+BLNLoaNwIDpoTzMCyI6EdcCmFfI8oKv0ShlmwwhDqA6F+XS5YJg1g89G4RFQ0buEsOUY+HtP8IDzAWdzs/5BCmHGEylXy5x5ifPn85MoT8vCKSWfgkZcjqjh3XAs8BmaQS/B132XxgjsLBMRNgbHmZ7IkzfgroVxVBhW2TIvlmZw0sQ/Jzj9Tq5+/GghnDOdOErCpTX4o4iWRsHDrXMM3ta/eF66DwloNaK8MP+BvKqsK8X7qZKS9DjZjBwqCVpJjhSL5kYTxDjYtgV61x7pvgRfJzSrcxqO8l5u0nl2o2BJRb5BhVaE09bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199018)(31686004)(38100700002)(2906002)(36756003)(83380400001)(2616005)(6486002)(186003)(478600001)(86362001)(31696002)(110136005)(66556008)(8676002)(66476007)(66946007)(4326008)(54906003)(8936002)(316002)(53546011)(6512007)(6506007)(6666004)(4744005)(26005)(15650500001)(5660300002)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVlHc0QwSDY4UEpFZ1dqYWlnKzFtQit6emgxbzIxd2lRZExiRy8wSldWU1dx?=
 =?utf-8?B?MURBNzlEQkF2bzNqTENmRTRQL0YwT1Rrc0ZrNGdLdGZFYW92c2R3eXZBekcw?=
 =?utf-8?B?WUx2bytUOTRVSkpqei9hUU5PWVVob1FwaWxHL1N2dEs2d2cvWnl1VDJCR0Va?=
 =?utf-8?B?K1Y1SUpIRGg0dXdEWGRyT0dRcTR5TURXVFF3Q2JmMzAyQlhkSjV3c2oxUG1B?=
 =?utf-8?B?VHVlUzRNVTFxWlBrTmo4Y05wQlNUbDN5L3BLSmIybTd6L2p6NFR0eTByb1dY?=
 =?utf-8?B?amRSRjdIZnBGdHlURWtVRnI0T2VZQk54U2dBVVMrcFJINmZmdjJNRzBDUWRF?=
 =?utf-8?B?bUM3UE1qcVpYbEFhRXY2QXhsUytvWkp6eWRXc2IyRmNNclRwdGRvU1I1Z1hr?=
 =?utf-8?B?V01seUVaU0o0RFBCZkZMazh4QlE3eUJINnFIc0pwb3d5KzVJYUI0TG5kTGc3?=
 =?utf-8?B?eG40aUJMNVIyN1FXUFR6ZlV1WlFWNWJsS2hlaWxEc3FjdXVFcWMvOEFTV3ZZ?=
 =?utf-8?B?ZnA5T2tpUEh2dm80enhLMGk5Wnpjem5TbUhVN1hWdEZLUnRaYUE3Y3JRRVBl?=
 =?utf-8?B?K0NuN3daRlVFS1lqci9NVE1xb0t5VjF6cW5pNWVVRlhhL1BIb1g5RHA4MEp3?=
 =?utf-8?B?eTVFWTVWQnpaNWlhc0FVRlRITHczWVN0ejEvazJxSlJJcGIwQncyY1NXWVZw?=
 =?utf-8?B?Rm1qRGlnTGZldFBNRXJUUFNYbC9TcmdLUFVRbFRiTkUzUFhrblVERTVsMk9E?=
 =?utf-8?B?TEI5T3pxNkxlU24rTEJ3TTI3VEkyVTN3YUZzOUZxOUhLdXRicmVybEo0QXpm?=
 =?utf-8?B?U3ZCamE5anpMZlZEU0RuZXIzV2ZBbFJFZTF5SUpVeldCUVJSZ243Zk4rYVVs?=
 =?utf-8?B?KzZvS0U1d0Y0V2tBenU0WjBKeWtydEdiWksvdVI0NGI4eTRJUzRWSWc0VTFY?=
 =?utf-8?B?Y1NGZFNzMFR1L3FTK1FmL1Q4emkwVTNqQUZPL1Z3QXd3Z0hFWmdZKy93aTk4?=
 =?utf-8?B?VllvSkd5WHJqcEdIRmlwSGkxZzdsYkJjd25kc1hpN2VRcnpDcWMwakZTRXNH?=
 =?utf-8?B?cGJnUFhWS3g4bkRKbSszVldBSGYxWlpkczFUaTlWL3JRSElvYU45OWkzRXpq?=
 =?utf-8?B?VzI5RGVLTm1zMnhmNWRHWG1YV29vUDZST01tdlpmV3FjUXBQRnVQYXgyNmlW?=
 =?utf-8?B?L2hnYVVUNDhhUHpxNS9BdGd6aVR6c0c4OGNjOTNCQXl4ckFGUXZUSjBGOE8w?=
 =?utf-8?B?YnQxKzhpRUkxZ0VWcFZVYkZZdVlUSEpxWHBhajdQQWh3T2VoMHRQeE90cGgr?=
 =?utf-8?B?K2EyMDZvSWFIUXEzNXhWaklobWhKbEN2VXdBQTkxMlJHelM1QXNRTE1xZk51?=
 =?utf-8?B?dnNiNTV2bmpMSk95K1FZZGlaZ1QxUmhSU2ZRWFIwcWNWRGdEeXM4bFNNNGVQ?=
 =?utf-8?B?TFJxTVlOeXlSdWZiUEh2YUZ3b1NHZFJqZlJtYkFCZjZXd3dYZGg4OW1lRW16?=
 =?utf-8?B?R1dDWVQ1SkhNV3dIbFFlRGxkYTdGRHJFSlBFVSsxSmVLR1JGY1lKb3F4dkY0?=
 =?utf-8?B?TkJmbmkxMDdJRUlWUkFLbi9ST1BMdnVSNFJoQzlqc1dwa29Od0xsblRxam5o?=
 =?utf-8?B?MlNpdDIySkkxKzI0WHZFMFBUeE1SeXV3YXFtSUlwSmNrRzhQSUJ6ZEtDNXR5?=
 =?utf-8?B?N3Q5K21UZjBCWm0xRVlJOVJYZ3Rudng2dFBGZ1lnZDVWM0Z2ODFLUGhjSGxy?=
 =?utf-8?B?ZHVOWitvTjJGLzR0UVpnclR5YUtSTEZ0UXZ5TTJhVGsxMmVlSmtha25kaERw?=
 =?utf-8?B?R2tOYVQvOWpEanZLWnBpTHkzSDBsbUNwa1NOcGIyVDJaU2loSWZLL01FNE9C?=
 =?utf-8?B?a1BuUS81QUFQUzN1T09COStZSWEvK252MVQ5NU9ITWozdldCTytKTERNVkNI?=
 =?utf-8?B?WmZjekNiT1pLNlZpK2lBczhBd3hmWEVubzZzRXI2MDlsVWtvMWlXWXduVFdZ?=
 =?utf-8?B?cDlNM1BBNHh6VG80bEwrS0V6RUJCRVdNUHBmL1ZTb0YzYVFjam9tRHRGUEYy?=
 =?utf-8?B?TG1GUEdzWkhYTkFOVXRXejQzTUZNUENVN2hMb0N2RVdnbmo1WjBRVWlLWHdq?=
 =?utf-8?B?cmtJaGZ4cW5JSE1COGFCdWUvQ01CWjFYUy9uVXBwOU9aNVBrZnErUExmQjF2?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OV7TDG2S4TBYqFsBPT3B222hFp8hHuV55rbLkTaDgRtOUJRJNh7wpak5G91Kg34C8zscuaHVJEawBkq8536qqjDUX0SGzObhBKBX/lFS9Zoq83wjhi0P2C+RxJDNc9v2cVrqFSKn13vFt1gP/m6I1rJ8FQaCJUXE8by7OwMAilVg9+DiJe4g2mbQzXmXuwEXueqv+ObBaICo4EWfcuUBkX09UN7rPatGZtRvXc9NZx13ue32Mnu2H6ac2+Kgv1MXqMaBCHgWGSLETxogt5Hk1Yw35UVjaLDuaV/Iv4g1+JeDXy40exPe5GkLz7qXiiVgEserfbm54CSk4rsD/EB47BCWcRubQtqaEYQWBrzj3kRsy25i/Aluvl/DW005TZxNsP10o2+Vkjnhf8hJEz9t1v7A5JBcmSzWiBVnnpWMlN19PLlT3ShOOQy1j0Ph1jNrKSpP2q51WKfKe7fGRdR8DV/j7rwbOElneufzILnPL8SdRPkIaZ+aM7IxXbV8h5sm5vRQio5eOIt5CcmUlHzC+bHoeH34Had5RQJFe2jLDXxvA5eFGDp5rSfK0D/u+L9OJNycaV3azRI4EX8mCAijrbDID/f4TAubUefmZkyRd5eRkXw829rzbZD8yWNvGo3gepephhaoKSqJqhKH9P2c4v31V7zlh8BXlepvIHx7GZV7VbGPUct/f4NNnOsaiitJK2jJ117HYYIklAIlQvh7K/NBcg7/RZISSC8UzkhsLhkacstfYLihX7Q+oxRlGi4AJQ0bN+W3bRdeORQp9Pr1ViWlmrkEIbbh4nlqJxPH5ri9wLWbFvfMBupGzswh/M9Q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179b58cf-5c6e-489c-b3f6-08db2bcd421a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:34:38.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kzrsFrq8LbTlkHNos1l0Ib1CLsdTu31XxPrLft5Jr7mFGT/ZyJpA/OnG5UcZkxDCVjB9/Rk7gEEGM84jHNYfszfuhgEOx+g6Ek0GJw84Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5792

On 22/03/2023 9:38 am, Jan Beulich wrote:
> sh_update_paging_modes() as its last action already invokes
> sh_update_cr3(). Therefore there is no reason to invoke update_cr3()
> another time immediately after calling paging_update_paging_modes(),
> the more that sh_update_cr3() does not short-circuit the "nothing
> changed" case.

I've finally figured out why "more than" feels like weird grammar.  In
this case, "especially as sh_update_cr3() does not..." would be the more
normal expression.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

