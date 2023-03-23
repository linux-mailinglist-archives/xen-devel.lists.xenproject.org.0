Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80F6C6F9C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 18:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514027.795930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOzy-0005mf-5m; Thu, 23 Mar 2023 17:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514027.795930; Thu, 23 Mar 2023 17:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOzy-0005ju-34; Thu, 23 Mar 2023 17:45:14 +0000
Received: by outflank-mailman (input) for mailman id 514027;
 Thu, 23 Mar 2023 17:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfOzw-0005iU-KF
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 17:45:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 736e0ea9-c9a2-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 18:45:09 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 13:45:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6082.namprd03.prod.outlook.com (2603:10b6:610:b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 17:45:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 17:45:04 +0000
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
X-Inumbo-ID: 736e0ea9-c9a2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679593509;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cjuaqIqYoU2lAycKHi0ewLbJ4uoO3q90S/f11o2BwTM=;
  b=G9V8TNEz4L9C88I0Ick3lWZCd3qV2oOGuW7uxad1pGc28Eb88jGrtY86
   6/I6p0UyvA3BT0QtFXHHHTH58WHd9n5zrQDB9qhz9o4SUeqbppF7vM4QO
   QaYK1Jx9X3baYP5LglY2/7/uWsimVCYRQLQCTvlldw1cRn2acjbiksOlP
   4=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 102484386
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iwa+zqwbTmW+RpT/JWp6t+cHxyrEfRIJ4+MujC+fZmUNrF6WrkUCn
 2NLWTyCPv2DMWfzLd53Ooq0oRhSuMCHyYRrQVNr/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWEJy
 u0fOhksVE/Zh9m4yrWDQO19if12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANhOROHjpqACbFu7+HMMCz8MRGKHr/CD0mSRctFzL
 UE/0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOqM4zbSwn0
 BmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh2PMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:u3fx2K0dO5gtbRXnTNtl6wqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="102484386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DT8tvb6MhEimQ28+zmOOoo+HXSE0TwBUCynry9wSfh2xIrj+duh2BIq9IGPM0K5iF253CyryQdlZpM/qLi/mffvumUeIax1TQtziFeLaUg3SmYQnjnZt04IetuIah7/mcLts/XbtaeeC4XLDx0YRUwew2gCMgSoHlI6zYGkouFdTSWb8bmaqguo4zkc9rR3o44LsZryRVID9cPkSlxMSHvzXO09FlQGI9/CyynvS0eujcT9lZH+P3jQtZYE4LE7ptBjloVkOOEa7sk0NePuqOnseSzuo0ZzQdg/K0ctAKVbCD8rfhibhJYVihbtm0axeKCqa5OSO0aPj2s529XcmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMBEwq9qlCoSw0Fs+f3+SVNp7uYSx9IKamAdmhll53w=;
 b=lxlMG+QS1fBYS/9pbqTmes/7SkW+Jylj9QwHMHTSQBSiUG9BrxRoL/WBckwVhVy9ASK6oMzyCdC2qh0bLRrNCvsY963XCXyW1efttGGL+xi2UOjAD618R9Z3b1kC69vvwtx+v6LjCV0nrQl9dL5fZfEVrn/ISXpfJXZ07os5PNUMJWuPK2kNNrTmTESGPwQZb9Fr9nqbgMvwpNqnHK3BcfS7RWQokVBesTYR42w2IsrjvDAIcP/quqmnSQgBnYfv5ATKtamARWrgcr3HWAqZXgZwWTUvkvk3wFm95nc9Kzv+pnMTV5ZyMAIUPcy5T1XUs9L/+24ZC/mInfHURyIDkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMBEwq9qlCoSw0Fs+f3+SVNp7uYSx9IKamAdmhll53w=;
 b=tvkX0Zg87dZULNZOYzNymZRDrsdfhQi0IH5Meni05PeylcGX/TF7795H7gnIoXV9ZUWdyQ383LpnJwueX8eyTEln0S/KNR7cxzL5IOCYryxmox8CiadPJtGmHqyOD4+DtUr+dqNf5Di+BD1HYouMdcoP29BmMupmFV9vqorot5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <271b081f-5566-fe29-2999-48b55e564d66@citrix.com>
Date: Thu, 23 Mar 2023 17:44:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 10/16] x86/shadow: move OOS functions to their own file
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <88be7d2e-325b-2a32-fe9f-ce762bb7b606@suse.com>
 <253e45ae-4b66-a618-6385-b0fa018e693a@citrix.com>
 <dfc15fe8-aede-4e01-ecf3-c3457c95563f@suse.com>
