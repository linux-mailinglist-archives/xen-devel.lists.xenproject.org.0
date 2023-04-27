Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFCC6F0362
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 11:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526903.818964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prxu5-0005kO-3M; Thu, 27 Apr 2023 09:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526903.818964; Thu, 27 Apr 2023 09:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prxu5-0005iU-0L; Thu, 27 Apr 2023 09:27:05 +0000
Received: by outflank-mailman (input) for mailman id 526903;
 Thu, 27 Apr 2023 09:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1prxu3-0005iO-FZ
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 09:27:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa077e7f-e4dd-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 11:27:02 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 05:26:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5026.namprd03.prod.outlook.com (2603:10b6:408:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 09:26:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 09:26:46 +0000
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
X-Inumbo-ID: aa077e7f-e4dd-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682587622;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TuuZPu7Chmy066j7TkpfpQXlWqMzk1mCxqd90J3rUZo=;
  b=dOvYWNF/3eiK9hS8aZFPV/5RRK5aG+amTJO+mhcoUu599Eg5EILYcaV3
   7rz2TzP8ppGKBJitt6C+BkgZiwEGPXMx29XEF3jRJvqjufhYD+tCZNgZy
   yWLm4zznj8+Vg455zjVO6jujpnwZ+IxvQKAeBCNSP/edXkS3P7uRhEccC
   8=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 105815953
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hF3WCKh7zmyqNdy5vXQJcDqFX161xBEKZh0ujC45NGQN5FlHY01je
 htvDT2DbPqDZGX0f9xyPdux90gF7ZeBmocwTAM9qCA1FSob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AWBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfNQhdSxCbq9m776m7Ufl9r8khd+jSadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1arI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXlpqc30QDIroAVIEwzcwWqrfm8sU7gdOJ8c
 RMV3ioA95FnoSRHSfG4BXVUukWstxoRWdNWH/c9rh+Ezq7Z4QGxDWwDUzIHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN8QdRdIOjIYuy5jDz7/laK52CZkKcp
 3VCkM+bhMgSDJSlhCGLBuIXE9mBwveOMDTYx3l1DZQl3z23/jioeoU43d1lDEJgM8JBdTq3Z
 kbW4FtV/MUKZCHsarJraYWsDchs1bLnCdnuSvHTaJxJf4R1cwiEuippYCZ8wlzQraTlqolnU
 b/zTCpmJS9y5XhPpNZue9og7A==
IronPort-HdrOrdr: A9a23:Gre3eKxAnjGA8gYFXCukKrPwEb1zdoMgy1knxilNoH1uA6+lfq
 WV98jzuiWUtN98Yh8dcLO7V5VoI0mskKKdiLN5Vd3OMDUO0FHYTr2KhrGD/9SPIVyZysdtkY
 tmbqhiGJnRIDFB/L/HCELRKadF/DBfytHOudvj
X-Talos-CUID: 9a23:4HESOW5YHd+A/LoyxNsss1MsSuUlalHmwVjLI1SoGE9kSua0cArF
X-Talos-MUID: =?us-ascii?q?9a23=3AqUF8FQz9jcxNbjFvJaBMc202OKOaqPWLLh4cnZU?=
 =?us-ascii?q?DgMnaGhxTYWicqDSZGLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="105815953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abtQtQxQeNBdXcB09yF3fI/DhESO9hEO+igId8scy7hDeBnaYAh0cIi/A/rOGtj7cPmLOj+VXdNbBr9xxpDioggYuPDVWn2Eodj6y1S2OtUh87LBgy38yYXGerS0Vf/9TJ0TdI7mPrB0wOOn6sgnXwPtwGgf75Pr4VH25H8F/vcWvOheXpG7dBcrfF2cmeAgtMvmd9T9RFFlpf9sqnb4sfZ7cwDOx/46QIiuY684sHxOA4kPdAiMC/i4JZKEEnzm2vB5TXu8TOqdx6r/pwyikjxsFSWDesdfa5xZ0h09O769EfF/WmYV0CNMOpV+k3i6MMypo1ZdLU85ByBQ9XVnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuuZPu7Chmy066j7TkpfpQXlWqMzk1mCxqd90J3rUZo=;
 b=AqFnKfEU5LhWWRDDXCI0EUXWHG9HQFU/jHAycOzZZZHSJGUGqIK5yVgYTG5Sau7vfzBr6Y9S2FpfCtHgCI8jrRyuWXqH7oNBC9g0pbNhDP5wUqSOKJ5rXSL3hGLvSWC75/o8iQHw4jXsFbfwSJok5phFYpFl+Q/A95lvTTOLIvWxG8KaSQk9SShkiIrooMq27Sq8POQMfcSu6YGTXJrJEGPCnBP/HppIraBOiNONMjKxP5RDOXO4nukzrw4CMv3up6otRy7OdbLEi3ki0ok/HT12yqR5Jw7UlpBM+nh8AUXgUOAZwgdsTx6m4V3ueHSPIkA2DEDreRmqFFJVbAPu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuuZPu7Chmy066j7TkpfpQXlWqMzk1mCxqd90J3rUZo=;
 b=aZZh1/Hm10pKubOftDuRGHQKIe/KymMJoiaWuEtkBLSLNK+PRt2+3w/tctdiV+hDL3uYbJr0AJ8Wf1o0wgKgeaTPeAo8aOPGs0MF82UPn7zABmRBS6Vd2N1PedjWzjgQkMmEdjJ9vvM9EIvUwyuY4SruuzLJtFGk3UEtnKfVpN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fbad5a38-ee41-46c4-6c28-135e992c08e5@citrix.com>
Date: Thu, 27 Apr 2023 10:26:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Gitlab curiosity: Was [PATCH 0/7] Rationalize usage of
 xc_domain_getinfo{,list}()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Tim Deegan <tim@xen.org>, Michal Orzel <Michal.Orzel@arm.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <cf554e7d-5d9a-8beb-b0a6-810267e5c3ad@citrix.com>
Content-Language: en-GB
In-Reply-To: <cf554e7d-5d9a-8beb-b0a6-810267e5c3ad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ccab17-c5ef-4443-edb0-08db4701853c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvLXNbKR3/voa+wZj761R+ssNVHVi5RFiK6fj3Jqkk21KyicmB0BcBC4prxo+hgH9Bvq2lTlQLKiDQUyu+zC3O6LEjvwI+2nWg8ILQqXAIwXJvK5UTJ8BeOn4d/IYnWNxnzpMNTuhopkiYeqrMMI59I/I6IHhN+2gUGrqk7yzzl2t/Db8r3BqHdHLArQ9wssOAO/7mBThvz4qwVeGDFNyWNZWPoaBiYCgk4EYCKApUF+i7bN072JxReB+1jFUiP8SEqWfwDfLJJB5KaO8AEjHUSdEd6FS9q+wN9hcRfSshrxrRVNsT1utqZjCzD99Aoqx3r9Lpvc//rJzd09t885oDn8ltNQMhYD+HRsTYOyFPXFPkF2SmSHEFAKVvZUHYjmO+mobY43+6fBb4zwVjdmJYIkY2pfEaQXNvap0Nui3Na8egkJEun5ASY4koz5/5+KXC5gNBK/XpTNGgu2YuDzA1HC3nqVxVDTTz5hGev5pGNZLx3ay3wOePpzRzXbIiGZk2GNDuHFxdWR4/e8kwrwBWf2hD6p5sEUlVSdFn3g/3+wFS7RPJjbouut5JawVf1i3D0xhhaMMHczQXPYbGcy9Z786tRkudML08qwa/WoGSlOl3vpQspPVOV7WfM1eN88EvVdi5NGCWJiGIUXAYkUDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(6666004)(31686004)(82960400001)(478600001)(83380400001)(54906003)(6486002)(110136005)(186003)(38100700002)(2616005)(66946007)(66556008)(66476007)(316002)(4326008)(41300700001)(6512007)(6506007)(26005)(86362001)(53546011)(36756003)(8676002)(8936002)(7416002)(31696002)(2906002)(4744005)(5660300002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFU4SnY2WGFrd1FPUmhBL2lUSXE4UG1zNXh0OU1iVCt4amd6R3JHMXFUY0s4?=
 =?utf-8?B?aEkyY0FPUElMdG1lcWVBaGM0QklJSitSeGFRS29RWDV5eUJDUXdUSUUzM1c5?=
 =?utf-8?B?YVRnZTdyQitMZURzSGJ2WmdEc0ExTkE0eXlPTFQ2WWxGa0E3cEZGdHltNjJ3?=
 =?utf-8?B?bjllUmF3VndmZGpoOENNWmoxRlo4cDRBdmRZNWpSN2lIMzhFUERTa1luQ1Ay?=
 =?utf-8?B?eWRiMk81V3RMOHdCdGtkRVd0ekp6azI2dTM1M29IUVZ4eDlrRG1WWEVPbDRv?=
 =?utf-8?B?RzE0U0g5SVJzODROYnlmOGZ2MUdSK0taaFY3eHd5aVRKdWhVRmNFSnFyT3hJ?=
 =?utf-8?B?TTVJWjBKUko5WGVxLzc0TGxZN0U2Q3BKeUNXR3RZTkM4b2tZYzFKY0loUlk1?=
 =?utf-8?B?d2FZWnIveEt4b3ZubE9jU1NWcy9yZzZtTWJML05uODBYNk5OcDg3Qm40bXZI?=
 =?utf-8?B?aXZ5alZMNFdER3RhY0lONVlQZlFpN1lsMlNKRGJVRWRkL1p0OGVEYk5PYjdU?=
 =?utf-8?B?UEhLRFRiQnBvTURFREh6L0puMUlsZkUzaTBuZjNPa3VCZWptblFhdy9XQ1hv?=
 =?utf-8?B?NFdkOE9Tci9WS0U3MldPQjNHRC8wUzNiM2ZlYmlSenE4UFd4bHZwZkpGeGNQ?=
 =?utf-8?B?eENRK0lmVmUrNk11Z0kwYlNEbWxUclRTdjltMi81QS9mQ1Q4MU1zRlh0Nktu?=
 =?utf-8?B?OUlCQ1h2T1V6Skh1SnJObnp4eUZFU0R5ckVFQUlYenJXUWVoWVhoYlFjSkds?=
 =?utf-8?B?bTVCMnhOYytjbkllbHMzOGFia2VxektsZktZb21OY3hHaW1LRU9LUnBpUk5m?=
 =?utf-8?B?NE4yb0R3c290Q3dxT2pIYksrbFpVaXAwQW1Xc3JLTlhUVkNrK2tEaWVSNEcz?=
 =?utf-8?B?dHhTR1ZPMzRjMHRjQWpIeWMrTWJZVWRtSk5yWEF4cS9Xa3Jwc3JEdEZRL20v?=
 =?utf-8?B?blo5WDh2NFozVmd5NlJFQzBNdkxuUGk2aG5DVzZhTEViNDBrZ1dIWVd5NUdU?=
 =?utf-8?B?bWZXck9IVmsvWlFZc0F1RlY2NnVQbU9JU2lXd2RhVm9LSUdsVm5NTTluS1pG?=
 =?utf-8?B?eUxqeDQ4WDBLdTNyQXlMcVVYRnZtMmlpS3hsbEtVdVdlanZkalpRZ21ibVJG?=
 =?utf-8?B?S2JVRUFlcjBNbXNSSGhNV1ZGT0hVY3lCNjFUb3RtdVlqSXdrL2lvbEdkQUF4?=
 =?utf-8?B?YWVYN21QakxKK0gvUFN2QlArU3FKNmNzVzVJc3h2dWdBOGw2b2lwbEZJVENa?=
 =?utf-8?B?aC9yZytaZFZSRVU2Zy9iV2gxaytOR3VMbDRjWUdUVFZlbUNQa2F4UHJwdDZ0?=
 =?utf-8?B?eHpYeGtiL0lUTk5sa0RvU2ExSkQrOTVqRXpqUG5lVmpHb1psVXhqUUt3d0ov?=
 =?utf-8?B?VlFsd015Qm5lZmo2VTZYMnh3SEdVVjBqQ1NyakFzZlhVMlZUc0Vnb1BrQ3lU?=
 =?utf-8?B?RlRvY0lxTUt4RVNFNDc1TVFzMjZIWXNPS1gwTDh3RFJ4ZXMwRit2YmZkRXZW?=
 =?utf-8?B?cm13Vk5rc3gra2xFaXlObjFxd1ZQMXFjQXBoVkdhbFhBdzB6Wjhxa2E4T2ZV?=
 =?utf-8?B?WU9WV2pRN2Exd2Q3dWRKZzFtMmVDcjBUYUFnY3ZmYXFZSlRadXdOZEczUFBn?=
 =?utf-8?B?VmxiWTl5d0NqL21kRnlEa3lNMXcvRVpXL0hjOXVicndHdHpla0JwL2JUTGVC?=
 =?utf-8?B?eEhEc00xLzZ3dWNXdVZFb2g0cWpNcitnS0hmTi8yYlp3NjFwSkU1MHpLc1hN?=
 =?utf-8?B?d01Za0tCcDZtK25maEZONnZsZ1BjR09zY0dqMG0zK1RCMElobTBCUGlZdmYr?=
 =?utf-8?B?dWVqVEMwbFpnRTZFaVVtMFNDSkJnS1dOTkxUYm9NSGJpZDI2NWQwVE15TWIz?=
 =?utf-8?B?bHRJOHc4Qkd6YVBCc0JudzBlekFNTzNXSHFYNVE3T1o2RUV3TW0vK1RRMjBu?=
 =?utf-8?B?UEFOU1FNY1NhRjdRSW1CcWhkeFRwczF6ZHF1c21jK1l6R2tmMGx6MUVPMEdu?=
 =?utf-8?B?UzN2RzlYNTlNV2czTURoQ3RERmFkY2FGbVZrbkZMTUMxMWpPak80NjJmMkhn?=
 =?utf-8?B?WXJKMXdaNDB0ZFpWbjcyYU9kd3NPWjRneTRtbUhEVkx2VTQ2NEwrc1dFMFhC?=
 =?utf-8?B?K2g5aEhnZDZkbXVQN2VIQWFTVnkvVnhwRGFjY1RaVUhTOERvemhJSzdEVTRm?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qiuVHo2iA8t5TwFCXjhmO666q7IvcKBR4ZDLTjYIckaObWYrXn+GWzqZv/5ixOdbToKYnVFRGF88wrOsl1i9NswTXdDwUcgg7zsHYRVtOVNHuLYP+OAEBNILNzfBWsmsM1dwsfB2isqsi8XAFBUfAFBD5BEO414aO7bpphE+kkDn+HYwuB0XF0s47Ih3YBt6ctTOFZDymG813IiHqHi24TmWih3sXc+YkPT8N2FGA9z5rl2s8IQGz+DgfOzQTS9I5/7/x+CNVIam5PwaGyHrSebiN94DFmFM0mQETto28L/sIeWpb8IYTiAzCbxvvBnetSW98bFTx0x3aTlNpWsDK7mUbg3YriI3w4xsGGylOUEppQ8jXMNpE7iVlXX5B9HA9WwvheYE+CG3x4lXYtmFNxgocGIhvtJBXfpEOxY17hPtcIKsg+P60LquHWKmgzKK9VkA0j0LjyY+2Jw82+NWblr281jiq2AyUSKi8u34Xa7bYxheQUTSO+3Ctf8oY6mv/hdFpYu3xwSIiTmcDZrtQlAHWqhIlmcBahr2u8mU6Q5n8fbzITWbvllLiwBZv11QtNDpsjBc1FPNviJVirJnFtW8ViyjAYgVkbEe3SYo9pW1ci8NnZhDh1vQulliUwINGJNiLbxg31fUrBRCGKktG5vpTyw9Pldxs8L0wcbgSJDpGxTRCEUoVVxIc0qFguMZNc+vSQgHzqlFc74N4Wf9Cwy7L3us5VH+lqatV2YXiOz29+SlVtpTeJFhv2zzdkwBRHSf5BjS1wNy8oVe3BAnPIRfm7TQRdiBi0A5YFQFYVESFsFL7m+lVOvW+vXSw0MsR9+DQl7wVycOVUp5jUSuN+9PGhupXzg/nOjAenqdqNTYWg/5t31UZJ2QPhhNOZN3VEWbbzscLF0hvGu2gccb0Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ccab17-c5ef-4443-edb0-08db4701853c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:26:46.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lfhji5hADTstREJSSnMn707qi+7vGhiacJz5HYJKZIu4Kj27U9M7CfFcdTPEhKDUAOtKNWONb6SFIq1rTA5BV4DCmj2VV48bHCE4VehGgvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5026

On 26/04/2023 11:30 pm, Andrew Cooper wrote:
> I've rerun the pipeline a second time,
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/850230144, to see
> if gitlab thinks it is a reliable or unreliable failure.

It passed the second time, so I'm pretty confident this is a buggy test
with a rare race condition, rather than a bug in the series under test.

~Andrew

