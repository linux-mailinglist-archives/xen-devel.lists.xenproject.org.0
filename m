Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3B358FD1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 00:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107558.205570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUd8j-0004iu-C3; Thu, 08 Apr 2021 22:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107558.205570; Thu, 08 Apr 2021 22:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUd8j-0004iV-8Y; Thu, 08 Apr 2021 22:28:41 +0000
Received: by outflank-mailman (input) for mailman id 107558;
 Thu, 08 Apr 2021 22:28:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94b1=JF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lUd8i-0004iQ-57
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 22:28:40 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7508017-c9c9-4e8b-bdf2-67658635ad80;
 Thu, 08 Apr 2021 22:28:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 138MORjS113138;
 Thu, 8 Apr 2021 22:28:38 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37rvagfgxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 22:28:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 138MPQZj114716;
 Thu, 8 Apr 2021 22:28:37 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2050.outbound.protection.outlook.com [104.47.36.50])
 by userp3020.oracle.com with ESMTP id 37rvb1sevm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 22:28:37 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2535.namprd10.prod.outlook.com (2603:10b6:a02:ae::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 22:28:35 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 22:28:35 +0000
Received: from [10.74.101.36] (138.3.201.36) by
 SJ0PR03CA0144.namprd03.prod.outlook.com (2603:10b6:a03:33c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 22:28:34 +0000
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
X-Inumbo-ID: f7508017-c9c9-4e8b-bdf2-67658635ad80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=VYSnf9l1OC5O8EYLNRYIZUAWKQaSDVwJBLhdBC1FlwY=;
 b=ZMlPSRw26xZapslhAcdu7WtcORkNC6yJ/hsEHEyQdXDGIQiD3kMMWCDzZgd5d8T/4p4D
 MIsdp2CC6uLNpzzK1tgqtoqqvjSLMt0o5lI32fNnXeMr7nTiWeVSSX5/kIh66SP0aAso
 QwMfedk8CIuorQ39fXKOGyp5Y5eI0GmWCaW0YHtvdNHSOyz5eM0KE7FmbD+tT49iQQ6z
 w7DH9X+dohUo1/wPRJWzECdM4cSoPrqMDphZjeF+x9z2P9rMrtBXWxVazylVUZYo67pZ
 JQrYQqwWzwmdhltnZ1+exroZFYNT4FfqcG0H8T8X/xtFKe3r/lI/bb8vM+8kSKrBRyNv yw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QErKCI/UTYIdNKZlyKMNGfNZZeFrSFByXm6WJ1ipit9J+e+Xv5lJTgoJsIMMFcIiJFVvBNseL6SabnkzeQMfT92XB478lWac61ORMnKzNriMGc5lHrQvGe6Fu9bINMa0Vc+Cq5HjZb/PiQLe2rqX9KdUVT4wyBjbB84Ncvq7vLrV4bJmZJ88DD7T8iQMkw1Yo33E+lM1AhdJmSwYOmdwfbGtdPO33xreDOiZwPaCZ5S3dwOKooUL48ARj7wqJC382q+9mfZRsRKzcu0dYtMNhPrVap2Ub6z1LHI3TwngjLHBiqFP5jcCzZMKhycgl42N1UYZVW554pgleBm39zYAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYSnf9l1OC5O8EYLNRYIZUAWKQaSDVwJBLhdBC1FlwY=;
 b=fL+UUqyGGS3/pyCRiWLZgFLB52kUfi61Nv7cFVWGfEsQja4xu7zn0LFX5D3J1XcqLp6q4RaBlbHFmrFptf6Qf0n7EVVvnHzg4eJ8ne534FyUoeT/7q869qw5kMYaLtYVgBcq6Rl4Xx0FGp7hhShQxxQCSRszSIXXxm+PeM/TcGXYXQLYgsyf2s/W5S7ogQ5hPLBbnRnp/vDqioxVWv55BTlE2mnAguGwm8OFlXwR+K6XZRKgHr78SV8iSCGl+mIDX794RGzu8wVhvrnCGIU5q3yCV1aTy5XcDbSxFBlKxkE8Xhc0irmCdF4ZsL/HrMzl730pCi8cda/QN0q2JqyWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYSnf9l1OC5O8EYLNRYIZUAWKQaSDVwJBLhdBC1FlwY=;
 b=VQF1h2GO5le4EAU4EVYp0Cn5YKcpCmV3T3OlrC02zxLYVrKUCryjxssq1YH1kcGJ1dy/c9jVMkdKVgHUS+sX5CfhIcWKl3AfDiZrEZ6i+tv7x/1H7SYXKHdgRivkL/34AejmWB+dUtmfGWsw3dO8w2+8zy68GaPCh6RlXf+7Byk=
Subject: Re: [PATCH 1/3] xen-pciback: redo VF placement in the virtual
 topology
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <32d6a8d4-c06f-7fe0-1376-4b80fac8c6de@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <b41663ff-6a90-877d-9cd3-7e052c28eb6a@oracle.com>
Date: Thu, 8 Apr 2021 18:28:31 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <32d6a8d4-c06f-7fe0-1376-4b80fac8c6de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.36]
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69846650-4792-40db-e9f7-08d8fadda5fd
X-MS-TrafficTypeDiagnostic: BYAPR10MB2535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2535F1C29B8B2C67EEE2D7DC8A749@BYAPR10MB2535.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uCOfw1I1TSm21f/0lcT9KXev+XwX7zRtmzNPS/JOnuD/yEDEWb8iaDAe69pSxx2KeoFlTLbHcibul5kN9WHCoBPBZL+tiOYIxkVsoxALNCwVgshaExCP37cecTRh/+a1mm3HYciy4eYUOxvPauqI+2snsTUoGiU2AUdRRVFSXSm0E8K8V7XrXw0cJwp1atF34NaYXbF9UOisGYR8AXyHluJnx+nwjWDov7SlNoUfEuUAPc09VTsK4LUG8yzkTsLGuYk+95Tdtmzug52Qtrr8aKiSsP+1bJqhWVQ6e3BL1lv8/rCFqfn4YXDOFxjaDOXvraMPoxiR8oyX+6xAQjhZIBOrMtfCgrRX3dNKvfoTD0Uz9Vz7CU+z7CfiaVyvWUXhpSk2Nhj/Jel/YDFzpDDGkT58WR0avF2ZodWO5tOt/bmDLLB3ckWCZzLjlBrqQuvOm4SdI6W/Bs7f8C9fpjXTFVuZATzevxzuE6rWqFGBj/NAEEztaKRmvKRKEAU8Xo0chZadSm3QXuR33OpvEzuxq4WiZVJLuCRkn5+Y3T2i8MRcjrV6UvL/my1v5NrvGYldRVYzeN4YaZbuLZxAz7zrM19l5/lbZFXTn2y3E2KIrCtZOJysqNaVzyr5Drat2qQnJ5Wc7F830rJVAgZG8KDTE3M+au6G0VraclP0TglPAAFzcGV+J0hy8OSnaXljovbCClQADzIsyq8PBq9x+2vEvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39860400002)(396003)(136003)(956004)(31696002)(31686004)(2616005)(83380400001)(38100700001)(86362001)(44832011)(16526019)(316002)(66476007)(4326008)(107886003)(66556008)(186003)(36756003)(6666004)(16576012)(8936002)(26005)(6486002)(2906002)(5660300002)(8676002)(53546011)(54906003)(110136005)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SzBKMk5FNXR5SDl6dGdkT2VRVHJwWGdycUpQWVUrWmxTOFA0K0hWQWk5Tm91?=
 =?utf-8?B?Yk0xSDdSMEU2WjV6d0RlcmJ2ZHNLcWx4bTUyZmRHUVhBbldFQWFFVWZmbDJI?=
 =?utf-8?B?azNqQ20wVWJ6R1NYNzAxVVpqUXhpb25xWmFhTVYzMVlhQzFMUnBkT2NmSWlr?=
 =?utf-8?B?QzZkMFd2enRiM1plVXZaOExzZHBjOU1uUm5zQlQ2VWRpMjVHejdteUpOVW9T?=
 =?utf-8?B?OVlULzA1Wm9vaUhvOCthSlVhcmdKVnZzUU9DdW56Wkx1VkhiUDNkZU5TSE9J?=
 =?utf-8?B?VE1RK3RoNXBZME14Tk90VmQ2OUl0bzQyOGJpRXQ5WEttS3FuZ1FKS2dWTkhS?=
 =?utf-8?B?QS9kamYyeFFSTVNMcnBlVkRoZ0l0RlB2ZGRqN0pYamk0THhJYjFRblZQMlZF?=
 =?utf-8?B?WW5wTFBDUXE1a0t3MnNIYzZLNlVJT1VxN3lMYmx5MDQyU29TQ2ZMZGZRNWRy?=
 =?utf-8?B?K1VGVDlMc3VKK05sVlY4M3czUlBLK0pCeFZtODdJSFpoR3JpSlBPNmsyYnJi?=
 =?utf-8?B?UW5GMmtuVjNEM1RCdVVhTXVhc3VQVGpDei85L0ZFeFk0WVNNU0diSzgxb3pE?=
 =?utf-8?B?KzA3TUVTRzdIZkJmakpqbmxyeUtNMWlERDZSaTF1bHhWMFlvYnMyM0dwNnNt?=
 =?utf-8?B?Mks4VFdyb1JSQ1A4QjBOSXFHWHVEQlpRdnR6SExyUXloN3FzVVhRS3RvZzdw?=
 =?utf-8?B?RlhXWjVOeHRRZXR4WGF0cDg2Z1dERzc4L3ZBcE9rNFpzME43a3IzS0VOYTJQ?=
 =?utf-8?B?bC9xWlNScXFyNW1odEp2L2ZRZkV2SmRSeDRmVGN5ZTFHdDJ0blhRQkR2RG90?=
 =?utf-8?B?aXAzVFh2SnNNSDZxN3F4YUtIb0RkY05OVDd3RlAyN01kRHFqWXVFZjBxL21t?=
 =?utf-8?B?aFZIRzJXcGQ0NHhteWJOcDkvSHlTVnhuaEw3ZmJFQTBxSmF3YzFrL3MrTjNq?=
 =?utf-8?B?Q0J1SVhaR1FRbVA1T2U4d0MrcmM4ZEJtVS9MMFEzb2VWeEhhdUxDaTdRL00x?=
 =?utf-8?B?SHF0Q09VaDRrN1JYV1p1R0c3L1ZwcEszcVpEYUJUSUIrYUhvWFB2VmF6SlZ6?=
 =?utf-8?B?N1BNOVVRb1NzVHRZK2dHY0FRYUpxaEFreWdIcmw5OE1QOC9RbURMUkV2Tys2?=
 =?utf-8?B?THVWUVBpOUg1dEw0amxWb1RGcHAyckkvV3BGOWMvYnlxa1QrbHJQdkxqeDVT?=
 =?utf-8?B?akdXMHNEdUJLSFBkaFoycW9xQ0RuMWRrenlERmx3K1ZLSEVwK1lLMmVlYU5B?=
 =?utf-8?B?cDVudHUzbXVubS9lbE5yNjloKzBnOCtibWpQanozaVlhNDJtNVhuSjFHcHVR?=
 =?utf-8?B?VFhQQ1VTcVBpdGR1TmNLb3BtZFdwRG56OWdWMlBBR25td29HQnc4SXljSUNQ?=
 =?utf-8?B?VGt1d2NhNGxXWlA4bTJnRjY0QjZRN2ZyUFRUYWNLa1pmdE9ITUZMMUNQaWdi?=
 =?utf-8?B?ZEV0d1UzeEZuUmk0dWphaTduQjBPcWhickFiaWcxNzlranFBRDVoMFRwZGR3?=
 =?utf-8?B?Q0lNUXhLS2tkQWN0MXpWcWJ2Y3Fyc2EzeDh1TURoRzdpSmthOGdMWWdTamJy?=
 =?utf-8?B?bWxSNGtlczFhT0pGM3cwdnNndlgwR1Y2YWs0QzZsRmZrbElTbGkzdkFPZ25O?=
 =?utf-8?B?RytsYWgxQ1Erd1Vrc2R6VDRyMFJiQUIxcUtJSlduVXNDTXdTYnlQZElNRGdl?=
 =?utf-8?B?WWxyT3hmYUEzZXAwRGJuOFFrT2piZWV3d2tydDlJRXU1REFVbUpucDBabFNh?=
 =?utf-8?Q?dyCGjMnUM0cr1jKjU2bvHkq/WrUAP05TaUs/WGz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69846650-4792-40db-e9f7-08d8fadda5fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 22:28:35.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS4jSoRleo06UGMn8nBg15ukb/kPrjBkuYw3GLirjZxuW3K4hTGotOxNpSfyVqHwvP8vIJdAmhGUN12QmfMJ3NSzg5W9fUr06qUGGADO8DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2535
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080147
X-Proofpoint-GUID: VVNlyBSqJEAZgcT_r6-l84aLcoASG6Ou
X-Proofpoint-ORIG-GUID: VVNlyBSqJEAZgcT_r6-l84aLcoASG6Ou
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080147


