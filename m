Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF03748657
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559244.874068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3UT-0005t8-MM; Wed, 05 Jul 2023 14:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559244.874068; Wed, 05 Jul 2023 14:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3UT-0005po-It; Wed, 05 Jul 2023 14:28:21 +0000
Received: by outflank-mailman (input) for mailman id 559244;
 Wed, 05 Jul 2023 14:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH3US-0005pi-Cm
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:28:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e464450-1b40-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:28:17 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 10:28:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6685.namprd03.prod.outlook.com (2603:10b6:806:21c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 14:28:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:28:12 +0000
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
X-Inumbo-ID: 2e464450-1b40-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688567297;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pf/gHzsx5bmWAJagMTYZaeU8AfyOt/R6BMeRi9EEGZk=;
  b=hTvsOyikDV44klJIWLvFO/rJre4neo8I3MU8KuDs7Sm/3p9tU/XmtgCK
   I8ZXi8skfg9pPh4XJ/3eLdGfGp41fOAhHwMs77SWv8ex+RyihKfw32DK8
   UNtanJTzRfzmCxAnEvflc5/3fvFqu9+FFG1wEVPTyuso4bLbq6nZmv4sG
   o=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 115654408
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SpqrW6Ms+pVSp37vrR1llsFynXyQoLVcMsEvi/4bfWQNrUoi12MPy
 2ZJCG3Xb6qOZGr1fNt0a4mz8UlSsJOGnYRmTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5gFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tcsBWJjx
 9wxFD4yVQ+/uOeZxbu4R9A506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxH6lBd5OTO3QGvhCpmep6nUWSx8sTEqKhdOCikuDZdFaN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAcKWIAbCkIVwxD/dDnpIwxiTrEStF+HOi+ididJN3r6
 zWDrSx7i7BNi8cOjv2/5Qqe22LqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaL9l8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:Yn+wM6D0TAyUo8nlHehnsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPHjP+UYssRAb6KG90cy7KxLhHPFOkPEs1NuZLXLbUQiTXf9fBOnZskHd8kTFn4Y3uM
 cQENkbebqAaykCsSvj2njcLz9K+qj7zEnHv5al854gd3AUV0hV1XYLNu/XKDw6eOEAbqBJY6
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbcbRsPF3ccmUGzZZ/B0s+NL/DNtC1uMQ9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDLNbksLlWFhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nLqeH2vqxeF4Xii7N8X0Q6m9bakuwqjnSW5fkN1NyN5v/MXTvIN0TthgDl+uJ
 g7ll5x+aAnSS8opx6Nk+QgZysa5HZcnkBS5NL7r0YvGrf2O4Uh57D3unklXKsoLWbC84YgH/
 BpDMbAoNhrUX7yVQGfgkBfhOW2WHI9BxGHRVVHnPe0/Xx5oFBVpnFogvD2uB87hcoAol1/lr
 35Dpg=
X-Talos-CUID: 9a23:/0ppKmw2ZNZk+5eFR0gUBgUlQcQmX0/95UveHHSnNVlsZ7icSlKprfY=
X-Talos-MUID: 9a23:pKv8CgvfPGd0lp8v3M2nogtYGN5toKaUEVE8tb89u8y5Cy91JGLI
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="115654408"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUBlQkeDqgJvFJ6IXImmBLeQN4W+hEbZ5QlGDkxLVfbAw+1susQE/jF8OyEuf7qRjaP8etpbjXkEodKd0c02Rd917lJFdsBidHy1Uyo6Qly4MFt3SAdmchoc5p6royuGUHTTAgQdMH8j+A6mcctv5q5PtX7A7dqfj3MGhL9GnnQKlZ+InR86pFfTToCmghRV6YUKHt0Wzx2VYigwoPCoCmPtuiFU+lEVApzCH8uyi+6ZGxyD1HsrXWGch03AtdrM+WF8Vqs4IqN+qFdb78DZpYF1Q2OqeYUyonxpZtemRLD8h92OnkYMi/B6bhBU1XNmtq3lv6PCFVophs5v+sezBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6o5fL6QH4qo/QG/Pszbms0PnXNz92j6WRyXhSYHkkw=;
 b=f2E1wLIv12gA4cxlUpLFNpynvUZeaOc0OOuKPuWC/948Ry2AvseoAS4snTmDygKgfn1kWMOfkMRvXyJIhJunwZN7E9vp/9dzch8ui3UICq3EFwwA8FiOByM1qmKTrpWLBuEGgiZI4EdGnPLcyl7zIkPW6SjHylRQz0LxXnL1CPpGzqBkjb8Mf98OSHUt00V4aAZcSDvUCIJCb4WTm1O7cM0c68achfTa23/HuUIhbx/2GxBc49+PE5XHTKwOzAidYtRyR8aj9ukEGFJv63XEs4TrKj4URbCgHGsNRBjYEOz6R7hDTtSFEG8yUNJaR40z1sjO6mOUX/VTiaT9Ka3TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6o5fL6QH4qo/QG/Pszbms0PnXNz92j6WRyXhSYHkkw=;
 b=i+lBqfk77d28xJAJgeVdPpRvXVeSt28hg9dlI2V/C91djEGfxHgFPvnxvl7K2brG1f/0NJUEtQr2fh8hEQG35937YDwZzyMVpc1UUpQv1OfgOqvPOJRBD3qC+KP2aOLMEsvlTSrlltpLd5YcTjUbKeynkooxxNY/3+DtoNKkicA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ea4bb2c4-a099-0d89-9b9c-fe7ac8ffa0c2@citrix.com>
Date: Wed, 5 Jul 2023 15:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 2/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-3-alejandro.vallejo@cloud.com>
 <d498ba69-564d-8232-5f5b-da52050772d8@citrix.com>
 <33af8ca2-dc65-0167-5569-c35744ea4f0d@suse.com>
In-Reply-To: <33af8ca2-dc65-0167-5569-c35744ea4f0d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: c405e285-2f36-479c-50a2-08db7d64102d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fwisbIjP/wTISEPjLF+qWiNKV/BJH/P4urNkrqDHb75fmFUKwTi/9llIF7MGqBKTE1pQWyE7ti4kH6VPu4lU2zn4JpI8r2zrB8IbcOHHlUuOw9zB4tJ0KpIRX4HiSv8wdDTtpPO88Es08yVBqQmTPQumPhs+i8GygBsesP5jeUrdvPr+UEr12hFNYgqS+PnNAsZWJP9bKkOGXPJk7i+dt1xnRS5lyAYdKtANQ587L9AtIHkvCq/OI6Sc6NBgl9I2H01ajTgBemO+epA2x7L3nRAvoH6J47rd/CrD9HUUR4PKxJ+q/+j54wfCAD5vO0hS+1Yl7L5H+rjvl6u3fx1ryzgN76ryZ9qUG36ipA0UiW5YH/KjyejQXRYDBkqElvhhAjDmYpgJ7aRbZ0QqSbz5ue/js87pZZeVwcBdqm3haWKxoGET7NQg0RhcJgqXy+6huYvap3UcUA2JpdmGtgJ1+lFNZ9Gz72ypRPuC9bS/w3uGW5lHehW9A/5l6c6Hshll5Spt/DcX8g21K3OvmfzS5MIq/FPu5UIgwVMFsNw97/7tZgWFcV4guDROtzQ8QiyMWnpBeua4z8kC5vSrgSB/gbGWwxg+NXGV7fxKwyix6vrfgs+74RqZJS7V2586mRV6bWCVErceyTbsyRWI9TkYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(53546011)(6512007)(6506007)(31686004)(186003)(8676002)(8936002)(26005)(41300700001)(6486002)(2616005)(83380400001)(66946007)(478600001)(82960400001)(54906003)(6666004)(38100700002)(66476007)(6916009)(4326008)(66556008)(316002)(31696002)(86362001)(2906002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWZMTlNaemhiTTNmUjY0TlZDTGtoR2ErTzNaTkp1YmZsN1NvbWlqQk5VZDBi?=
 =?utf-8?B?SFZpSWJtQWRRUTkvRVEvc1VDUk1IWjNLTUpqWVNiVHVDT2VLRmpXYUdpQXFO?=
 =?utf-8?B?dk1CRHpxVHk4dU5NWkRFc2Q4eE5aR3plR2pwT2xad1paQUt0c3QxMGZEbm9N?=
 =?utf-8?B?NW1iWlFtVHc4Nmh0UFM4YTZTai9Rc2p4VFlpMG9ISUNldGVCRkEyR0IwczhR?=
 =?utf-8?B?N21tNFZJRUZhdmsxRnU4V0pmdUNQYUpTYXBOSkFmbkNrcVk1MGtRcVh3N0V3?=
 =?utf-8?B?Sy8yb1hXeXdSK0FoNURQQXV0eXBtbVdvbkdSWFZqUW0xK1RsRWNKR3JjdmM1?=
 =?utf-8?B?dFZCTy83OGdmZ3lsZzVUSVpjcnlXSHdBZXBTS0cvZWV6VGJBYUQxd0FMZjRD?=
 =?utf-8?B?OUQ4dXdCaWQzUGJHL0N0YXU2bFBGa252RkxhNG4zRzlETUUvekIrMmJKUkMz?=
 =?utf-8?B?S1RCWU5sRncyb1JUY01WNXFSQVp5NjNhZnZsZzN0WDAwdVlQYVVZcDFpQXdR?=
 =?utf-8?B?Q0VWOUZMWHdNejhWMjJLMS9vVmp4U0o2c01wSHJOSHg0a3MyV09ETlZGeTFT?=
 =?utf-8?B?QnRGdHo5M0xnaHI0LzVPNWxobFY0M28xQW10UnZwaTc1L09QS3VyemgzNC9t?=
 =?utf-8?B?Z3IvR1pETWRIZWVyM3kycXpXbTRPdjBhYUZwaHNuSm5xQ1lpeVNEeUJqWGFt?=
 =?utf-8?B?Q2ZqSFY2NWt6enF0SlZERFh4SlZaNmJ0U1VEM1l2ZWVQbGE5NGdkckRCTXVR?=
 =?utf-8?B?ZndwQkN3eTdTY1ZFb29VYTBaSDEzWFpKWEZFQmpWYVB2UkZWSDVwT3gwam9J?=
 =?utf-8?B?Vm9aUkVQOExrZ2VsVjdZQW1MK0ExemswUHp2a3licjlaWm81c2N3TGNLUkgx?=
 =?utf-8?B?RzB4OE5IR0p5MlF0SVB6VzN6aVd0RlV6a2x1UzhTT291SENYNXdiQ01VUURW?=
 =?utf-8?B?L1J2ZTNGajVJeExCVG5VTGx0R0tIZnhleGFrTC8yY214QkVKdTJCTmR0TjBV?=
 =?utf-8?B?ZnBmclE5VkZxNlVOdjVNY0RxMEwyNjQ3aUNWdGpoOHE2R0dlcVZvSGV1czhi?=
 =?utf-8?B?ZGlOT2RqZEs2bGZSZmNHOXNlY1hGYmNaQ2JScE5mOVJwT0ZWemFzc3BIZlJr?=
 =?utf-8?B?WWtoUlJlN2VUS3BMTHlmanVXUFNTSmZsSHVveTFnSHZBdkdJSjdncmR3ajZa?=
 =?utf-8?B?eWhDekhoZUJ3SFpKeFpTeWgzSmhrMktwdUx2N25pNENTVStuUnFtdVBqSHVK?=
 =?utf-8?B?THdlRkhtOUFrTStvS0hoVWtCUlp1bjF0elNNUlNCc05vRFhMMEFLNkdmLzQy?=
 =?utf-8?B?ZmZPZHVDSmI5dm1Ndnl5eXpyMEw3ekc0OC84bHFIcGYrcWI1UXU4WkFiaDU2?=
 =?utf-8?B?Z216TGpKRVJFNVllNjhFczNYSk91VTRzZnN4bHpjNXllUUpuZXdmV0FBZGdx?=
 =?utf-8?B?am16WTJnRW1kSjhhVUpmMU5FMXlJVkhBUzRYcElMeW03YjV2YXFERnkzM0sx?=
 =?utf-8?B?S2RlTXAvRHlDMC8zM0xDZXZDWXhRbHF5RExXdEV4d0picGQxY0loZnI1cnVS?=
 =?utf-8?B?Wi9OclYrSmFkRmx2SlkyUEdGc0Z4UGpycWloSmFNUytSTmZRaVFhT3MwLzdj?=
 =?utf-8?B?QTZVd2crK21Ed1hqWFVmY25ncDVOWUc1Um5QY1RzRVloTnZhMVB5WUFtbnAr?=
 =?utf-8?B?aXpXekZiR0MzM1dUMkd3K1NpWkVyVFZwSldzQVQ0MkpXbGE2RDREREllMnpv?=
 =?utf-8?B?RE5pQnVKSWF3WnBWdzJoTEROVFhGYWF1OUNJMkZaOW9CNzlKYUtKdm1UV21i?=
 =?utf-8?B?Q0k5UWRDc2RVZ1hGb0FqS3drNzhDVzhnY1ZQblVjWTZuWnRWLzU5aDdPUjFp?=
 =?utf-8?B?dmp2djlpVUFMU0pROGx4MmdOZDdhZEpnZ2E4OCtnZXVhV1V2R1JiTHlzUEZX?=
 =?utf-8?B?ZDdmWEt4QmtqaW9ya2kwaG9nUjZuejJTMENtclRpU21XRmZVOEpXK2ZENERR?=
 =?utf-8?B?Z3VNZ2xBaGpIbW95U2dwdnF3ZTNqdXJxWmIrRGQ5amZZRktka295S2JyMUVa?=
 =?utf-8?B?LzRPUnVUOUtBMXRmeXlKN2VqdzdtMUNlTlkrL21CN2srZC9uM29JU0FrNUxl?=
 =?utf-8?B?RGNxZmhpNmdtVldiblcvY2FxbXUyMCtFMzU3UCtHbGNtZFNYby9OVi9iZ0FN?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sZcGKmmz+LnDpF4qpCebg0XgvATAQ8/5qbbcGxSEBCSXnTqXBdVv810rJCxqItDChlmMp/kfcc3JnPK6FK1Xx19vsEMrfIkM1eBrY6o/J96B2mz+0lrZoxgPV9OTRMEq+E29qzu9yKYzLWHqfVXBfHsY9J64dVCRROMFfVH3/lwnJ2/rS6ouKrS+vEYa0gMoSkeKbpkQs977CnWaATO6BcO/nrg42R/e1cnx8439CB2l5VqqMHqzzfWFnsKuJuAvQT7iKxHpzpgApEFIyzqEhaWC8BCOf+Z1TybrR7x35JBF75QsKZD1qBHGTq+pCKCAYbKZNlkku04mJCyJBxX+EjUYDgAT3cTgk6LOBIPyogRvWu3P1n8MKQvwE8Z5+FcH04Hjg4oSqsdzf31szjI9s+PngZNa0A9K1HMm2jQHDKXlQTUy4PXyRoi0SELlRBEExQWJkK6LLNYDtk+eQELAToMzZbx2whi2COQE9OPkyjWHeOXCbEyKubcMRpcd5NhK0jaewpeejIxvGCXa3G0RPjQRSRjBxrcDVKkK/SNSeivmmuhwuaC1rexNGF3772PDqU4mphC3lmE6JavmXn5iR3uCgw11HNneiNFJj6jnLHq13+hgt5WGZGlT5cewXDM1oJq79gZCRL5Y0tTuNjBqgAl8uemLO/Y0qKngl96api1N2PdeR/BvccGvV0UDxiyLZD5wEQuEk/BWr/U+mqoZ7VlAzOTeS4mRVcUPa3Vbnr0Ik/gnQIDgk1UEWYMee3jTvCSch6vwLJtPR1yLtWEAmQm5HCYiTC1KfD9i/8RPNp/4pihrDPWLOCT0rylvsHCRNI1dsukhXO5Hq/eLYRJ7jHfwONXjcpk6NvA0LxLGkp0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c405e285-2f36-479c-50a2-08db7d64102d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:28:12.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFGKu2G1XMYJiH5AhB4LZooRz89mZ8lGULHf46hFPzIyZbHxlx8G7z3I2IzKTEWKowm32QKwZn+V6zXoqs2n1i3WULJ8YX5QqSdvslEWhRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6685

On 05/07/2023 3:24 pm, Jan Beulich wrote:
> On 05.07.2023 16:13, Andrew Cooper wrote:
>> On 29/06/2023 4:26 pm, Alejandro Vallejo wrote:
>>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>>> index bec8b55db2..b620e3bfa6 100644
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -867,10 +867,22 @@ int __init early_microcode_init(unsigned long *module_map,
>>>          return -ENODEV;
>>>      }
>>>  
>>> -    microcode_grab_module(module_map, mbi);
>>> -
>>>      ucode_ops.collect_cpu_info();
>>>  
>>> +    /*
>>> +     * Some hypervisors deliberately report a microcode revision of -1 to
>>> +     * mean that they will not accept microcode updates. We take the hint
>>> +     * and ignore the microcode interface in that case.
>>> +     */
>>> +    if ( this_cpu(cpu_sig).rev == ~0 )
>>> +    {
>>> +        printk(XENLOG_WARNING "Microcode loading disabled\n");
>> XENLOG_INFO "Found microcode revision ~0;  Disabling loading because of
>> virt\n"
>>
>> It's normal (and not a warning) when running under other hypervisors,
> Except that INFO won't be visible by default in release configurations.

Well that's not a bug with microcode then, is it...

I can't believe I'm having to say no to emitting messages at the wrong
log level to work around a bug with selecting the default log level in
the first place.

~Andrew

