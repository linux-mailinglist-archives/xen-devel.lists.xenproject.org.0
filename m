Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D234D1A42A0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 08:44:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMnOg-0006hD-Ox; Fri, 10 Apr 2020 06:44:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ievq=52=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jMnOe-0006h8-VR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 06:44:13 +0000
X-Inumbo-ID: af4f1f48-7af6-11ea-83b3-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.100]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af4f1f48-7af6-11ea-83b3-12813bfff9fa;
 Fri, 10 Apr 2020 06:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT78v4F2Dlj3todmwRp4v7a8w6SP3gqgeHl5rwXihVjOP8FOsj0dEYy0yYGevY96MYQ/vfM1F49afpzppDCqiGFiiYPJ0oU8zVeRc6+bZgzXiFoyEr/jrXyi0yqUKrV/DjLr8Up6C/QK0UnwMDoJWFTpuy+Ge6Fig3sN32P7OPM7UcC/RbIFjMtebm17qd73uWdJQu2rgz89ijtBaHqfSW/3jCLxMJrta3LtUd+UdhBFxItvWSSVZ5f/VYMHa3wCE/QSvNFIsEIsvqOj4bcYkrhgyRVbYANJ/ehjpCqdGMPG0JoRmApyS5EaTw52hHhrvs+horxelaHysQ5QPZB3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4Qrqahw16njwMMCAjAlS5t+9HBXe7nEJBv3Kid+mrE=;
 b=bd7vl3NMBpPFGZu/Y+VDejVTbzyPKLL+7lLgU/sjrcgahmMNxek4pElyf4gcAR93tTJ/wWIRjz8zsiSgrGS7kPkAgHdsVjuQErbfd+xkUp0AEE55MMiEkyJnQFYE5on4fI/jy6d7Qd2dOdfX2uPnLv+HPkX1qqGKUrpfp/kJ+Fp1AZ2QFzK6oahTOBEJjEjFTJSKS/GNpLS9SJcao22fkPNxhwqb4FrFqT6WkUWN33RctZ9gTyoCkt4Uivmc9BgViJLyCF4s0GYqO59kop78+EnoYP63hC48WZI4PbtULUQZ36398fja0OvkHRqFcwf65Dqf3m650ooejiG5ma328w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4Qrqahw16njwMMCAjAlS5t+9HBXe7nEJBv3Kid+mrE=;
 b=ZGeo+nPvfFLvwTyXbdfTdRYnUOY4rN83BwJ4SvGw8C8c003IcIRVhLR/E5Rbg17GQCEW44E0b8NZl++GGK//8na2hpXftcPWK0OXRrJyEzygsN+CgY4d/pBUz62NfygyegGraKii82kr1v2EtbAxta35OBalyfv4H/XgP+7idjM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB4280.eurprd02.prod.outlook.com (2603:10a6:20b:41::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Fri, 10 Apr
 2020 06:44:09 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.015; Fri, 10 Apr 2020
 06:44:09 +0000
