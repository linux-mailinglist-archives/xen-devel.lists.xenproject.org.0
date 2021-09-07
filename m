Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A71402D87
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181273.328363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNefL-0006Oz-UX; Tue, 07 Sep 2021 17:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181273.328363; Tue, 07 Sep 2021 17:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNefL-0006MG-QX; Tue, 07 Sep 2021 17:13:47 +0000
Received: by outflank-mailman (input) for mailman id 181273;
 Tue, 07 Sep 2021 17:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNefK-0006MA-4J
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:13:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b996f2e-ce1e-40d3-8f9c-8ad88b944c99;
 Tue, 07 Sep 2021 17:13:45 +0000 (UTC)
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
X-Inumbo-ID: 9b996f2e-ce1e-40d3-8f9c-8ad88b944c99
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631034824;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GJ3bNmTS1SCgQmc3iJNrcycJ8ksUb33jC2GsqzoyOMY=;
  b=TmkorK7brbNkvBlntW1C2GUuCVh/IyIe9ctxluPM0qFpKD8cpMSsmWXh
   qhqhghQHelnW2HXPm5GOHs6RplKStIYgda2C1Es0Llf0EIGpUNYOZTsv5
   CiAi9fnXu+8wB/UAm31ZJvcl/YaCy5PxHmGR7LnW/1zLGzRYdfaaLs2w7
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xthbV/wYKObH9XYXDBoscF+DLVj3fg2Le+AN78iur3lWnjc+uWj2fX8qjGAKO/1qWBW7TGjJc0
 fetO4bcq12gxg+rBPwLHlIxiyowWVrPBO3IodEBFFjSVgxMrZfAuY1r0uA0+OvOu0MWORoRrCZ
 WjKMsuceHcFgC9tSTgsg8t7jVf5S7uM9a1WgINK7kRDfO3OxwmAd4euiC3JAByTLH4YzLRSaV3
 b/pdb17PzBAgATKHZwXbwr+If3sO9Q2dRLgS0Gzx8bX4tMIF+XGl6ubL71xLkW33JdJoI+HKrf
 3iCfjTT4JCWedPBo7mKaz15Z
X-SBRS: 5.1
X-MesageID: 51782389
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QrjXcqAsKD89qOTlHemQ55DYdb4zR+YMi2TDsHoBLSC9E/bo8v
 xG885rtiMc5AxxZJhCo7690cu7MBThHPdOiOF6UItKNDOW3ldAR7sSj7cKrQeBJ8TWzJ8l6U
 8+GJIUNDSLNzdHZGzBkXGF+q0brOW6zA==
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="51782389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAZ7dx2t6MPKD/Cwl7e2n6jSgZObv3CFTvGCVph/DjqGibmqqEAjl7VakRqZSyslN0Xk/ZuBKjCpnI4j8RGoCUogvHK7X51uYn6dbKHdgWspvhYJBMed/rT4YuYtVrvecWgg0i5+iZb5EPIi7NpSl2R6P/wYce+s38hF0x14gKn8UiTUYbRacAHPQhj6ZSfT3m3HVEwohInn2bP8UjjIV6wKCybqyLlmNKvRQ/A5bBaSbktSdOjxfiekVMY/o4IoYdqo0f8gSj4z8Ld7K2eNuKUxgh3S88VD/OEoAVyv5GpNfAy+3whGI77zTea42niBygFiNKB6HGfZH9JwGq+T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GJ3bNmTS1SCgQmc3iJNrcycJ8ksUb33jC2GsqzoyOMY=;
 b=EA6KHDfd9OxBSSOH3w4COol4f9i/QwkChFKl87s4Cq0nTYlUkC8nA8t7CzUKUWVaYqdtBE0CloExRRxriXkw65PITgo/ULbWSJRZmN4tEyzo3lKKsU4hiYxbR4N3gDfAX0GbVQT6YYjYYJt0LPKbs0jRbFCiOqOj39XGyQm9E6gvprMnpqc+HYBRyZeq9O6BnhBmfn/fp+CYPJ9HSUeWM4XNsDPrhZ+AYDiCx97PRTeFktub+LAYlo9PeVACV+irB+0BMatFr7om8UHck60Xs7ZMpdDsTigV6qE0cLuqrdxUSSAYLhyJDdb881bqAw1KDX/jwv57FnpZzCm5faGCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ3bNmTS1SCgQmc3iJNrcycJ8ksUb33jC2GsqzoyOMY=;
 b=DolPnkG8UAcZGy6OjHGOedRs3Z2a/fEqQMQu4MFO9bcRlAdo+qxqc7VCcAtjVEaqBhQhBwMjS+z5w2KEKHSIsWxyAM/ky4qrOYv92sK8zTvpyvtY+7zK+SgkMHZTwiLG+usE7qsAG6Grv4lQbzrnOmUu8G1QEAPnAa40vsF4HWc=
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <5d6e8360-7ba8-487e-0ac8-7f517e560520@suse.com>
 <42aa8c24-7f23-deec-6103-f2d556e4a9f9@citrix.com>
 <b3db56ae-7a53-ee22-d821-d711b0d0bf3b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 07/17] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <3f9722e4-704b-8f68-553d-04a3a3189d99@citrix.com>
