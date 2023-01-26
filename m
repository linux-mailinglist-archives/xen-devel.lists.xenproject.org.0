Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF767C2E7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 03:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484679.751390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKsG7-0002MV-4c; Thu, 26 Jan 2023 02:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484679.751390; Thu, 26 Jan 2023 02:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKsG7-0002KD-0g; Thu, 26 Jan 2023 02:45:03 +0000
Received: by outflank-mailman (input) for mailman id 484679;
 Thu, 26 Jan 2023 02:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqmz=5X=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKsG5-0002K3-PV
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 02:45:01 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c48b0df-9d23-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 03:44:59 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 02:44:50 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 02:44:50 +0000
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
X-Inumbo-ID: 6c48b0df-9d23-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ste5XnmvEcriXvXq/ATwzg61Ckz+VNvBnHr1RseZq5qj5fbcgIjqh5/iUXixGDsRbfxX6ggx4ZyAMibpbBJpEjIv6VqBJM/yJveE6jBi1WasrXsonXPxWGzK9NITofE3eCv4QeLwsDSU8k+79Z8hRMHVCLjvwurljetd0/TL2HejDduvGpIprV+oTmTI0gVO5CkNPcxBlmO5dTvJv2h17bd/ZPd5KZy8uhJaNht0w3+xZkPq9Eq8Qd0xShhZPAqKbTUQ5QYTB3EVqiPchg+1dueoItqwj3IxTFWeAMlTSL+dUSXhnBIBwA7JYq4z9vTovImNVbzNmKK2uN9Ib9NI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlvI8LkXToqzdA3+aPRP1u9+dN8LW4rsDNqSst6ck3o=;
 b=iAlvDPt43YZmhCFG146wM14pMaRY5849IXTaIi7n63p3zgEtzrKGOpIgtyt1Cf5Hxc6ZlZp2RW2fe1sBv5j6c8jNMrSXg8XLsSjIP6PeMEjGGLqOEtJkA8Us3GQ87/dMsZI6R3+ScVIjcs97kcH0eygZt7zPQIZ4wqYGyRdScjlOynoFuXVeaRvxXkwDj8QEF0gpY7ysAQ9LI9hG1kIugRefVvZ077tJJXsc9Tr3m6AuZs67U0J4vEatePgtL+E/JU8EfjE7zoaNn7hvaKPdHy+Jci8an4Z/vXMkGjeXBGXvlQri6dEWwI+vGC0JAN7OiKVYqHm018AH+hCu5bj4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlvI8LkXToqzdA3+aPRP1u9+dN8LW4rsDNqSst6ck3o=;
 b=utuKKBMdWOQXkk+KTqnNb49FqXiRgl0maSdw6798T7ksZoeJoi10S6MRvVCPBxeSSppdI91ffpWFEUWDamd5jc502EW2BeHME8QMBtQ6MjsYvf+4Q5bC16rUyr0anLUCyrwiXyF9mxIzN/CI/UQgBZpA4pz4Lsf5BOgOhtyRV7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6bb030b-406a-5a07-f089-2382bdd46e3c@amd.com>