Subject: Re: [PATCH V7] x86/altp2m: Hypercall to set altp2m view visibility
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200330065434.5952-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D813897@SHSMSX104.ccr.corp.intel.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <8e30cf60-d309-dc0b-f2d5-cdd6bea2b81d@bitdefender.com>
Date: Fri, 10 Apr 2020 09:44:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D813897@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0120.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::49) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.107] (82.77.232.39) by
 VI1PR06CA0120.eurprd06.prod.outlook.com (2603:10a6:803:8c::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 06:44:08 +0000
X-Originating-IP: [82.77.232.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f539ed7-43bd-4ae0-b40f-08d7dd1a925f
X-MS-TrafficTypeDiagnostic: AM6PR02MB4280:|AM6PR02MB4280:
X-Microsoft-Antispam-PRVS: <AM6PR02MB4280747B9FEB6EDD9A3F6B67ABDE0@AM6PR02MB4280.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39850400004)(136003)(396003)(366004)(376002)(346002)(36916002)(316002)(5660300002)(81156014)(16526019)(2616005)(86362001)(8676002)(52116002)(26005)(956004)(16576012)(186003)(110136005)(8936002)(54906003)(2906002)(66946007)(31686004)(478600001)(66476007)(7416002)(53546011)(31696002)(6486002)(66556008)(4326008)(36756003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzscsD8MVKOjc+kGgIWDNPRYdh4yDdGT1aKeKsI4haqLKne16XNKUpzG2DnhaQS0cAR+rHcK58Vbvh/HIlXJhTwgk8zg2xkt+HnVN/KUm3WJCyMibCVd+MhkDE6gGI5dz7M1JYC8bIYl42s5xeQPQ8s+y6bhzKAmjj612NiZR5qmgFcVA9o8y9rN/HB0EIERJ1Yxu5LK0Mpparf82aQUCl/1CozX9XHvAq1cWw+waNc8FsDnf680uAdgUgEzNo6Nwz2T2QcZ4QgyBQCN/7ZFDLNSmjyvpFHDlY1hH7Rxmfz8Nmokb6KfZDdozEksgJXlRoPUKexU1SFR2mfUVsL+b7deMoHp4B5kSJLEAhbisl8Jc558maHJS9M5bQIlSag3KI87rGLQ/paxUiDc15Ry6o9pYiVQiLHGgoAU0zJCCgt7MTjjKW3l6QcRV0GMCYwp
X-MS-Exchange-AntiSpam-MessageData: DHPnu8UKWfR/I/Aj8u3qAW+uKJN18hau6kCnlLdc2+of9j3PMbC274FLTMNJBkYOZzVNyMNDQfqUpY6YgiQliV28wea5EP66/JaD8/RXI9Lpy54nM3PM1m258dq7GjygbTHg5WrTAwr/5swx90ywzg==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f539ed7-43bd-4ae0-b40f-08d7dd1a925f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 06:44:09.2907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGfh5wJCOqvaRLVsOdPZDscvQuDck4PZgsUfkItJAAx579PpnI8OmbjWR6EIKxdPz87LeAHXwNNZKSozzS9vTnN/4bl/kNBKR8MutyoddEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4280
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 10.04.2020 06:10, Tian, Kevin wrote:

>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index a3d115b650..375e9cf368 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4511,6 +4511,7 @@ static int do_altp2m_op(
>>       case HVMOP_altp2m_get_mem_access:
>>       case HVMOP_altp2m_change_gfn:
>>       case HVMOP_altp2m_get_p2m_idx:
>> +    case HVMOP_altp2m_set_visibility:
>>           break;
>>
>>       default:
>> @@ -4788,6 +4789,19 @@ static int do_altp2m_op(
>>           break;
>>       }
>>
>> +    case HVMOP_altp2m_set_visibility:
>> +    {
>> +        unsigned int idx = a.u.set_visibility.altp2m_idx;
>> +
>> +        if ( a.u.set_visibility.pad )
>> +            rc = -EINVAL;
>> +        else if ( !altp2m_active(d) )
>> +            rc = -EOPNOTSUPP;
>> +        else
>> +            rc = p2m_set_altp2m_view_visibility(d, idx,
>> +                                                a.u.set_visibility.visible);
>> +    }
>> +
>>       default:
>>           ASSERT_UNREACHABLE();
>>       }
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index d265ed46ad..bb44ef39a1 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2140,7 +2140,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct
>> vcpu *v)
>>       {
>>           v->arch.hvm.vmx.secondary_exec_control |= mask;
>>           __vmwrite(VM_FUNCTION_CONTROL,
>> VMX_VMFUNC_EPTP_SWITCHING);
>> -        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_eptp));
>> +        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d-
>>> arch.altp2m_working_eptp));
> 
> Is "altp2m_visible_eptp" more accurate here? 'working' is a bit misleading
> since even invisible eptp could still work but just not directly togged by
> vmfunc...

Yes, you are right and I can change this before it is commited.

> 
> otherwise,
> 	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks for the review,

Alex

