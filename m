Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B406CC778
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 18:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515988.799453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBr1-00084D-AT; Tue, 28 Mar 2023 16:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515988.799453; Tue, 28 Mar 2023 16:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBr1-00081N-7C; Tue, 28 Mar 2023 16:07:23 +0000
Received: by outflank-mailman (input) for mailman id 515988;
 Tue, 28 Mar 2023 16:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phBqz-00081H-C8
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 16:07:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c5345ff-cd82-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 18:07:18 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 12:07:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5400.namprd03.prod.outlook.com (2603:10b6:5:2cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:07:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 16:07:06 +0000
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
X-Inumbo-ID: 9c5345ff-cd82-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680019638;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W/pu5UwGRNQlz2CnXck3IcUt60RHWpRYns3qcZvv9uU=;
  b=UdXMzx50das13UeMKwOT/circuSr5ENcjSyTN0VRheOe2ukGKbqCKMUQ
   cfpj1zKV7VyCYfxGGpaJas432lr1Ah8lEpagpNEcIMuwIrRNr88OBPvx2
   iqXNNs7ClM4nDMi28o9bWbSxAAo6Y2u2p30oMI37/fCGSHjhfw7WMuSHg
   g=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 102186496
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VmZzYa9zSmPB5ywYlWrUDrUDon+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DMbDGyEO6qMM2fyfNl3bYq+8U4CucSAn4JhG1Q4/ig8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklxy
 N4UKzJcbiuqqN617YCJb+hnn+EseZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANhLROPkp6ACbFu750sXBy1KUgeBiviz0UXmUMtmF
 2k69X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptz8+oc6i0uVSs45SPLoyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:D9y11a0OglF4gMoUQ4YCwQqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="102186496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxnlmJuwkQKFWsXbCnkehZABqDg3BKJTsuYPi4PblhEzkfqObm28DE4vAZv/aWDU3h89oDidQmNLyv4rxQZWPTCc5bKDiNIYit6nlv24te3VRqHAYIG7ApJ0/SI/3DE+ncw8OM4RtGfIg2KsKfc6ZYALkUbjB2qeULYH8itAq2ABqmPpXyVAcU5FT1uTP4MiW0AT+hyVB3l3CdTsTyXgLb4+Zpi9mcRPL0kwxwZMrOE/tX1MYCPp6HL5BXh8T4KN8ot3JgK2PDbyoCz3rbxmcS/s+D7nLHG0/9fUFULreBeTfiMX7pWUIQsT7+DrDtad1s7QaXyLEzYLI8m+823tKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG4rUN60l+pY8tXo1iGChUHs1QqbGFcCNfK7RdO0aIE=;
 b=KGl7nmUQMPY6wRRIyAvupHN+uO7Y6leWTE8Hgx7FizwE9QrxDUwiGG8scgtC030nmtXLJVfMvBeRcb0anT+sC/makQBvAgFappHssOTdyCk08T499FIwly1kiboYDZCjRZkMivppMS3zGqGKIkBHuelqWTDO8mZUWmHgzKY5Jh8iTYdqSHdfvodLbrhhWiFB8vi6ltidWaQL77QcWOj7yJLGp2RBV2SjtH/MSUCyTvEfKAc1X1PG72gcJEzkb0m1KX+8OrHMZoEhsrMKCMC6NHZGxm9lCeU8veQRg0/QZqAvc7Tp2cs0FsxhIYTxJqiD14OBQQGToUVMS6AK/F1rHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG4rUN60l+pY8tXo1iGChUHs1QqbGFcCNfK7RdO0aIE=;
 b=HQH4EVJ+tQ1S5lbKFpfnfK8iK0h3EowWT7U5OjaR8gxpYx22S+85ezOgW6Qt0tmSP/ZnqIVybkNMxfQ5MHdeKzH0AfE2IrOL6gl3cK36XucxF8RS30rzFIsAqxBFYF8sJN0MRpRJKHvf0rkTChMz9xMgVphVIpA/LalarMeBOIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <de8a81df-7b20-5b68-37a5-5359d9504026@citrix.com>
Date: Tue, 28 Mar 2023 17:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-5-andrew.cooper3@citrix.com>
 <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
 <61f32d99-67b7-d7f9-db93-12105266a03f@citrix.com>
 <cf6a0e24-ef24-57bc-b53d-919cf494ee63@suse.com>
In-Reply-To: <cf6a0e24-ef24-57bc-b53d-919cf494ee63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7ef3eb-5f0b-40fc-b21f-08db2fa67a3d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/82b6Z/wkcLPTIuG3yb8NRsnHXsoJHk3QHrLAjpTZqztTGUttZu5DKbxISlG6YmgG1Xn0iT3HycQBR3VXfAp98Q2/00XkD+yW9axmOPS0qCaf5neQo49RO7xD1OaZhqwpR2+4BBHwtr3hKvi3LwfIqhmLbOyG3XncUStTGLmT9IDZYJocdMPT8y2/ghR26w6qjKsJMMiM8VAe2ggekHe4HeQZU2Wt0pRPDr0GM5eES6KmIcsvlRijnM+WLqOhK4iiB7w9TQdQUaoLoNzIaNdg9lC6CAyMCln/cls7quTNlO55U53pvkmAjr9bW3TFFhvLgNQQfm49Qtl06PzK2UD1rAf1BPB7MYU5PECd+vEIthc216voWk8gCaNNYDy4Za/gA6tS/UUOc+yAQztR9yMxNVmuKe6tOdQLTW98TopXRekuBm7HJqgvwYfJ9HKixclo8FZMaNj0tsQIbhApNvAmiorJ5Q5j3dD71wpb+CZWLN1DmcmDrZJPX5r8b4ugSwja5ZOF0th2NwbpWiD1BJjR1PQmGxVSCzqX+i82fpPll3EbGen6oEf3JpPdDrVwqEmOFUqRNnOHoDJ/FSc1T5NN1IfGlOQ5npHN5oi6skYG/Eb+8ZmEfN1hUo93UqtHWVZIw0Z/B830QkTirQvNIWpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(2616005)(478600001)(31686004)(186003)(6486002)(8676002)(6916009)(4326008)(66899021)(66946007)(66556008)(66476007)(54906003)(316002)(6666004)(53546011)(6506007)(6512007)(26005)(5660300002)(41300700001)(8936002)(38100700002)(2906002)(82960400001)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3lXSFMyR0xnWlNSUzZ6MlpsQ3MxZHhIMEdjU0JGWXBvMnE5d0lGYlNHR2RV?=
 =?utf-8?B?cTMyZG14MWJ4YWRaWjRRbE54UHpvVkdMeElpeVJ3c2dlc05GL29yVDJTOWkr?=
 =?utf-8?B?QWFGT255akFUMTIrN3Rrd1N6MTE5TXRJTFJWUVBLeWNyYzdBZXdoQU1nN25q?=
 =?utf-8?B?Znh1Q1BIMjhSR0RLOEU0RXU0a0sxdGRGRlVPVnpRanlaMGxCWDdOaHh4bU9R?=
 =?utf-8?B?ZW1uRWZqMGFwUkFqMTFqSDcxZmFZZXltSGhqWVY3YUVQeDRqMHh2a25uOUx0?=
 =?utf-8?B?aDlMTGh5TWFyWFFYMzdZTHB2WmZqWlVmc0lEQkNiNXl0WWVWWnNTamdHTlRS?=
 =?utf-8?B?UmRCdHZ0UlVYdGNuZzZoV0pLZS9KWDlpUmI5RmVYVE5Id21wVmFqY3RtVitQ?=
 =?utf-8?B?RVRxbEVCcCtDeGVaeHZvTEdSMzJzTEFLaU1IRlU5REhOSjhsclBBK0pCbXgw?=
 =?utf-8?B?Y2NmaFNia05KK2V5eW5oY3ZOSDdFb0R1cG8ybDRXWVh6Q3cxVTFZVGlReno2?=
 =?utf-8?B?SHdvMDVzZVo2alNwWU5lU0JpS3lUcWNvWm1CWm9lRThGMlNTNHE4Ym1UNnZJ?=
 =?utf-8?B?NGl1dUVSdlNhQlR4RTdkRzNiQXVSRnJrVFh5b0xMMTYzN3FodUd3VDV1c2pG?=
 =?utf-8?B?L0RDRjd3c2hmaVU4VE1zaXhXcDZFVXN0U3g4WmkxYUQ3QWQyMzJVZzMva0VJ?=
 =?utf-8?B?YlpZMy9ZUDBOZ3piTHJ5ZjhZTm9EdkhiMEF1ajBlV0Fuazhma0s0STdRazc1?=
 =?utf-8?B?T1h1bXlaU0VQYmdQZjBvbHY5Z3VTMW8xQVpFTUJJNmJvSyt5b0RQWlpSRWZk?=
 =?utf-8?B?YVI4dDVaZjBHVW9tNS85MTVtSWxWNTROZVpTQUlQcGpkV0MvRUZReWxFSE5G?=
 =?utf-8?B?UDcrT2JoTGs5T2wvMzZacmNTU2tTYWVuM2JXczBKdU0wWWVrdW5JUVJMMUho?=
 =?utf-8?B?Z2VDZGZneHpRUkFXZDIyMXhyYW95WU9iWUNyUkdYaW9QL0xSVXhtd0JpWnd1?=
 =?utf-8?B?ekwwNkI3c2c4VHRNSVVlU3B0bmxLaGgrcUpsQkZaWm1BTUQzeDdnOENWa2VZ?=
 =?utf-8?B?QmNlektYSXpCS3owNmY4VlJROVMrcmZXRkVab25hY2tNZVJ3MHpXWEVRbFhN?=
 =?utf-8?B?a1cybUlQTE1YQ1VBMnV3WDRCSUwwWVlUYlV5QjlZS1FPUHVzeE9CTXFGcXVK?=
 =?utf-8?B?Q3ZWaVE0ZDIwQkl2RWVOb2h0ckE1eXlhZDBIbVp5YlZHOEZUcjllc2FRRm1M?=
 =?utf-8?B?T3AzTDNJSGFhQ29WRndsd3JkcjV6dHFqN0dNRGtOL09lRy91U1FFbHVVcEhq?=
 =?utf-8?B?c29JMEUxQWZjUXoySHEzVXpqRUw5SU5QUWxURTVQSU1lbmptQUpWUm9JQU1U?=
 =?utf-8?B?eUpwZ0VBWDQ3eW5ZaHhPTlBQNFh1UzVMbEJhTHg5ME5QdWJKUlora2E1Smhx?=
 =?utf-8?B?SGlRcGtJelVhWnRiVWpSMm50ZGFGanRHVzFBQUVWYjd6VmZJeGd2ZnNWd2tK?=
 =?utf-8?B?VnZ4Umk5U2d6bUpzV2puVGVFSGNBSTFmNWlyMVQ4WnhDMm5FKzRmVlp1eHEy?=
 =?utf-8?B?MWRabHRMMFRyVlQzalpDTmdzOUNvdzRMcnQzYzBBNFZ3NG5Sa01vRU1xbHpu?=
 =?utf-8?B?dmFHSS9sZWcwWU5aNnZKQ0tGZHk1TUo5TkxGWHBicEVCVW9wQ3pUNGFBWGtU?=
 =?utf-8?B?QUJFZWp0cVpzbG1NNytYOVMrZFlmZzV1d254OTY1bDBuRktsVjNHVk1pdDVu?=
 =?utf-8?B?MHl6aDlseGgwYUdYTmtTaGtOMGFTR1RMcUV4ZENGcVhOeTBHQjlLSnJadzhX?=
 =?utf-8?B?alhnK0xveitGZ2lwSmhDMVN2QUxvOVYrVk56dHU2RXcrNDdoZWozc3RZY1cz?=
 =?utf-8?B?Si84VjF1ZUFlQWFwd2krWFJ0ZDlJTUt4c2xnV2VSZ2ZyTFQ0ZE10VWRieklG?=
 =?utf-8?B?SXFiakE5VHM2NzJNZzFNZVlTaGZYdThZT1NxS2xWa2hoclNFYlR5NTdsRXFj?=
 =?utf-8?B?SzhPYU5MTkdIaVYrckduUXFaeHpWMzdGYjkwUWtwU1RmNHJBTkVEOWZGK0pt?=
 =?utf-8?B?Q1lKM1MrOVpsMHRmYlZLUUN3RXdNemhzRHRKS3NaaDBKQ3Q2d3R2c0JjYTlw?=
 =?utf-8?B?bzQ0RjU0a3N0eDJTNFRQRzkwb1lHZzNDMDhianQyS2tINVVJaGkybGdhcTd3?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SfYCoha3sIFNly6kmHwvLzkkwm1TkwICaGFYuYlKthRFya0u2GbET5qizBtisk8NK3fBYstPSFTr90biRme6bdWuEPffB33E4ubd4ZHNKUYjwkf02PEspv80+HlkkdwtstGXJVWTG5grl0gTzjJJnL0xPp7M/eR+ev7wV7sG9LE2hy5QDtxzuMYxL6OrzLkwLJ2rUhuEFiQQSH143lJPCDoUzBw0ondHnEmnspMP8CWidwA62AUYOYFWLCOJaioBtw6T5UCDPFP8kVU2v2QA6a71JITzJJEodZ4OF1A9PY37GTv681SiBP+zqI9QbS3vj3sU2ypU8/B6e3u5oPbEUkpLDSebj9c7x4yjA/3QMfMscZDzERHsmKbkIa3ga7ucij2cu+4XvDYSaO2yWprQUpAQmkU8mi9UjF8QxavNfDUtvrwofaMmNiTxLNBrRN95vO0AKhqTshF1Ce4vaJgA58WH2i+6F7huJ9oCrkNGQfszp+gb4ao/XE9B/KYAaIzMwzszioH3Rd3gNwloY7c0oUQ0IRfi/MEdnZ7oGDQenFVLQGCMp8B4OoNn1janqVKlMLZ2Jxsv3KQ9rHlSBtiXbZ5CUKDhedKH7b+pH2Pcy67kXZyMyZ3RpmeNCJgZDZVfcZSIbHxSb0heDaHBPrGfICau5bspjfEZJHEJ1hrC8HdvqdquMBTGvA71lcyE26HiWiLO5AjYzVhzSKKxPc5McB/UMnBJiOdmW1PgwAzko4a0/S2kOCcE0sGkak/jUX6rePApnVWtgi7e0ztOd9OipJn48CTywv1sZBzdMAmZusSncClSV8oL96rSdbRoJetA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7ef3eb-5f0b-40fc-b21f-08db2fa67a3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:07:06.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/l9SZHqQT6U88qAV5VXReMZi699YMM1Cd4mOUsOLOlrJwgLalkwX7Cx+g3emiAZic9GA+46UHmhqmP8Lj730svEFB0qcPkq1KZJJN+zcEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5400

On 28/03/2023 5:01 pm, Jan Beulich wrote:
> On 28.03.2023 17:12, Andrew Cooper wrote:
>> On 28/03/2023 3:19 pm, Jan Beulich wrote:
>>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>>> Right now, the boot flow depends on the second pass over
>>>> bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
>>>> alias of the CPIO module, where previously it caches the early boostrap
>>>> mapping.
>>>>
>>>> If the scan is successful, it will be successful the second time too, but
>>>> there's no point repeating the work.  Cache the module index, offset and size
>>>> to short circuit things the second time around.
>>> If the scan failed, it will fail the 2nd time too. Maybe deal with
>>> this case as well, e.g. by clearing ucode_scan at the end of
>>> microcode_scan_module() when nothing was found?
>> See patch 5.  It can only become true then because of how the callers
>> are arranged.
> Right, I've meanwhile seen you do it there. That's fine. Yet I think it
> could also be done earlier (and if I'm not mistaken also ahead of all
> of the rearrangements you do).

Prior to patch 5, calls into scan are guarded with "if ( ucode_scan )"
as well as there being an "if ( !ucode_scan )" check.

Clobbering ucode_scan prior to patch 5 breaks the second pass to cache
the ucode we loaded on the BSP.

~Andrew