Date: Wed, 25 Jan 2023 18:44:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v4 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-10-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2301251410440.1978264@ubuntu-linux-20-04-desktop>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2301251410440.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: c57ce31b-6a8b-4479-e274-08daff474b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nHrgwokLaRcsjOFVSdFHPpbNMamTQHmdFZbc70H+KUyN1bJf8hZeDLvQM26+DGsipBtadJR34q+uaXifleXh3RLcU+pHM0ejpGCAC8vryHeh9Bsft0WjUUciKMMJBr8QmHeAuvrjXdZVLq7TvBYDh3IPrrVi62L/8lG2bIbrIhcq2ejsEko/ZLdzXvmOpTjb0qdxaIdVciZffdj6UqVIh2Gxh2yQc5VP5SfA6agfZr8dVpVCd+joe+XqHZgwGkrq0B3i4wH7Lh8artu2YhMGjW4SNT6HcfsjbHqyuysLgo6XDu/s35dreuPTduTka1T/HkX3jU4OTBqhWM6V1O42lhSe+M4liLqVRDaQJCf5GMK3wTkMwDugCmH8lPsOgT/EUgVPd7jMvo/5kqmHWAVp0ZlmOI/gxELXHfJd7zOcFo4//dmdk7ahOAx5vpCxPT2Ts+VsPqtrRvGVtCvHFeQgrdB1yR2eBPDbWVX1UHuiR9gGbOVMCZL7CjrM5Strq344s7yHQyYUqrzAUsBfeGaWERHH2ue/BMsnPKc4BlcOfcJrSfzhakaJhUxz5um3Rc9CjbGgNXBHJN5NKgSCKE5ft8ABP57X97z3Zm/ldRnWj18T22NzPGrmBw/tfcdwWVymD4ng3lRh+5TxN5pPTJTWtxLQ5jXys6VAqSqa01NSib/PU54OdZ7XSLDQj2SknUw18+ojUyNb5d+i2Cc7jAubzs3lzfqZ89/OgjOoi+5CfYJ8l/TxiIxKPELHoBrABWK7I0XSIDBH5S+mgHUk1gz9Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199018)(66899018)(2616005)(2906002)(36756003)(41300700001)(86362001)(4326008)(44832011)(83380400001)(31696002)(30864003)(66476007)(316002)(38100700002)(478600001)(5660300002)(6506007)(6916009)(31686004)(8676002)(26005)(966005)(186003)(6512007)(66946007)(53546011)(6486002)(54906003)(66556008)(8936002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2ZHdWdQbnZ4aWZWcW1LWExlZ0tXSWQ5MEpkSjk2dlMwSjFjaGUrd2J1NEtk?=
 =?utf-8?B?WUFaZm1LOTBmb2pvMUdwMjMxNTlYdFViTVVFdG5vUTdaRHh4QjdraUxFSUlC?=
 =?utf-8?B?MW1tdmovU1NOZGRQdldnV1ZjazN6eGJ6WXZxUUdDOHJnUUVqdGt5N1d6SjZ0?=
 =?utf-8?B?NDYzdDF1QUdmRlhnY1BOWXZYdVpsN0IwbzNBd3NoRHdobUFJZWhKOVdnSzhO?=
 =?utf-8?B?YVhPVkV3NHNhTnplNGRMaDF2SVBtQWdaOXQvMEd3KzU1d0xmSkE3TytMY2JD?=
 =?utf-8?B?TngvbmVXWHRhckFtQ3AreGhOUEJZN1BVRlkya1F0OHpNTTJxd1VHVXNMV2hG?=
 =?utf-8?B?bjMvZFNpdXozWk5Pd0ZncnVtU1RyV3BvQjZkdTQ4ZHpTQy8rMVZmeVViSERN?=
 =?utf-8?B?eGVaWm9CWjBndy9IdklzZ29YL2xJUXVvQ0pIWVFNL1cyczhXQnZOOHk3WjQ5?=
 =?utf-8?B?OFVpMUNXUzR4cUlGdHkxZExxUlNVLzZad2s0c0h6SC9OeWV4QnVUQWdrZFBq?=
 =?utf-8?B?MnJ5MlNmWXJNR1l2alBEWUdOQzhUTUlBVzQ1dnIyUmFVaGVlYmlRNmxWSjF2?=
 =?utf-8?B?alVDVnV3c1Z3Ry9zNGFzOHQrN25ENkdEREJZQ0l3ek1Td2diak00SnNBTlk1?=
 =?utf-8?B?YnVMaENSeXpSRFQ2TUtoWWFtSzIwMXFzN0dhWWhIRG5XcDFCMERLVmVKTkt2?=
 =?utf-8?B?S0pMNDRNY3ZTcGZ4Z01ZMFBWT2hwa2NZampBa3RsVnQ2WndyNllDMnlva1Bi?=
 =?utf-8?B?R3JNcEYvQnU0czB3aUpXdXhHcTNnUXFBSnFhUGZaVDJZM1ZPYnREdTVZenJB?=
 =?utf-8?B?cWk2Qk5zMkx4N3duUGJ3d0QxRnVlL043RlYvcWFwZTJDTExueHJOSmZoVWdJ?=
 =?utf-8?B?ZnROTld3SGdYNTI5N0h6RTZ2M2ZsT3VXWDU5NGp1MXZjTVdMOHgxazFJOEhr?=
 =?utf-8?B?VVpucnhYenZDYXJHcEVUdS8zWXFndVBjd3NOd0M1RTFpbFFLTldNZVNOMUxy?=
 =?utf-8?B?Q1lXL1Nsd3pqUzVTNUhlVUdsdGZuQ1pHcURSSVZ0MFc2bTIzMnU4SmhWKzhk?=
 =?utf-8?B?aG9waStVVE8yOWxvRFVHWElYWmVHSElhd0VaZXAzZDFjZTRGaGMwbHlNT0dn?=
 =?utf-8?B?S2c2WUdWMm55TW9GQmxYenJrUXZFMW5ENnQ3SHBpQkZTSEgvMXhSN1ZCNVVU?=
 =?utf-8?B?ZGVoUStOaFprVEp2RjV3ZnZzQzdXTUxxVUM1YjlYZlhvbFFwUEhwRHBWb2k4?=
 =?utf-8?B?dkxFU25PeUlLcHR1NUNSMDR2Y3hnR0svNldZdDBTNVh4RzFhMWNPMEtqMDc2?=
 =?utf-8?B?RVM0aSsyWEhzcUcxekdnUzF0eHhGVm1WK1hGNXVSSm56ZERzYjZsWDc2MTJ4?=
 =?utf-8?B?QlY2VmZaRGdvbCtQMzRBM3ZrbFJRa2RhVHV6ZlFmMjNrVmEvbkFwYkl2dmMy?=
 =?utf-8?B?WGdVcjdxMWhGSjFYd3JRZXpUL0JkK3M2VkRueVo0L3UwaW5ObnFNN0xyOHQv?=
 =?utf-8?B?alFvVFpmN3orY3g5SnFLRm4rNUY3aEVVZk5jY044U1BRSVE2Yld2Q1IvSFFH?=
 =?utf-8?B?dWY1V1p0NitiTVBvcjd5V0xxaVhoSk5aVXB4QTdEUmg0cE1wWXNIZnJTVVVE?=
 =?utf-8?B?eHFPeWF2K2RENVlhaDlwNkFPNUZWYVg2aHZQUGxlN1NOU05iK3h2QzB0cm5w?=
 =?utf-8?B?b2lFWFBkaGUyV2I0U3M3ZEZBT3lnLzVQelgxeUpNWm52Y1VOczIrREFtdlBs?=
 =?utf-8?B?QkEzMUJXc3JNZTE1MDNNaG9GUzBSNDhKYWpIeTkxQ0MvbUhzdkpPQjhEbjlZ?=
 =?utf-8?B?VVQwUU85WFU5YWdxVGRQd2gydVVpR3ZKcXg5UUlaZGtJVkNtcEdDZm1ZRG5y?=
 =?utf-8?B?akRoQUtpOVJUem5Ca2xaVG9GTVVwcG9nL21aUDRySEFBTzFXTXVCdFYxRTlt?=
 =?utf-8?B?SEZ0QVRDczNFU1pNSVRTYkFneFJ2bXdxMG9nMVVFZERYQlkyaFc4UUJvdlRR?=
 =?utf-8?B?NFhNNUcyQXI0eW8vbFVQWmJ1MEVKRzFQNk9ZVXRudnBNNndEenFza21iODJk?=
 =?utf-8?B?bXVMUHlTQzgxd1ZzU2dBT0s2MDcwbDBnU2NKbUNYUGZ4TFNiRGZzVitKbnlX?=
 =?utf-8?Q?G/8m/mDf/2BS9p+C9NGYW/2PJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57ce31b-6a8b-4479-e274-08daff474b4d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:44:49.9221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfSZ2j9t8C55LSW1Bibkp6RWIXyJ4riDhi5n1z0Xt6cohY4gtTcMVCko7rff1vM+cDDNqFkuAxnhDl2gNdnZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839

