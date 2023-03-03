Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF36A952C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505794.778733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2e3-0002r7-9B; Fri, 03 Mar 2023 10:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505794.778733; Fri, 03 Mar 2023 10:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2e3-0002oQ-6S; Fri, 03 Mar 2023 10:28:11 +0000
Received: by outflank-mailman (input) for mailman id 505794;
 Fri, 03 Mar 2023 10:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY2e2-0002oK-97
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:28:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15353df5-b9ae-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:28:06 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 05:28:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7134.namprd03.prod.outlook.com (2603:10b6:510:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 10:28:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 10:28:01 +0000
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
X-Inumbo-ID: 15353df5-b9ae-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677839286;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xHrs0f5lzHhHN51S8TZIoitU+QiuuhpNjRB4289tCrk=;
  b=eSQgIVRL5/3fAR1CcXvncWnWzcMbV5Tm6Xo5Y2nJVsf55LreqMzgvpgv
   t+ruI5EGt24fNZx9K2yG01qYLSvq+SMnG16Q5+I8h/cC+VRRargvxjMl2
   T83hEfa9W7fnT69uV3d3JZ4+j3BNOIqCjEu4vOIKN0YuqkHpEA4SVccAI
   A=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 99229395
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d/Z/j6K6X8XqeYsoFE+RZJQlxSXFcZb7ZxGr2PjKsXjdYENS3zBUz
 TYaC2uDPamIZmL1c41yatvnoUJVvcWHmIdhGQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QRlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57WDF/2
 6IKNQwwRRubm8es75KwTMVV05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHKhAtNJReDQGvhCnWHMgUJMBRwvC0KlrfeS20uQXI54E
 hlBksYphe1onKCxdfH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwMyUIKW4JZQcfUBAIpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07gs8C0aGm9lnvmTOyoYPISAVz7QLSNkqv6QlzdYO+Z4il7FHdxflFJYedCFKGu
 RAsksyf9/wHDIvLmjaERu4MB5m26/3DOzrZ6XZkGJ8n8Dah8mCiZqhf5Th/IAFiNcNsRNPyS
 ErauAcU6JoNOnKvNPVze9joVJxsyrX8H9P4UPySdsBJfpV6aA6A+mdpeFKU2Gfu1kMrlMnTJ
 KumTCplNl5CYYwP8dZ8b711PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:8ZGJ4quS7ZXmYzH0iBHaJv8d7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99229395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JExfhdo0ofhkOudpmk2IjaShmkCzk6Z1dkyRmdtwpuZJ/5Iiq6m7JbvwRSyNlGnERekH3I5t2a/3DRa1oVO7OBRHKfDLxokolnRpL36Ri69exSSDBLCxrRedktiomQfLFOOa+xkCdhoO0V0kIPieTMnkCZ4KBV/LuEfmqwvlkqrG1mFRiKRUlfqVNCrqJEl1n8NMm5B6fsYW4yj7FAPgxNJLcrQpz0FrLRFtHQ9vX1Ap+yENgvR/6tZaqy2tw0kEn7wpl7yPaw0zpIIvFCNHGFZfICw+1ikwIfUtTiO/zX5XqC8WdQhUXbcLXLy/68/pvwteeyegIQ2yaVtzhxbxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5X/DTcnwBc7mQG7OWu00/8hBXmNujAiEQl+NyeQ/Tc4=;
 b=Ih3pc2Le+0odInTYMLlWtLZzLj9djXr4CzqNj2uAVIwKwg5Z21Wc47pS2qkGLjJlOdIpO4KIakGfZLjH91UZu5OthGetYSenKpO/aE3PDTNNZy9imOpyrG+La8wNTN09Zw6g/dw5lSqtHKAdlOTCVyrQgYVU+uRAtl3/Od46hV3Dx4rpTMXZETXWX0UPwNffhQqM9OWgCKNgC8MHKc3eWlo/+dYgvSRrQCIMIq49AAh2EaqlMqxDzwHWIARujbJot5gQ7wZihpYeVyn0svjI9KTznvoW3iQaJSHANkJEkVxDnqL2SGyrLB71OzIsl6b07wrTYP9JcclaUzrVgRWIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X/DTcnwBc7mQG7OWu00/8hBXmNujAiEQl+NyeQ/Tc4=;
 b=jaJ8SZkM84TCzs44K87XKNPkL+vE/9y4i+Lig5gscdC8l3iShsSsB2ORTnMTaNL2wkUdsIrkS8BoYJaBBpAFhrUkTVedwvPludtlUt6KSdUGHmf22DUPvHSrZVeEZ+jdgC5V6PTWwaqM5cVLktBrfPjaJ2xXjA66d1lpSP/yoGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8fd12d0f-cf2f-ee66-6b05-9a7d116ac422@citrix.com>
Date: Fri, 3 Mar 2023 10:27:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>
In-Reply-To: <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0404.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 695ebd07-6919-4208-90e5-08db1bd1f741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LHFnfgQmjLzFViU+ASSE7YYSWXepAdRylrDlcHbxUsazYgdCoToHR5pCRiXy580pm8uKbD5mNcmwVfy0nkh7o8csQCoNDgfHZha0ujbiiGT9wSnafnZ6/foadvsDd9zJJB7dZUtVrCpIHQF0c5ztCZi01I/FB5BzgOhipKHbGoDDNnoSW4sRFxNvxmhdVLVGUkxVO3yGOKknATJ2UHyFATBF40BtS11JAKazW7bsViGQq2dcu4w+Q6cA1MVf2qDigCJH0vUsyWjOqt8SiEfYL5dQqbF4640waOB2vWwIIIZXEFhkpTdtRhjSU+MFDDDlIoREDcHrjTfjF1tzyDgCWaj0q9cfkv5qh1qZo5u+WcO2/X16waw0lohlrr3aTzLRwKnaEsRqdfXWgdNuteID99azfwPWkc4XOKk/8w/q7dN3j3h9fSa0fpBbhEiv2nYnknFnpNc9CsLYPpHgRrmpoTa37Ot6TkxBVs2WjBqA0GQHBFDdWYYMkfvCy1D35ZgOfXcc/JzkTFjDwYH23FUOS+NKVnQYOLxKv+0ALtp58Hxw6BRWsiGL0b9lEIH7QzPMLMLzb2lqdf8LL6sS7SMo+OAcgnJ6XyPBjJzlTTJ1m65L4S/pA3BQ0d3cBUfwRdG+DyURVzqncyp/AWEc9/p+EjHv9ab7Pzpp81i2FEdiZaxeOJ6uqMvNuashD/aNKYRDHnVmcvomBCs4/BgTFbcFgrnDClFx4Oxc6X0UYG944OQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199018)(8936002)(5660300002)(2906002)(31686004)(66946007)(8676002)(4326008)(66476007)(66556008)(41300700001)(82960400001)(38100700002)(4744005)(186003)(26005)(54906003)(316002)(6506007)(6666004)(86362001)(31696002)(6512007)(478600001)(53546011)(2616005)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3RwbWlQUndzVG82UUZnRU5PQlgwT1FNUk9ESUZscisyU0lnSW56bUczK1dr?=
 =?utf-8?B?NzNYa1JWSUorUnJZSHAxZEtubzlNWVZxM05HYXRPMmlBbGtUVGR5VWk5YVBm?=
 =?utf-8?B?SXlaUy9zSE1MeDRrZW1WRFJacmNIenJzWTJ0N25sMWd2dm1uaG5pc1NQN01G?=
 =?utf-8?B?WFNhdUNiTktwMHIwMDdYKzVLRi9ZUU9tNFZsblZ2RGhxUlFRUklENTRnMGtt?=
 =?utf-8?B?QTFXelp3TUVPTjlqaDlvVjRhRGJTOU1SeEtGRThoSms4VlVqamZSbDFqVW41?=
 =?utf-8?B?WGJiTngwNTBxUVkxOTRZS2VzWEhxdiszSjFuNllsb2xoMVdGU0dLb0tIWVcv?=
 =?utf-8?B?aDdoL0MyRlBJYmxScVlDM3FBRzFiRk91eUZudHViakpRN1hSd01HOXJlWDBG?=
 =?utf-8?B?TStsSDcyMklJdGFKd2ltbjZhNGhHT3FEK2x1NlR5Z2piVGx6ODhhMTlVVGtj?=
 =?utf-8?B?bjEyWDF3c2ZkbmhSVnhkTGx6TVBETjNVYmNGVU03ZGlqaFo5UnU0WnkxblF4?=
 =?utf-8?B?SDhnR2prYTladXY2dDlUNGVLZmRrcVl0T25TdDdjSHp1WGJ6VDI5RDJycFMv?=
 =?utf-8?B?WTdSWm8ycnV4M29UVVo0RmFGRUlYdmRQSHlQbDQyVWJIS0tYQk80aEc2OEJp?=
 =?utf-8?B?elNOK0hGbEZKdTBsTmt2SCtVenE0cWNNUkRQd2o3YWF0R2VUc0E1K1E2bFVt?=
 =?utf-8?B?YmZwN3hZdjA0Nlo5MU1sRDRXOXJyMTVmQStTVjZZY292c1BNNERsVU00UEtV?=
 =?utf-8?B?dHo4Rlc5cURiUnArR25NVDkyb21wY3pHeWQyNXZjK2tINEVxR1pNRjV3STBI?=
 =?utf-8?B?eXB6S2diaUFxYWVMbWF5d2lpSE42Wk9BRWZTbzFlZmZJc29rQ0YxbUF1YnBG?=
 =?utf-8?B?Q2Z4Zy94VGNMeExQSFNncXE5YlNTdVJFcS8rWUZUTGlpNEpSWmlLelZsbFU5?=
 =?utf-8?B?VlJOWXQyS1BQUzNZUHNaQjZDT1RabjNEZWN1bTlUd243VHNFTzNUZ0dsRXpD?=
 =?utf-8?B?UDhsWlV3VGEwUHJRdER1WUNwYUdZbmdWZUpmbURZWHNrL1ZYR1JrbmZmRURk?=
 =?utf-8?B?NHNVWitlSkt6NHlYRXJiQlZGaXUrcGg0S2xZdGNJbUNManFPeWRMRjU2MzNC?=
 =?utf-8?B?NUVla0NSMHJoV3ZPdVVROFhHOStSSm9hSjVTNWZhMExyVmZFK2N2elFFblR0?=
 =?utf-8?B?R1krUUdaYzJmMWNBWm1hRzlTUEx6Tjl4YjJOajNJUjlGdnhyTnNVRXRYdU1C?=
 =?utf-8?B?bGtjNE5DeEdIdlVQTUxsU2dFYStjcHFDcUNoMkpnQlhQenR4QVZtRGpKNFRa?=
 =?utf-8?B?d0VFSk5vZUpCV0g2VUZOckM4Q0JvNUpKVi9vdDdoQm5jN3RrSHpnc3ZzNXBr?=
 =?utf-8?B?dkVPVWozaCthcEJXWTVGWlk5Z204bTRXa3FXa1Q3RGh0MTczdzJxbis5UTF5?=
 =?utf-8?B?U1d5eXpkeXk0bGFwZ0lMRTUzV2lVcWpRNjhBZTJ3TEhaVmI5Y2p0QmlMVjIx?=
 =?utf-8?B?YnAwaWVBdlFxYVNXTUVwZHRpOTFxa05lY0U0NVNQbVJJRHJQQmxrSEgyeVps?=
 =?utf-8?B?UGlmYUZlb2xiREwwVG9aMWhXeHBDcDVYQ0h6aTBxR2puRHVtdkRjWGpUREVs?=
 =?utf-8?B?OVFaVkMrZ0xuWnBXSXlaNDloRE5NQUZNdkpkTnFPQWR3Z1VlRDFHTTV2Rity?=
 =?utf-8?B?VmFkRHZSUzdvWEpGdDM4cnpSVC95V2RKNFNZRXYzbk0zZVlwd3VnN3FBQmhS?=
 =?utf-8?B?LytHMGxGZ0hpMDd3ajI5dXYvY2l2eWlsWC90bThQSzVqWEFhWXdwcUxvYVVG?=
 =?utf-8?B?VkErMDVlRkZ2YlloVk1ad1FEckNMWkpsYXlxR0ZoUG9TV0lycnZHR29Ma0NX?=
 =?utf-8?B?NFhuK1h1QmpmTVE3R05PamZQRDFYRkhGbGxwTzlGak5EUFg5UStERk1NU25t?=
 =?utf-8?B?YWhSeC8xSDE0ZkNSQmlkUDl0ZUFOUno5aHFuZi9nVkp5ZDRralNaWHQ5Qkox?=
 =?utf-8?B?dGtZSmIra3REVDhhRG9MWGI3cGVjMEIvT09TZTgvOVFIeU9FWTlsUmVyNERX?=
 =?utf-8?B?YkU4NG5UMkZYKzdxelhXTUdyejdvdUpESlRKcUkySkVDd3N0SWZsOWttNFJ6?=
 =?utf-8?B?QkI0UHZoS2ZIR21KZFdSTm4rc010QkQvMDRhTDFOODEwYlBUQXpFQmk2QUd4?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w+SW2nF4tbEEQsrQaZHZL3JMdKn1olPv0xTkL9AeUI9BCiysm9kKjB8aQIj7kIA8/NmtnFaJtRfyOwQiG6hBLcc7YdWdguKy6W2GmyS0BoFEyJlh5fwo9KR2bRZOmC4v74q9wBuTzhKOV7DpNyIb404VTh4R6iMESam8SXseZwHST2KoETdLg6B302mKAklOhjBHNTSc7dbiQjBmWRW/MQZYR6bWSPbZE/oqhg0fDdgGGBpa0Ty1WMyQ6pJmrhdHi5vEissqqKF5Nz+kE5qqgl/rCsmSndYp200pIBnpiMRsNE5WsxoFtjtNsN4Lq9JcuHtlYvjakgsWTxQFyCgDAtmW8g85Cstpb44EAHjekWxCF8+6DuhFcAOqAr5rNm8snFPv1YjpBfsncdy8NIlkh76w9Z/cB0AesyYcDRrcrJaM8V7kDA9wM7EZvCwgWbSFdl4oxJhl7YY+U4H2hQY+3BNQmEKKYUB0AKzOK8DuNEBo6Hms7BPqlP+45uLV0eh19cxxqt+1kXPd6C1RkKd5ohUjdjnZ2So5UEgK4x26kuct8HunRUAnj+dr2OQvNLp/3R9HA7aekE7OHHGjITQ1ASmbDB/R1kVsbgieVws4yMvZOpy7oJevyzoLeFv5EZFl9VAv56F1rN+xyD7pbZLFRGvqCoC/0bXJDlECucZTkRsqVI4KVmwQSXTrMWEjxMTS/y63teTixL2hNPcCHxuyII+cZdo9F8fXAsfx42Q2fjLg3wDlfbCEoZ88R7tfcAF+/HkZJ7RP7lq1f8RBTIgo9FBEFNUvkXXZXaX9ejASzP4Lo9leLTNol08uAhT31z1VNCSzCFD63J7bAXPZCaAiQQFArd3OYMpuoTkAXRdRt0AeP3B/gb3ldzpys7LUTDkhdVGnKSS0VQ4COqzmnaifNv8a50BkXoKPW4cQpXXX67I=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695ebd07-6919-4208-90e5-08db1bd1f741
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:28:01.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPZLBi3RCStC61JMuH/gfmleKs+QtArdgvnKSn4SNWZAoSj+UMVEsN2oluCxXWNEx/cgx7izBrIiRiXh4/bh/OB+Z1MFgudk507pVTie60Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7134

On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although it
occurs to me...

> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 1c87899e8e..d9723fe1c0 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -7,7 +7,8 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> -void __init noreturn start_xen(void)
> +void __init noreturn start_xen(unsigned long bootcpu_id,
> +                               unsigned long dtb_base)

dtb_base probably wants renaming to dtb_paddr as the pagetable series is
just about to make it a non-identity mapping between the two address spaces.

Can fix on commit if you're happy with the suggestion?

~Andrew

