Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31904697BBE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495948.766411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGuU-0001FE-Ma; Wed, 15 Feb 2023 12:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495948.766411; Wed, 15 Feb 2023 12:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGuU-0001Cm-Iu; Wed, 15 Feb 2023 12:29:18 +0000
Received: by outflank-mailman (input) for mailman id 495948;
 Wed, 15 Feb 2023 12:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSGuS-0001Cd-TD
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:29:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ac2f6c2-ad2c-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:29:15 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 07:29:12 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5331.namprd03.prod.outlook.com (2603:10b6:a03:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:29:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:29:09 +0000
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
X-Inumbo-ID: 5ac2f6c2-ad2c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676464155;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ydKYQz6wsFiKk+yQbmMFbusFuaMJ4ekHXQDndb0vSoc=;
  b=Qqo7iT0XkTksO15ZKKs65LQ3quOaCRiHxbgofKkPLEYMxJNE3XV6y40f
   ALjcSCD4rAFVf3jTnpeiwmNL2Z9HnaQJr5qYIZUFl2fVEPVxwkA2eZyvV
   1fntNvIUVqt4FEpRgHPZU1/FXrhT4gzvCVRkS8RBeoZmU8bvUiQ9C8S5W
   U=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 97543636
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2J7W0ayTSk2Ecl3kwHx6t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 GZOUD3QMq2NZGf3ed9+Odjj9U5TsMLTmodrQARo/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV1O7
 fozCR4IVSCom7mK0vGfEedUoe12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqB99OT+PjqJaGhnXUyXc6LxYsemCRoKSZlk60YNNCc
 2gLr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOv8YsSTsn/
 lSAhd/uCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0ophfGT9ImGqjqiNTwQGn02
 2rT9HB4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:lMMHNqzJKhfb+w/iEikKKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97543636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCTqbNqb3LmUXQEDhDZpKTwCLGPTZsE0vweQjlhn1M1wnyXKEWJq2Vs1LNlf25aLgScYgwa6OYXz9qJioC1J7151DZt+ngmUdVGn6Ew4+T5BJoLUvptDTFVj9hBjYCfHA7D4V6TsnFhwCMN/CAdVZUP/W8S3ig2FeBLXSgmUdzvcrDrPhruIA/Xs0mYtVe2VyeA4HP7GnNS0Lvyka6FRgT+NAGKMCLUdzbCtzFlYyq0ajNHVMIjw+szslD0BH4txCGFCv/fqoaMon6E3s23XzDwN/MylakFDsXAa6xMzH8iz4NIyZlHzWjrAG0h/KnbaBKuIFA+byy0/cb8wCNurIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydKYQz6wsFiKk+yQbmMFbusFuaMJ4ekHXQDndb0vSoc=;
 b=UuxKQJsJKatwWRoNvtf2aultAR9H+2D+vlQDoRp7jln2TSyo/s/0a2VbOmNpbScLoJxzHd1fCG/UYnJ0bVj1ZXCREtK+pVntKXRQujX1t4B6boqzU1uIilGG7xTJQudrz2KL71sN7HCL8XTmxBeaS8w+LNxILn+wzBxmzDUgzV+DEHbZRuCyWOcLacTRWqJoXbGYyH0Ztxt8fhfHLbPTtPPwWxgpK25esMp41qX5CDoP7xPuWev9koehNO8RTwFAZ7C2M/d1EKIfEJWq5wMnXmDSmmplY2a5dByN7aczaKxE3rwNSdKiSc+9keNC+AX0vDWE1T/3i6Q7bLtRguwxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydKYQz6wsFiKk+yQbmMFbusFuaMJ4ekHXQDndb0vSoc=;
 b=EwCyFT7RqVVwtXzHavy9Ff1ayg3Q+lhBTK2KFM4hLmlxNhrgjQHprvLEgyEqLVrgF88DmTvq1QrGxVAatrRZhPvMR9eD73I9TT+VqmeA+Z1XDtaRUSXrjAi4HpwNsqZzlZzlIBvClR00wX2HD5jRzYYuDgUifPM80D9hhj4UomM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <946678c1-1877-fa4a-42d8-b55bcdd1dcea@citrix.com>
Date: Wed, 15 Feb 2023 12:29:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH 4/4] automation: Add more aliases in containerize
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-5-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230215120208.35807-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e18d6a4-eff6-446c-6fe6-08db0f503c78
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BR/CmUn3/dIPYZ5kqzTrVdtlt4+uwuV0NiUZu5O0+HKYnuvEYo1oxhXzSD40spYDgdEFvZJmTx19TjF0Xuv9tzFgwbkpc0RgWCeKeEeIPUZ+mEQu2HJLvVd4UoVzPIGxmwUfiTmSYLO71AVEYIuaGHM1yjTlXtaTgMM6p9NbjlqA6Nb7VExHaF2k05w25Lkr1rHXtSTmg60MDw1RDt6EMzdKvxdlTIdoktJjl3tAGDwCDM57KytD3YcdJWDT8EYXcmK1+g+HSmCvokdM5/Cod68STkX1af6W0ZBjiPF2eKJLsiMXvy0Ojj+B6pIogRlANPOqjb035AvRpiNQ4yI8vIL7Z0L3oDiU89Hx/e+ulUX72yWSXJBpynRsGcongYjmu+MSid1z/oG770SvdUPDbrWnaYF8eU3siiZ5PfJez4+gVER40NUU2nH0ESqN3IbCUTG7IEu168nFbJHM6gRWPiUn/Bn3KPMKOftCCAPt+mtz2XicbyQ2cKpyfqNUOdKp6hSeVnBJQ09Xsmb4mDv2gWcYja6ZeDKszzGSYtOFMhHiKhQPgAwQ0LnhSsK7qFGGwiHD9+DG+Yh4o8mTdOnik3/y3WjPzuCDzgusJAkAiipAoZT1NCpMXWo/0s9DogyCF9AMhEzaPrSHyqyGUNy1xPt6ZzL0ZIG/RF0kPBb+yloPvWDCcIDb20DfWNXen3jVBzaPpJC2EbgmcN6aaIm43vHVjYI+OSkCQ4ETdgwemIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199018)(41300700001)(31686004)(36756003)(66946007)(4326008)(66556008)(66476007)(8936002)(8676002)(316002)(5660300002)(54906003)(6512007)(186003)(26005)(6666004)(86362001)(82960400001)(31696002)(478600001)(2906002)(6486002)(2616005)(558084003)(6506007)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjlMZzNBcmlCeFdhSWFYUWg5REdtWlN0N052WlFjeEc0dEtIblBuamh3OG1m?=
 =?utf-8?B?cUFwN2lpdC9ETzg0b01wbEJVaGdJVkNXbHNXKzJ5T1pWdzRUbmxoMjZJZVhR?=
 =?utf-8?B?dmp3bVNHQXNxV1YzQVkwTVdlN0ZsdXhjcHBBQ3hEODY4Qzk1R3lTZ3F0WkFC?=
 =?utf-8?B?RzlIcjJ0V0hhUjcyNVhJMXRDZXdKVmlVT09FN2lYbTlKTTFGakJYU29YKzdK?=
 =?utf-8?B?VFJWcDV6ME1NaVkvNUowcVl5YzdmU2JzYStCTDIzRDUxTlJCNW1EMDhlTERm?=
 =?utf-8?B?c25xMHhQL3BzSExUSzlYTjRLdm9QRjJQa0FkQ3VHMFI4VWtIV1BiZGZYblM1?=
 =?utf-8?B?Q3h1KzRrM1JGOURROEhFd0NjTHp2WEtYbmx2ZFVYaWYrcWlDUURJSFR1MVRP?=
 =?utf-8?B?KzdtbERvSWRxNlFaYnJmRjdIVmtZekc3Tlo0NFB4UTVmSnJLRHAyZHkwSHVh?=
 =?utf-8?B?YUVYamRGdGlRSVg3cllIRXFHOUQyTVN4M3ROMEN1VG95N2R0WHFGOE0xSXMz?=
 =?utf-8?B?TWxWZFMxcU1keDNhRjhVL21sYXF4bjNFT3pDN3BoVjYxbVBHczBBTWpFRVBC?=
 =?utf-8?B?MVlaeTJGdHM0bmFUOWNBZEJkOHJpU1dqZ1NUQmR0K2crM2dUL2VSWSs4YUJT?=
 =?utf-8?B?SEduVnZWZ3I4ZVhjYU1wZFloQTZWUDBZNGdENFJrdFB3amZvalBXTTlCb2l6?=
 =?utf-8?B?M2tERGJ0anZ0eVBsVGE0aHladWFSVVFoTlRDVUcvRmpmNlR0NHk1VGY0MUxY?=
 =?utf-8?B?eEdBUEVVc1dVNEpraVZTdEk4M2MwNndMb0FoT1cxYTQyazFDajIvWkROV1g2?=
 =?utf-8?B?VjVVMys4MmVGU3BIWkgwRytid0pyeUpyS1FEUG95VVJ4enVJRVhFZlFIblBi?=
 =?utf-8?B?YkROVmp2Y1BuU0l6TG5mS3VYVW00d2cyaEZhYWcwdmU5dkw5TVNML2MrKzBy?=
 =?utf-8?B?WFlPTVYvTUJ4RnIxNkxZVmtielBPbU9MYTlQaU90UUlYcnd5UTZXTG16Yjh6?=
 =?utf-8?B?ZFhaa1c2dGo1OEl0TEhCeDJwaG9OcjNwUjFSdWVCYWVQd3VoRGZOZU14aktH?=
 =?utf-8?B?NkRRdm9SZGRTaHRtL0xEOGsvTHJYRE9XejBHbXZTZG5vcVE4ZkV6TGFpSTVR?=
 =?utf-8?B?OHpGMlZPOUJEY3pTZkdwZXlKcmZyN2JTbjAzQ29QeEtqd3FmdmxrL3I1a1pI?=
 =?utf-8?B?TTRwRUhGdWVxWTZPQlFXa3Y0OWxUMFNBcklxb2dLQm0zSm1RbENwV2d3Q28v?=
 =?utf-8?B?cEhUWmpoMjJGNjhIMXM0eGgwblFLQ2l4NzNKTWh3TnV1K0QvM2l5MkMxb2M4?=
 =?utf-8?B?a1VBZnJDckJTc0ozN05SSGFOdE5XWmkvYVplYUVhbXhKU0ZlUWV1b0hPc1pL?=
 =?utf-8?B?cmtYbVBVVWMxVjdKbXVKbnpiSGZBTTJtQWRYTWU1SVBoOXh4WUI2bFpMekNE?=
 =?utf-8?B?OXJPam5KWFR4c0JyaHF4aDJic1RtdW45RjI3b1BlaHNVbnp4M3R2azFOem5V?=
 =?utf-8?B?c0Z2MGQ4bFZ5ditkWXVFUmRJc3VjWThid0xUcTZaTlY3Z3c1OWltdkFyTndS?=
 =?utf-8?B?YWJIa04xM0srN1RwQ0dBSUNWaWVFcFhnL0ZKU1hkMEFpMVJkc3RkaDdGNys2?=
 =?utf-8?B?aGJaLzlOalBpRnFKdDB4MHhTT1kyRzlSQUFUcWpGd2xZM0lIcFdjRllITkFj?=
 =?utf-8?B?Z0w2NjZFZlRmTFp2QmNUODFScGRsbEtCNXRtRVhGY20zeldxais0dndYTDZY?=
 =?utf-8?B?Qjk3VkZ3MXAyTGdaanZXL3lJV3RBMDFRZ2Y2UWhBYXR4dGhIcVRMbWNmb2dN?=
 =?utf-8?B?YXBSKzUwbGpVNDJtblRjNUlZVUFIUHMxUSsrVUtjdGlON0c3Y2E2eDZqUE13?=
 =?utf-8?B?VGFYeWM5cmpuOHk4aFpTME5VMVpONnltZDJHTE9XQUFIZ0p4OWN3a3o1Yk9D?=
 =?utf-8?B?VitjV0o3ejQ1cGRIaWphdDZReXhiOGJPWXhKNEdHWEhlanNsMXZlQ3dlMnhF?=
 =?utf-8?B?bjBmOHBxUUFJTzZkOTN3MVhNV3pTU3d6OTdDcHNVcWlSN1RHcXpyOGNCdElv?=
 =?utf-8?B?NWtiRFpmQ1doS0c5OHhEcHJGQU9HVmJTY0U1cmQySG9uWVNHYUEwOXF0ZGhn?=
 =?utf-8?B?aXNjdFVQbENVbldOWHltQlNacCtYL0tDK2dlU21BVDJFOENhc3JwKzZGVjRF?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ojKXYV86jKZ58Xrg4x93Ghqd/yZaiUp5hLkYgF6/px8bCiyjQpodHo/uehZfN2JwVrzAMQAlz5mycuxdAbJUmilBtV1OQjJuqYGAHU2VJ7dOLL4/RkZDj4s99xKcFavN796cM2RisoK5VLhs3SI9ynrn2LUS9zja+wc8gOtLNul0SRpGqZ5e4dqsZIpIEAakwLH/6VMRJ35nnMG5FUVZDQaG7wCcVOmZ4QQ4dpaQ+jX6ysPNMo2OqADBwGF/e0q2YNbDZhOXfjboOhIODKNoNJdAK9lDhVXYJKNsD04MEa0x8c3Unb2N4lQGQT2O2pqXIBU+3G1xB0KHWyaw0qrL7Y1jg2dusdjZeKU6/yCrVFiRP76muXrhmBsp3+AVzPEtzRXf4cwSHutbnBj3g+OgeebUBnrmINDHCgxKnT7EMKN3oa1jEG14xJ9DkUT7Qwn2HM5PvbsLlpod5VZE6vxRY9jmtDzyzEZsOTFIhSpuB7S+8rqyYicldCcktxtTrsCmk7TIBTmRlajIKtW2CY33W8oev+Vqw7a1vpF/dRfYY7dAqQfAq16nsbDzyexVDYBhWf+wRoMSvKhVPZdtlsApuvWshicsVfdhHP/L3XMQB5BcAtfB/9i2CzOUdvIMkEFZZH2zLkPaOkjsX92FDPdkJKNnSD3tQVHz5pQSsA+ErPwET6TFElxPIyRQboBt683LAwlxh8hODCMapdjmM11ZVwC7rzy8qFS0EgeN8h4gV4L6DiYSr0SPaDeEs8KeuhazZ/GfdKHuXeVxJ87ixO5TAgkQlTa7QFoKFaW0TPOGgcajOq5Gl0J7tOmfATwu8AMOPh0uAjgDk7gqsCjuMahN5A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e18d6a4-eff6-446c-6fe6-08db0f503c78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:29:09.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ys1BNkIFKBezrGwXqjix2Rvx5mqzsKRNn8rXtDC8StPu9XX2qrXghePPuXOMV9ehWj/d1RVGkXduUmnkmOU9QkmllCHAY1AhbpcuTPCrlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5331

On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