Hi Stefano,

On 1/25/23 2:20 PM, Stefano Stabellini wrote:
> On Wed, 25 Jan 2023, Vikram Garhwal wrote:
>> Add a new machine xenpvh which creates a IOREQ server to register/connect with
>> Xen Hypervisor.
>>
>> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
>> TPM emulator and connects to swtpm running on host machine via chardev socket
>> and support TPM functionalities for a guest domain.
>>
>> Extra command line for aarch64 xenpvh QEMU to connect to swtpm:
>>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>      -machine tpm-base-addr=0x0c000000 \
>>
>> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
>> provides access to TPM functionality over socket, chardev and CUSE interface.
>> Github repo: https://github.com/stefanberger/swtpm
>> Example for starting swtpm on host machine:
>>      mkdir /tmp/vtpm2
>>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>   docs/system/arm/xenpvh.rst    |  34 +++++++
>>   docs/system/target-arm.rst    |   1 +
>>   hw/arm/meson.build            |   2 +
>>   hw/arm/xen_arm.c              | 184 ++++++++++++++++++++++++++++++++++
>>   include/hw/arm/xen_arch_hvm.h |   9 ++
>>   include/hw/xen/arch_hvm.h     |   2 +
>>   6 files changed, 232 insertions(+)
>>   create mode 100644 docs/system/arm/xenpvh.rst
>>   create mode 100644 hw/arm/xen_arm.c
>>   create mode 100644 include/hw/arm/xen_arch_hvm.h
>>
>> diff --git a/docs/system/arm/xenpvh.rst b/docs/system/arm/xenpvh.rst
>> new file mode 100644
>> index 0000000000..e1655c7ab8
>> --- /dev/null
>> +++ b/docs/system/arm/xenpvh.rst
>> @@ -0,0 +1,34 @@
>> +XENPVH (``xenpvh``)
>> +=========================================
>> +This machine creates a IOREQ server to register/connect with Xen Hypervisor.
>> +
>> +When TPM is enabled, this machine also creates a tpm-tis-device at a user input
>> +tpm base address, adds a TPM emulator and connects to a swtpm application
>> +running on host machine via chardev socket. This enables xenpvh to support TPM
>> +functionalities for a guest domain.
>> +
>> +More information about TPM use and installing swtpm linux application can be
>> +found at: docs/specs/tpm.rst.
>> +
>> +Example for starting swtpm on host machine:
>> +.. code-block:: console
>> +
>> +    mkdir /tmp/vtpm2
>> +    swtpm socket --tpmstate dir=/tmp/vtpm2 \
>> +    --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
>> +
>> +Sample QEMU xenpvh commands for running and connecting with Xen:
>> +.. code-block:: console
>> +
>> +    qemu-system-aarch64 -xen-domid 1 \
>> +    -chardev socket,id=libxl-cmd,path=qmp-libxl-1,server=on,wait=off \
>> +    -mon chardev=libxl-cmd,mode=control \
>> +    -chardev socket,id=libxenstat-cmd,path=qmp-libxenstat-1,server=on,wait=off \
>> +    -mon chardev=libxenstat-cmd,mode=control \
>> +    -xen-attach -name guest0 -vnc none -display none -nographic \
>> +    -machine xenpvh -m 1301 \
>> +    -chardev socket,id=chrtpm,path=tmp/vtpm2/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm -machine tpm-base-addr=0x0C000000
>> +
>> +In above QEMU command, last two lines are for connecting xenpvh QEMU to swtpm
>> +via chardev socket.
>> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
>> index 91ebc26c6d..af8d7c77d6 100644
>> --- a/docs/system/target-arm.rst
>> +++ b/docs/system/target-arm.rst
>> @@ -106,6 +106,7 @@ undocumented; you can get a complete list by running
>>      arm/stm32
>>      arm/virt
>>      arm/xlnx-versal-virt
>> +   arm/xenpvh
>>   
>>   Emulated CPU architecture support
>>   =================================
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index b036045603..06bddbfbb8 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -61,6 +61,8 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
>>   arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>>   arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>>   arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>> +arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
>> +arm_ss.add_all(xen_ss)
>>   
>>   softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>>   softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
>> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>> new file mode 100644
>> index 0000000000..12b19e3609
>> --- /dev/null
>> +++ b/hw/arm/xen_arm.c
>> @@ -0,0 +1,184 @@
>> +/*
>> + * QEMU ARM Xen PV Machine
>                     ^ PVH
>
>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "qapi/qapi-commands-migration.h"
>> +#include "qapi/visitor.h"
>> +#include "hw/boards.h"
>> +#include "hw/sysbus.h"
>> +#include "sysemu/block-backend.h"
>> +#include "sysemu/tpm_backend.h"
>> +#include "sysemu/sysemu.h"
>> +#include "hw/xen/xen-legacy-backend.h"
>> +#include "hw/xen/xen-hvm-common.h"
>> +#include "sysemu/tpm.h"
>> +#include "hw/xen/arch_hvm.h"
>> +
>> +#define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>> +OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
>> +
>> +static MemoryListener xen_memory_listener = {
>> +    .region_add = xen_region_add,
>> +    .region_del = xen_region_del,
>> +    .log_start = NULL,
>> +    .log_stop = NULL,
>> +    .log_sync = NULL,
>> +    .log_global_start = NULL,
>> +    .log_global_stop = NULL,
>> +    .priority = 10,
>> +};
>> +
>> +struct XenArmState {
>> +    /*< private >*/
>> +    MachineState parent;
>> +
>> +    XenIOState *state;
>> +
>> +    struct {
>> +        uint64_t tpm_base_addr;
>> +    } cfg;
>> +};
>> +
>> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>> +{
>> +    hw_error("Invalid ioreq type 0x%x\n", req->type);
>> +
>> +    return;
>> +}
>> +
>> +void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
>> +                         bool add)
>> +{
>> +}
>> +
>> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>> +{
>> +}
>> +
>> +void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>> +{
>> +}
>> +
>> +#ifdef CONFIG_TPM
>> +static void xen_enable_tpm(XenArmState *xam)
>> +{
>> +    Error *errp = NULL;
>> +    DeviceState *dev;
>> +    SysBusDevice *busdev;
>> +
>> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
>> +    if (be == NULL) {
>> +        DPRINTF("Couldn't fine the backend for tpm0\n");
>> +        return;
>> +    }
>> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
>> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
>> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
>> +
>> +    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_addr);
>> +}
>> +#endif
>> +
>> +static void xen_arm_init(MachineState *machine)
>> +{
>> +    XenArmState *xam = XEN_ARM(machine);
>> +
>> +    xam->state =  g_new0(XenIOState, 1);
>> +
>> +    xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
>> +
>> +#ifdef CONFIG_TPM
>> +    if (xam->cfg.tpm_base_addr) {
>> +        xen_enable_tpm(xam);
>> +    } else {
>> +        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
>> +    }
> I would remove the "else", we already have a DPRINTF at the end of
> xen_enable_tpm.

This print is bit different than the one in /xen_enable_tpm/. I added it 
because now user needs to provide "tpm_base_addr=0x0C00_0000" from 
command line. If no /tpm_base_addr/ then /cfg.tpm_base_addr /value is 
0x0 and we don't wanna create tpm device at 0x0.

Perhaps instead of debug print, I print a warning here?

>
>
>> +#endif
>> +
>> +    return;
> the return is unnecessary
>
>
>> +}
>> +
>> +#ifdef CONFIG_TPM
>> +static void xen_arm_get_tpm_base_addr(Object *obj, Visitor *v,
>> +                                      const char *name, void *opaque,
>> +                                      Error **errp)
>> +{
>> +    XenArmState *xam = XEN_ARM(obj);
>> +    uint64_t value = xam->cfg.tpm_base_addr;
>> +
>> +    visit_type_uint64(v, name, &value, errp);
>> +}
>> +
>> +static void xen_arm_set_tpm_base_addr(Object *obj, Visitor *v,
>> +                                      const char *name, void *opaque,
>> +                                      Error **errp)
>> +{
>> +    XenArmState *xam = XEN_ARM(obj);
>> +    uint64_t value;
>> +
>> +    if (!visit_type_uint64(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    xam->cfg.tpm_base_addr = value;
>> +}
>> +#endif
>> +
>> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +    mc->desc = "Xen Para-virtualized PC";
>> +    mc->init = xen_arm_init;
>> +    mc->max_cpus = 1;
>> +    mc->default_machine_opts = "accel=xen";
>> +
>> +#ifdef CONFIG_TPM
>> +    object_class_property_add(oc, "tpm-base-addr", "uint64_t",
>> +                              xen_arm_get_tpm_base_addr,
>> +                              xen_arm_set_tpm_base_addr,
>> +                              NULL, NULL);
>> +    object_class_property_set_description(oc, "tpm-base-addr",
>> +                                          "Set Base address for TPM device.");
>> +
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>> +#endif
>> +}
>> +
>> +static const TypeInfo xen_arm_machine_type = {
>> +    .name = TYPE_XEN_ARM,
>> +    .parent = TYPE_MACHINE,
>> +    .class_init = xen_arm_machine_class_init,
>> +    .instance_size = sizeof(XenArmState),
>> +};
>> +
>> +static void xen_arm_machine_register_types(void)
>> +{
>> +    type_register_static(&xen_arm_machine_type);
>> +}
>> +
>> +type_init(xen_arm_machine_register_types)
>> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
>> new file mode 100644
>> index 0000000000..8fd645e723
>> --- /dev/null
>> +++ b/include/hw/arm/xen_arch_hvm.h
>> @@ -0,0 +1,9 @@
>> +#ifndef HW_XEN_ARCH_ARM_HVM_H
>> +#define HW_XEN_ARCH_ARM_HVM_H
>> +
>> +#include <xen/hvm/ioreq.h>
>> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
>> +void arch_xen_set_memory(XenIOState *state,
>> +                         MemoryRegionSection *section,
>> +                         bool add);
>> +#endif
>> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
>> index 26674648d8..c7c515220d 100644
>> --- a/include/hw/xen/arch_hvm.h
>> +++ b/include/hw/xen/arch_hvm.h
>> @@ -1,3 +1,5 @@
>>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>>   #include "hw/i386/xen_arch_hvm.h"
>> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
>> +#include "hw/arm/xen_arch_hvm.h"
>>   #endif
>> -- 
>> 2.17.0
>>

