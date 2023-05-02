Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CA6F4076
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528428.821558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmj5-0000Cw-2I; Tue, 02 May 2023 09:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528428.821558; Tue, 02 May 2023 09:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmj4-0000AG-UM; Tue, 02 May 2023 09:55:14 +0000
Received: by outflank-mailman (input) for mailman id 528428;
 Tue, 02 May 2023 09:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptmj2-00008T-Ui
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:55:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c208b24-e8cf-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:55:10 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:55:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6991.namprd03.prod.outlook.com (2603:10b6:303:1ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 09:55:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:55:02 +0000
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
X-Inumbo-ID: 6c208b24-e8cf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683021310;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qx8TBmHioxfZ2IfV9j0Zp8QCJ6YrR0h3CkbpgUxzq70=;
  b=JS+WQs+LbidtxCcsJ5tY7QIz6WnKSAi0lDgPaQ+YYAd9pPyZeQsbuHhr
   vcAAWm1ByQcXNdin/9yXJdGNhwmdITtPKBonFfERMbpUt4Pee+4FtRj58
   R1FYSJmm8QW0fKiLNqCFik+PlqZGe7184DvOkE4XcP2fA0/45BZkIRIsY
   E=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 106310059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XROsWaC1SrjXiRVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApGknhjNUz
 GRJWm/Sa66KazGgKN1+PdmxpEtU6MKDxtdnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxN1rWk5A9
 scichcRNjKhvOWs66u3Vbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXw3iiANpPRdVU8NZn3lKy5lMeKyZMFlfgheXolkekSdFAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEY8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:h0CH5aFzSeLJsHu+pLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3AlgQC2Gpg1kzjKD4tDjd2qjrmUf4ebibywnTrGRW?=
 =?us-ascii?q?fFT5LaoaSU3SJ9Lwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEU0i8w7lQPPbA/lIUrOfdMWyxoxlvauPKH8Asq5?=
 =?us-ascii?q?c+MXfETAhJz6HnjeoF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="106310059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge3XFzrOvjkaLOW5CW4t4OqEigzFSal0wso+vq/m4JXn4iy7VGM7L4/JeTvePz9wFYlHCQCDHE9fLABtjN4GCDPZaJtoFNyTyehh1PwlCirpWzXmo2k6mZN6wKXmucDLBeEE3lBdoa+8HkTrPacMNGPfstxh2hWfp6XbJB5jmyZWvIIK/Zecv9jY3PNOwdNEhLJMBxI81m+KR3pYDnlsSQyy6lhdNw8m7TLMfrGu6XRnz8GG2hUuxt4SwhGOI17kVwXs3NnxJJdp+NjM4jG4xo/PTAyk90upn0Ll62CNpcz2ru/WiQp+r9+EZz9QZ79PXre3aLGYCHeLdTnqeLTX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCtsbvuU7CzsbkqhJiHIMYUbXQSCF59o1g4jgrRizI4=;
 b=X4Cn1rGD9hcYqH7l0QlbmOgFeP2G9nDUMhCYTXhiLF7tZRpFTeRm1xGMdZJFjpWszCB4bVmuaHGDAVitxyEqv5lnnupSUuzivct2hzKQoid55nye4OLTpDaoxikRZlRuQ3oJ7lEVdMgGcj/mMBOmOa5WJtDHXN+HO45W8ir5SCbM52RK8ZBuRqYdWdJgongZDUFB45vv7Eb+dWwZ4GpPT9Z+9C1prLUTs5ACIp5ELSbXXS1D1GAkfD1h40a7aQ83WeVdwMC0TY1ouJi7mDDX7v2O0A57KJqfHx9oXrBChpLarN+XUEr0arWdQkbKSjwaXBsyU7lMurkT8u7eLVrNDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCtsbvuU7CzsbkqhJiHIMYUbXQSCF59o1g4jgrRizI4=;
 b=mn3KEX+Gg4/7NnmdoKU8rM9CoDuV9uphxS7K1/0k5an7Eeujhqkr66OpMJZbt3HGQFgNyY6RMeYuymWtyH9/2cj7LHW+A8OIIloIZAGBPpi3J8CWUKYL0KOEb18qrtK2KKPEFw5wIKKF0QPlGwqxH07S+UVJbY7/mv3HBBhZqIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
Date: Tue, 2 May 2023 10:54:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
In-Reply-To: <20230502092224.52265-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ad664f-73ad-4be4-b6b5-08db4af34c22
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pmGua80B08hRyH53Ko8JNGhgKHDeitU/nI6vzr469AH2pGc/hr+iV8sa1fVBOWgzJl0lc+5qIgvIaVwNRS+ILbfASuQGW+jIuoB2gTB7gOfPDuwUjqT5ZCC+m9o2ZMojn3HMVRyLNSZbJ0rd26kACkhVVQsxsjNJJRJV6z1dl3nqST4QokuD8rz8bs/Cz2Disygs6wsSB2Zo/9gHTXgXQfinIgcltsGBpnZr1NpyrfIMEFHYhRsb1EVTXnsX8FgXF9BEQW6Wl+N7EO4qi2qsTc0iNadcV9ov8DrPbQTyJh6ZNeLDdCKSlyv9XblIsoek1/5FbCZDB8ux+BbXVWf1XLZ9aotf8s1C4UnvRTLPJYtOwOpzRZ5Lz2E0iG3rYAf8Euj7pB/e25rMXT1owhZ5NRZ2+UFqDPMuYw+CZuw+82FmkPvv9MP0UC4w5F47hKVCwISNVKg1Q0wpOAKN0Aza8JT8eX6n/afqUZkIiKkD1ofATKxjqZlSZGY9yE9mBzc4v8WtMSYh9ww+5LI1EAGXyVxjV1159Cbih89E5xRG5paFyl+WxnQ0prHHR1vnOWpiChz0xF9+mudjH7aioPhvFdIw+jjtYvS+93elKZity9szlOmzbyWOSYMf/rK/En0B2JFmskoPEAR8leijXamltA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(6666004)(6486002)(83380400001)(2906002)(6512007)(6506007)(26005)(53546011)(186003)(478600001)(2616005)(31686004)(36756003)(54906003)(41300700001)(66476007)(66556008)(66946007)(82960400001)(316002)(38100700002)(8936002)(8676002)(86362001)(4326008)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEp6LzZCNjJqMk5BT3Uxdkt0NzIvZ3A1SkVyU3pTVmw2U2lhZEVpZ2t0d1ha?=
 =?utf-8?B?STNqODEvZGJ3VTFxSzN0Zy9Xb0c0QXY2ZGtGQU5IdFFOM29SK3ZJOHVDWWg4?=
 =?utf-8?B?WmxZenI5ZEl0RmF0YmFYU2Y3QjFqK0pMdUVkeWZFWDh5Wmh0akNHUWkwSWps?=
 =?utf-8?B?Sm1lSTkwOVhaZzFOMUl1aGhyb1d2U01vY2Jya3g2ZnB6V1Z2YUh6REtMcTFS?=
 =?utf-8?B?bU9oa0tCQmJlTVgxaTBVeTNXTXlnakkxRlFyT1dxaVdiMituTGNyR2JDQTI1?=
 =?utf-8?B?TUk3VDdEdUlhb25kdFBHMFRhQ25FZkxrUmFzTEQ2VUVZYnI2eGYza054NGt1?=
 =?utf-8?B?T3l0WXl2bDdGQndjUzl3alQrRGVrM0hpWWZZbXhDbjRqbktnazhLOXpXbVBO?=
 =?utf-8?B?OGRDQndrb3JKeHR2aVJLL09FUzBYeTNHY20wYjdDcmZPNTYvZ2xILzRjM1BK?=
 =?utf-8?B?UE9VL3ZHYVhhdkw5VFNwNm5vSGVTRDdnbEgydDZuMVJmK0hFZHowWlp5OFZI?=
 =?utf-8?B?d05nWFBWRXlwUVpIbHRsSERoWTNlUU5SV0tJQ0NyNlJpVGE3NVpVNWo5eTAy?=
 =?utf-8?B?ZnFXQy9mSTI3NFpnY2pCMHJhaWFrVzBadXBMOVg1TjRZNXBwa21kSDZGYU5h?=
 =?utf-8?B?NjFiZ2FnL1hHKzNxS2xyT0U5aDR4UjRVMzZsbHBLMWRITS9pYVN5cFRlRkhK?=
 =?utf-8?B?WG4xb21RT1dKTXB0cmhrYVcxc2NYQTluZVFTR3lPZmZ2a1BtbENQQ2Y2b21N?=
 =?utf-8?B?bmpqdExLUEJhNS8wWWhDRmV1T0FGTDdBL2lmbHFwNmRCT2o0WEFTc09uZW9h?=
 =?utf-8?B?d1N4RFZjaEJTcGVoRDNjVVozd0ZOUHVUVTd5U0x4YnBJQXFiMXE4YXByTTdR?=
 =?utf-8?B?Zk4rNmF5a3Nocm4reDBUMWIxZVdRbUE2dXZuUDAzWStpRHd4VDcvRGZWbDdQ?=
 =?utf-8?B?UUxEOGJwQmF0ZDZmZFFlQ0VEN3E0REtnRS9Wd2QvSThaOUk0S3NyaytCR0tr?=
 =?utf-8?B?TGZpN0dXWDZNVjEwdHNKVFI5QkdHTmhMUmRROUVZcVU3T0lRUjdUbmdHT0xw?=
 =?utf-8?B?NHY5R3E0QUJvVXdPcW1wTk1oNlF3SDd5enhWdnltc1JULzdIVmx5VldneUVO?=
 =?utf-8?B?R2F1MUtuTjhUbllFYlV5SDdsM0dtQkZOa1lLaENabEhIV3BhdXNOQlMyOXhV?=
 =?utf-8?B?bmRkVy94R2VlZ1UrTzdvV3oxcGsyT09HOWFqVGovOXpWbkdzQnZXZWJYVkdz?=
 =?utf-8?B?d0RBMm00eGEyZm1CalhlNU5EV3ZNMHE0SUdYRHhoa2IxaXltelFJZG1lalkx?=
 =?utf-8?B?d0ExQXdTWkx4LzVhUWJUZDVZUWZxVXdlVVBYK1l0ZmZiaDU3WGpHWDVKRHYw?=
 =?utf-8?B?RnNyQ3ZBdzdWNmkvcHpCVW8rV3dQZStrczM4S1NOTklMVzdsMGdGa3JISW9H?=
 =?utf-8?B?Q1RaRmRhTGdiNkFEUnR5NTd6NUdFNzZZUm5aKzc0Vnd3WjBOZERXWXFjSjh2?=
 =?utf-8?B?T2huLzQxWG16bjJmbHBEQ1AwK2dmbm5jTjZvZGpZcTVZaDVlYWZTMkZ4RzE3?=
 =?utf-8?B?SHR1dDJRY3REODdMeXh3amI4OXdpQURDT1hEQThGd2pEb3dITUVKL3ZWdFl2?=
 =?utf-8?B?NXpzbjk1bDlMNEt0eFJWeTB0R1p0cDBBV2ovOElhb1lyeXJ6TFNUQUV5eVo5?=
 =?utf-8?B?UDJyZUFjQUFvdXl5WXAwcVdFRFdyUFNRMkw0TkxaY0R0Z2J1RmVrN0xoZHhM?=
 =?utf-8?B?NUlRRUZPZjVOMDU4eHlidnRWMDI0dnN5R2FSS3owZkIrcTI4QVlCS0lLRERT?=
 =?utf-8?B?TFFicEZKeGowNnpDSjdTak1HeEYxS0swbllXckwrTHZ0NEtESWVYQUpUaGU0?=
 =?utf-8?B?L1NvUXdpY1lQZDRkZnZUaWtsSTMvT0Z2WXJOTHNGYStGU1djdEgrdWtRMFhU?=
 =?utf-8?B?cGNyQ2N4OWVreE5ta0NpVEV1QUkycjBjbzlXdUgvVkF3T0RmV3VTTlVpSGly?=
 =?utf-8?B?em1TVWpGbEcvVVBYVTF0Yk9CN1V5QnVuTTl4MUlXWTFkSXlyWTBXdHNKRVhF?=
 =?utf-8?B?OHh2RU03ZngwdHM0TnFzc0RxbXIzWjF4bUoxTWcrQ3dCUlVTOFUzRWRDSDNR?=
 =?utf-8?B?aWVJWnd4WVZjR2ZtdXl5czVBbzZrWVJDSlZKODg4MzQxdGhyQnBEcmo4Vldr?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WZshAvxJx+55c6GyYgFZdYANBepGNXYiRauRZAORDSZHTfkEIwHjNK3gfsO0Mxn/UA2l9qGLc2ln3sMLtCxHa7mE7C6cC7O2NyQ4XvJ9HmuJMXesYwDJDVx4jpIM1AcfohG7xCUOmWfU7BatlmM6V81VEP51dUZJiY1M3PmI6ZQnJY9+PmKAfS9iRl8S2/41ZV2aoJe5hnhzm4XqjV6yDmUkiCaPiYrNU8jdiOFcZIsCFfjdiQDHbzvd8tqpNZcgiZuTgv8GvNxOtoMlUGy//mxuAEnfHfkeiiTrCLlzpWz63lT1uuBJuQgVLZcRwGoxk2Weg3FT3A5zTpBfIBD6X9K5tnlXU5pEMS+CcQuiR6sWMH+D5UtamA0xmKHtmeehBlbjRLdOGq35K4jhBs5uNsEzS9jpgT3bwadJr1dRPUiMGVa9QaBw95nbUJ/t+SYVsNYmNb70unS+RrrZxPbr/oYJlkPkhCWap2qWPLa4nBIFaV+svdrwZyQ7c7Z+FvJSbt634+hUjYK9vYc5CYbA9ffACn9y4EXp6ahdDWuvjivGLRdLSqPoyO7tQgy5KkubfIlpomVeo8DlwljhXTJhgqLzT8dpqsg9Up93Zo++2yjzNh+VLksqWrJV7k/JfNd5SX9krP40QlBYwG4Xl0FH3JcyRVpt30vwhvtkKnig3EwZiFTPLjF7ovp2wNzspRsd6QK6s8UnQ7obUQmu8CECVnVopWiTj5LhAcZp90o/DAtSvQxwXTagOG+jdBeuqCVSzV3z7aM2DZR0rR480iR9rLBN7fFGITfXkrw1YAmOtLGsskA14EA1B2iRCi6dGJEN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ad664f-73ad-4be4-b6b5-08db4af34c22
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:55:02.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siEj9Jwjrix2/a+saslokRLzV8SOqROU0XO+eH5owbKWpKmDtjO+6/zfe4kXkuVKIx4YsCkoEc4SUKSNpi10lzKhTnBdaK+nBYsePSY7Rvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6991

On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> Ensure that the base address is 2M aligned, or else the page table
> entries created would be corrupt as reserved bits on the PDE end up
> set.
>
> We have found a broken firmware where the loader would end up loading
> Xen at a non 2M aligned region, and that caused a very difficult to
> debug triple fault.

It's probably worth saying that in this case, the OEM has fixed their
firmware.

>
> If the alignment is not as required by the page tables print an error
> message and stop the boot.
>
> The check could be performed earlier, but so far the alignment is
> required by the page tables, and hence feels more natural that the
> check lives near to the piece of code that requires it.
>
> Note that when booted as an EFI application from the PE entry point
> the alignment check is already performed by
> efi_arch_load_addr_check(), and hence there's no need to add another
> check at the point where page tables get built in
> efi_arch_memory_setup().
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/boot/head.S | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 0fb7dd3029f2..ff73c1d274c4 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -121,6 +121,7 @@ multiboot2_header:
>  .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
> +.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
>  
>          .section .init.data, "aw", @progbits
>          .align 4
> @@ -146,6 +147,9 @@ bad_cpu:
>  not_multiboot:
>          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
>          jmp     .Lget_vtb
> +not_aligned:
> +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
> +        jmp     .Lget_vtb
>  .Lmb2_no_st:
>          /*
>           * Here we are on EFI platform. vga_text_buffer was zapped earlier
> @@ -670,6 +674,11 @@ trampoline_setup:
>          cmp     %edi, %eax
>          jb      1b
>  
> +        /* Check that the image base is aligned. */
> +        lea     sym_esi(_start), %eax
> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
> +        jnz     not_aligned

You just want to check the value in %esi, which is the base of the Xen
image.  Something like:

mov %esi, %eax
and ...
jnz

No need to reference the _start label, or use sym_esi().

Otherwise, LGTM.

~Andrew