On 4/7/21 10:37 AM, Jan Beulich wrote:
> The commit referenced below was incomplete: It merely affected what
> would get written to the vdev-<N> xenstore node. The guest would still
> find the function at the original function number as long as 
> __xen_pcibk_get_pci_dev() wouldn't be in sync. The same goes for AER wrt
> __xen_pcibk_get_pcifront_dev().
>
> Undo overriding the function to zero and instead make sure that VFs at
> function zero remain alone in their slot. This has the added benefit of
> improving overall capacity, considering that there's only a total of 32
> slots available right now (PCI segment and bus can both only ever be
> zero at present).
>
> Fixes: 8a5248fe10b1 ("xen PV passthru: assign SR-IOV virtual functions to separate virtual slots")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org
> ---
> Like the original change this has the effect of changing where devices
> would appear in the guest, when there are multiple of them. I don't see
> an immediate problem with this, but if there is we may need to reduce
> the effect of the change.
> Taking into account, besides the described breakage, how xen-pcifront's
> pcifront_scan_bus() works, I also wonder what problem it was in the
> first place that needed fixing. It may therefore also be worth to
> consider simply reverting the original change.


Perhaps this is no longer a problem, it's been 9 years since that patch. Have you tried reverting to 8a5248fe10b101104d92d01438f918e899414fd1~1 and testing that?


-boris