Date: Tue, 7 Sep 2021 18:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b3db56ae-7a53-ee22-d821-d711b0d0bf3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 455a7645-da4e-4d03-7d72-08d97222d774
X-MS-TrafficTypeDiagnostic: BY5PR03MB4965:
X-Microsoft-Antispam-PRVS: <BY5PR03MB4965DBB5D3A483048B0ACD7DBAD39@BY5PR03MB4965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAhLbOA+3AX5whahOBH0gJdWUAh8V+z+SVBJkvaU206exP1awKVvRVkC/D0Q/PD+/G3G/cnP5WJPIYOqROun7nTvwwKf0CQLXHJOhJIDJ679QBdTlbpYX65FJIXsa9WXvEn9aESK8NWzK1jv/YbJopYqrBiCtn3LmXWJ58fk/veZgtsvWx4OjQbPRx+th9UcQ+9Jc8AVKS1J7hAEN26ThivD679kXZLi03JQJ+KIIO20EWOZidTc3BWb8l3546cfGLH9SwrDJmndJIH6nzhQZcgbZO9gPUS24GXY+rlKjDUuOaRH2jha+JyCIEWegGkjI4WRXCNv/yqKi4rHH6+Rkdxb9ua+sjZzT8i9tgAOKwtv3Pvl01OzG74omgFR1xSn6x3zGPa6RwHV9OZRMBIEWHHpOc369f94gioZ6eo+82zI8SY+BxLxChAdj7SiezfVGPOBnlyrHDFZryZTRQmXWZ6rlDc4HegQK7LRoPoaWD0X8q41fl/txzGqTWW4/dPCKyWoHJlnkigVvWkSvOkM0e1qTUdYD37CxT9hY3lOsYNB1gMLi2e8k1iYGJ2ksfuqUfXpOWmPB9uT8OjjbV2r4Lyd6KbF+Zq0NUW9Qlr/+2wgE/a2BUuoVoxwqHWpA1nfBvLGE4Py2QWIeiyJwgq6xzIMu1Om+8uyVD1AGzXpODoVZprEHyeTFGIkEViBc30qDuBTCtUu8iS9MLucFzVcu8Xef8UzZH/Y2eX23ZzzP0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(186003)(53546011)(86362001)(478600001)(36756003)(8936002)(316002)(5660300002)(6486002)(38100700002)(31686004)(66946007)(6916009)(55236004)(66476007)(4326008)(2906002)(16576012)(31696002)(83380400001)(26005)(6666004)(54906003)(2616005)(8676002)(956004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpnWnVmSGl4cG9QdU1aT0F4K0J1bXVPUyt6Zk9FR1gwd0dXUm9DMTF2dXow?=
 =?utf-8?B?RytYbTJDWjFURnZQVnVFdWQ4YU83eXpUNHQrdm5Ib2NISEQyS3ZyeVc4VVFV?=
 =?utf-8?B?Z2tYdWltSDh4Q2k1cEQ1Y0pabFBnWFlEbmxlUC9CMkxvQ1BRVlB2WE5KNTFo?=
 =?utf-8?B?SG53dmVkZGlVU1J5bllibW83V24yM2V5d1BHTGhrY2xIQnNLRkhZYklqKzVm?=
 =?utf-8?B?UW8rN0U0K0NuZ2orK2RWb0hYWHdmSHkrRWRJZlhOVVNTWEtLZkxHcWxwaXRP?=
 =?utf-8?B?VCtwdkpSV2dYQml5d0kwRll4Q082RG4yZmlQV1ZMalZxTlRNSG1oNHNWSVRQ?=
 =?utf-8?B?TEthQjFicWZ4RlBKa0RrMGZMeXVjN2tsV25CNTV2TDFyalhCVm5zYVVtRkJD?=
 =?utf-8?B?LzNNTE44RHhiZmt6T1ZXbU9yZTBUSEU2L2FIZWVHeUs0QkVPcE5BUEorSTEv?=
 =?utf-8?B?YzgvNi9WOGlyeWhTUDVEa0I5RGRScWN2QVlHaGJKY3A2UTBjVDMydDZHSGVW?=
 =?utf-8?B?dWM2aWlxMkRXZjFRTDNPcnV2Y1hzbGJjRUxHd0VYbVRiTENzSldOS0RUM3FY?=
 =?utf-8?B?STZEVUYrM1lvMnd3OUp0eExsU0MreDVPenZaUGllWXNDaHdGMThEMGl4cklk?=
 =?utf-8?B?TDJ3b21EdjkvMmMxZTNoZ1NmQkFET1plRWRteXNYdG5jcmg4Uk9GTklpU1Mz?=
 =?utf-8?B?YjZwNjdKcWNURkJTcHhSOXIxaGlIUFZXOGh4SFNURlpzNTc5NXduSVVrK3Qz?=
 =?utf-8?B?ZXFwQ1RWVVRvRjRNcit6YnZvTzZvL0lyOUEvaTdpSWZqbXR0bTBSOGFEdEtG?=
 =?utf-8?B?bVpNOEx4L1VEcXExclhiQVg0MGFzeVF6OFZMeC81bHhjMVpOWUFiYXlkWGo0?=
 =?utf-8?B?Tkl5NXMzdHpjbU1JV2dHZGRaeHUxTU5vNll1dCtLZWxaMjliemRlNnBtV3p0?=
 =?utf-8?B?cDd4NUJRWXp3cWQ0NkpyU3dlS0pIL2pIVkVnWmE4ZUVWZW1VRWRjZi9EVFdB?=
 =?utf-8?B?WlNxTzBGT1FTV2IxdVlvVitXaFlDZkVjOVdZSjh1RHpzMHJQWGwvUmY1UnhN?=
 =?utf-8?B?SFNkYklZMjlGNDlDN1NPZnI3YW9oSzEwTmJ6aFhNN1dOempXajMzWUUwam0w?=
 =?utf-8?B?bitScWdpck10MjhEdVh4Y0hOdWJPdFU3NU1pRGxUbm43V2hncHFhUUxNSTZo?=
 =?utf-8?B?OEdEc09tcER2UkNlQjZkZ0c5TzZwUzEwNzk5TWFqdGJKamhlVWI2Nm9xSTcr?=
 =?utf-8?B?ZnlrZW9HZEkrbWtDSEdlOFVacUJCd05CU3RzLzJFRnFxMXRrZFdiR2grdEh5?=
 =?utf-8?B?bnNVN1dwcU14NUNhL1hYMllwVWtxUFNIYjV0Ym8rM0tBblNvdStLdnFGbmFx?=
 =?utf-8?B?V0JwSTZpc1I5cjlQOG1jYy8xY21sWm5ncGpUbFNEZ3pXR0h5NjZ5SW56b1Mx?=
 =?utf-8?B?enRGWUdXaTF0S29DOTB5NXVXaG5kQ2p3TnhMYnlrdXhhTnFFaG1OdnJyNVZH?=
 =?utf-8?B?U0hOeVlCV2M0bTNZRlc5OVpCL2s1UDhOakVvRUF4dm1PZjYwNE1vUEJPMDhE?=
 =?utf-8?B?NFAvcUljdGtSNEtuRFBBQmhjZVJaN2Y0dEhLQ3I0ZnBDanFqNWVwWGI2bDlS?=
 =?utf-8?B?Qm1pZmVGSGRjeHlMRVpCMHk3akdDMGV3eSsrbWxTY0VjbXZyMXhCdUVEdkRJ?=
 =?utf-8?B?VWVjRjdoV3o1T0hIbFZjOWJ4YkFUUlhmMVNvUGJhckpRSStXcnBsNW9zU3Fq?=
 =?utf-8?Q?HkHQbPhbGSbu/AI3tCujzYfl6V5Fl75IsxkPNms?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 455a7645-da4e-4d03-7d72-08d97222d774
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 17:13:42.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFZG24g9Ki2IkBLBZLaFaoglD+PQvcDLK6SuRREk6pqGzMChZNnwFwEecJ4uJ3bGjxrjMxtKYLd+hLnqV1vUmasRXqsoFQMtpf9Nw1rY5lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4965
X-OriginatorOrg: citrix.com

On 26/08/2021 13:55, Jan Beulich wrote:
> On 26.08.2021 13:57, Andrew Cooper wrote:
>> On 24/08/2021 15:21, Jan Beulich wrote:
>>> While already the case for PVH, there's no reason to treat PV
>>> differently here, though of course the addresses get taken from another
>>> source in this case. Except that, to match CPU side mappings, by defaul=
t
>>> we permit r/o ones. This then also means we now deal consistently with
>>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Why do we give PV dom0 a mapping of the IO-APIC?=C2=A0 Having thought ab=
out
>> it, it cannot possibly be usable.
>>
>> IO-APICs use a indirect window, and Xen doesn't perform any
>> write-emulation (that I can see), so the guest can't even read the data
>> register and work out which register it represents.=C2=A0 It also can't =
do an
>> atomic 64bit read across the index and data registers, as that is
>> explicitly undefined behaviour in the IO-APIC spec.
>>
>> On the other hand, we do have PHYSDEVOP_apic_{read,write} which, despite
>> the name, is for the IO-APIC not the LAPIC, and I bet these hypercalls
>> where introduced upon discovering that a read-only mapping of the
>> IO-APIC it totally useless.
>>
>> I think we can safely not expose the IO-APICs to PV dom0 at all, which
>> simplifies the memory handling further.
> The reason we do expose it r/o is that some ACPI implementations access
> (read and write) some RTEs from AML. If we don't allow Dom0 to map the
> IO-APIC, Dom0 will typically fail to boot on such systems.

I think more details are needed.

If AML is reading the RTEs, it's is also writing to the index register.

Irrespective of Xen, doing this behind the back of the OS cannot work
safely, because at a minimum the ACPI interpreter would need to take the
ioapic lock, and I see no evidence of workarounds like this in Linux.


In Xen, we appear to swallow writes to mmio_ro ranges which is rude, and
causes the associated reads to read garbage.=C2=A0 This is Xen-induced memo=
ry
corruption inside dom0.


I don't think any of this is legitimate behaviour.=C2=A0 ACPI needs disabli=
ng
on such systems, or interlocking suitably, and its not just IO-APICs
which are problematic - any windowed I/O (e.g. RTC) as well as any other
device with read side effects.

I think we should seriously consider not mapping the IO-APIC at all.=C2=A0
That said, I would be surprised if Linux is cleanly avoiding the
IO-APIC, so a slightly less bad alternative is to redirect to an "MMIO"
frame of ~0's which we still write-discard on top of.

That at least makes the Xen-induced memory corruption behave
deterministically.

~Andrew