In-Reply-To: <dfc15fe8-aede-4e01-ecf3-c3457c95563f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d380da-b8d8-40d0-11dc-08db2bc65552
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4eUWENINRVTJ3BtAVhu8qwK6rq9Tew4ZmUUXSdjqh/SnGe6u1luUmbjxrxaJegAxXK//v7y//6W6Ku6QmY0WlvyiwJ0i9+lkVmtSg1l6cU0O87HTIUusqMLFfrTwFGpvRRdOuQ7OTUNuhdrHr4Ig/AW3SS3hWIYrhYckJnkAdLKI8pEB+2TuUr/JPVVgSOswS0ykjtKTL6/hvVZrqAE0mrIeA6eSZ1qfUUqZRIGqrQ7L4YHtk4UAlN+fdYYc3oRG6Y/6k4gBwzwopjsu/Z/k0rqKToUgLCGBKuZ9oDiwF1hRmn0T69cmXf1+CJ3plMNGFLRHaV7LkORaAkAhfP0CO9Mj0BEYlzRAyr+/hclbTVqObmDTSrDpZEtURFlMaVQtUWArTjju7ukbz/LVGMyoB3Rnkk/enYqiJ3ZFDoY74GPti6Y7by2Dg9mqh3zdRhnlXxumGrtp9iIA2AbnFUfL5QAIJRBgjFzgHPeGQakzY8y/QPDvFdTmhBmgx2iruxZWktxzN9eL3d4J5zdl1RkWneGWwJdaaQn8Rh46Yrn/jKueZY3kzztgzT0sZwq77Va9DuIvwNMiY7WuXA6x23qXo7FT7hr1MOT/OE85sUaCISkXQud0k+btMqzpGPXXoMrD3nUV+XFvb0CLdNs3+RCAMhIuWAdJ2lwnLXYn7GIdfCd+7ZRACe4563IF0BMW0ULmKjtZTgcM1u08QocDzm9B4A4RfxsLyiRevWnJ52pVDxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199018)(31686004)(38100700002)(2906002)(478600001)(83380400001)(6486002)(2616005)(316002)(186003)(86362001)(31696002)(36756003)(54906003)(66476007)(66556008)(4744005)(8676002)(4326008)(66946007)(6916009)(8936002)(26005)(6666004)(6512007)(6506007)(53546011)(5660300002)(41300700001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUQ5c01VazhYcVdjYTNSdWc1SWhSbGdwTThhbkpOOUNMMGNWZWZaZmtGbHVp?=
 =?utf-8?B?OUJHNTU2N0RFNDJnWjVpai9iaGdqNnBzNHBsVko0bDRLS1hWa09GVzgrQ3FY?=
 =?utf-8?B?anEyM211ZE1jSWxVTHJpTDZZZ0Q2YzV6QVFKdlBmd3NXaHRwdENSWHJma0FS?=
 =?utf-8?B?eHR4emFVY0JwcDVjNFZwWVJLRDRidjM3cHlrZWdsS2UwaThjNTJ3c2lnU1o4?=
 =?utf-8?B?cEdJcmh1NVVqR3RHNEJVMTB2SUJkbFM4Y09lZG5vR29zRDQ4eTJvVFI3eStD?=
 =?utf-8?B?UzdxY2g4enordlhsNjJydm03bXcrWnFIQSt4bkVOVE9mQlRsMFAyRFg5N3hU?=
 =?utf-8?B?RlowUzRnTldqMkkrS3ZrSTVVVjRlZnVyWEZwZlprNDVWNHMxRlNGU29oZ0Nl?=
 =?utf-8?B?U3NnZ0E4YjJjaG1uOCtXdVRETjJVd2VnTzRkeTJuWHJHRkdLS3FrbEtWQ0FP?=
 =?utf-8?B?WmpvRlZWUTd2c1FsN3ZEYlg5VG5CUGN0dHZWNnBaVS9hcUpTdWtZZzRDeDVp?=
 =?utf-8?B?Y2g4WjVGU29GTC8rbFNMa0txY3JkeVlkYnZoZVhuZFQ4V05ObkJ5TlZhbWht?=
 =?utf-8?B?MlYvRERweDc0SHdtMWx0aUNpZFVzVkRmYnN1N0xRcndkNE1TMmJZWGxoelNC?=
 =?utf-8?B?dlh4VEd6Tk5zcmd5eGlsU25ia3FJOWxvK0dYTnJWaG9HYTZtYTRuZ1JOUjFX?=
 =?utf-8?B?Y0lZOEpCWklZZldQeXFvZUw2SGZ2TXl5d0NlYkV6K0ZqREdkZiszcUpZc0VN?=
 =?utf-8?B?QkY1RnFtM09YcG1TVlVBZUVzc00yUC9KT1YyeS9EVnRoUmNHRmNvdGRhUzNn?=
 =?utf-8?B?c0tET1hVelIwU3prWFo2T2owTmNWaWxDSTR5ekV4YnFEdG1EUUoyUisrdURD?=
 =?utf-8?B?ZEFjeXN2enF6T1NNbmlJdzlUdjhrM21rTmY0TzdpemcxRFhNQWNnZW0yRTY5?=
 =?utf-8?B?bnpDVW5SM2lFQXhXUmIvRlhnUWFGUkg4Z2hYSjlzY2FaTWkvc2M5UmMvbU5W?=
 =?utf-8?B?Nmhoc2p4VUsrWmVqdkZ2b2NVM3JVZGU3S24rR2hUZHYrMURPUnY4UGJjNCtz?=
 =?utf-8?B?SmIzSlVLeEt4dG5jeC9saWZkMzR0R3hYcithcW0xOEsxTVpkNC9CRmpiMWc2?=
 =?utf-8?B?V1AwUnNmTy9BeVNyL1VSVDdRT1BBNEZXa1d0ZS9xL1dwWHp4N2lyTHArT1Jv?=
 =?utf-8?B?NjR1dGN3ZmpLWm5qMkVrMHhJMzluOFFXZDlWWHgzaUVIUXFCdVkyVkgyZ2Nt?=
 =?utf-8?B?aFBXRjVIZmZxSERsYytTMG5rZGx6ZHMrQmVYNDBPMTRWRDQ5dXZ2ODRlWUNo?=
 =?utf-8?B?aVF1ZjNXZDJES3kzQVQzVHVJNHo4RU5TNEEzczhFajNaY3pneW91MW1FeG9v?=
 =?utf-8?B?dnF3SlZPaTBGTTJ2VXNUOVU3VWV2NmdLV2thbTZNVUFmNnJhZ1BDSTFnQ0Na?=
 =?utf-8?B?USswS0hZbm9zQTR3cVhsakNYS0VNVWtHQ3Y5dEU0RG13bmNJNnB1N1VQc0dq?=
 =?utf-8?B?VGRwbS9lUS8xRjV6akFZcElGTUdLbFJMZmx6V0dMVmRzeVg3RDFESHo4dGV4?=
 =?utf-8?B?YU1VajBPTXEwejd3QnZrOE9aeVgrZWh4ZkNsNWZmcllEc3dsalVZcTlMdytS?=
 =?utf-8?B?elViTnlmN2RqT29BZ1d3ZUJRTkhqZG5PY3NNMkxNOGF0WDVBOExYd2xDdFF0?=
 =?utf-8?B?R1lwSS9uclk0RHRHTThXMlpaTlNBT0VVTkJRQXFKYlhPS0NENGFkYnNGbExQ?=
 =?utf-8?B?K0JJNWs1ajE2SE5wQzduc01XZ0RTaW9yc0xJaWlmSW5qaVlPaTEwM3RreVVt?=
 =?utf-8?B?cXdzYUE4V3o0aHh1cTFOMVFWMEZkdHovRUt6MXcwcGpWeUxlVkJubFhqY0VO?=
 =?utf-8?B?d3RuWGZjb1RQTkFNNFZFR0F0T25HNVR2cTVDWHFtTDJENHYwT2VFc01GY1hC?=
 =?utf-8?B?UGJkSmlFazZTRzRCdzFQcUJFa0pTa3ZoVVFudENGb2JaUW9lam02ajZGeGx5?=
 =?utf-8?B?VFJveWtPV2pITVhIYkkwT1hQSzNRY1V1aGpjWVUvNzUyT0k0QjJqbyt2S2xK?=
 =?utf-8?B?NnVXbUNSZXN1K05kLzNNVzh0WTFaVnVLeWZQM1dacU1pVUp0MXVDaGQrM0VD?=
 =?utf-8?B?VVJ0RUhPVUpVVE1pV29HcnlRVm9oNmg1VWVTOEJ5NVZSd3FJVlNUcXJ5V0oy?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	meU5FlxzIYhd/2xh1o7jZ0ux0kQ/nX5dYPzkBxyZYPYdwIBBHVhaIYPBy1sOCem3C3sW1VY/hcgwsU86+wY8EH7FeM7dIPqyYp8NZTUAg6P+7jJ502dUmbZmG/QJ9J8B7Zcw6Kh/NPFez31tq6WhHtq+wlgnS25lNuoUydhGqkn66Vibq3naSoUvqxJiOTwI1HsB3MulgnEhixUvmrhM2YBfMcDojkFxZDIjqJz2AtoS15y1bwrCwrK6qRVGGFgKifqnrFYBDioTOvzL2ubNNBa9GzNV2N2coYqNLG+XJTzXO7aEou1gBu0L1jLXriv2+vV5w1HOIeLQPm5pjzZ3bpQapFwD051nqcY9Y1Ivb6gRq8m93IGMidant/xzBtxfRqLi4V8BTxghnNWfA3xc3LZkmhNShis5TUE0rCzodt2BHaM2pCoCm3iVkETydNQzyMPd2Zrh4Ze55abqBeUNPYTHevLw5SAZ5yY0V8AR0KHggSs4ZkC4B8VKmidmi0N9lE1gIqjwV9m2270K4/x3+shSQVn/yasynTJG607Dx47nH/KELgSmGwx5lDUTdSphW1n5A7YzXX8jfcjnr/a7m4+eNvGtq7RE3aPvuwNfCkI2PYF+Dmp7QpTSuiC1IiHrUY/chrL7aGjg8nNJKQH2+oCosv5G0skYUSg6GRpRq3Ha7z6NzMJS+ZnJQzoHVCBtnS/Mq+5kk1RXta5h7ny/hNhLyBlUVyKys9CZ3MgsBJtgbEwINpQECCQwpswDiOayE77xjWOtyu1daK3AguRIq+jDFGKvkp4a4xbbenVZw6FUgBBaXyrvYTD9c03RvleS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d380da-b8d8-40d0-11dc-08db2bc65552
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 17:45:04.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HT8ooJA7ov6zBgp3QNMX54z2gMoYecRCh3idsddOzBKSerB28HmUHjMcRozTvtXrC6/laQ5QZVxwWwlC9qml+Trh9Yv40qAlJArqyNhuD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6082

On 23/03/2023 3:40 pm, Jan Beulich wrote:
> On 23.03.2023 15:30, Andrew Cooper wrote:
>> On 22/03/2023 9:35 am, Jan Beulich wrote:
>>> +            {
>>> +                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
>>> +                     && (oos_fixup[idx].off[i] == off) )
>> Given that you mention style in the commit message, it would be nice to
>> move the && onto the previous line.
> Sure, done (and there was a 2nd instance).

There are plenty more.  I just stopped reporting them.

I guess if its "just" whitespace fixes (newlines, rearranging of
operands/indents) then that's fine.  Everything else can come later, and
there is plenty.

Subject to the SPDX tweak, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

~Andrew

