Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3718236C0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 21:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661024.1030718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL864-0002gU-Mv; Wed, 03 Jan 2024 20:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661024.1030718; Wed, 03 Jan 2024 20:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL864-0002dd-Jv; Wed, 03 Jan 2024 20:44:16 +0000
Received: by outflank-mailman (input) for mailman id 661024;
 Wed, 03 Jan 2024 20:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTR4=IN=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rL862-0002dX-Ub
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 20:44:15 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe59::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8254227-aa78-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 21:44:10 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MW3PR12MB4522.namprd12.prod.outlook.com (2603:10b6:303:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 20:44:06 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 20:44:06 +0000
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
X-Inumbo-ID: d8254227-aa78-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WohSmIGts9SAu9OqlpNqy1zliQFf7bLjMdtd1So6mORATLlvLoIbEnjO/ydN5ZNzpn98OsQBNx9nFEVX/xBvwqNDYRTkPzWJGG6smJyquO/kDMre+myFBZgjXwh0RQNI1YyNbi957s3r3X+fRWAKi3c4JYWZNeN54DF0OApW5ekcA7/Q2Kl8br/tTWuZEppYTWux4+FNN7kzsvxpH8qkIVC/zuq551GbfTM+6hvsk8hy2VwDFmMgNGtEMrQTHAKMSbe8hZ2AbT1bGcouSo5NAoxVMfw2HX0gkSsQTM0fOxrf0zKkYktzg3OKIuQ2kg7QPjRIdprFHwrFlMop+ydTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uTJStMK/t5DjuDa/IOmkAUgSq293zzv3oMcwzsx8T8=;
 b=UxuYpfFfm0Jv4hkZOR1Fkz8+IPqz5oMXNgno53mDTMH/hxYricegjDfE57Jb05mIKU9KfcZFTJ5CI3u4uZdzxVxMAT9SVuhzb1YP8MIZ7EUx9Nl9HwrbyKu5/rAb+AKj0ScEKyBI+TDoeVGoghsCkEWryNFXWvQT5z/hooBDEBjzGxe3qi26eWDsZb/KQpdJER3oLFH+aHXwSIuIn1Gfe/nNGCIJ3sCiyY7VFBg0B/C0cfelX9bRpO03cJ4sanBelk7Z1G1SycuSc0IqoBO3ATTzcTVbyp04JNz8J9Rc1eyCNxRj5Br9B3A2vRnoAzHVG9ySG73gm9VeHYjVrhDtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uTJStMK/t5DjuDa/IOmkAUgSq293zzv3oMcwzsx8T8=;
 b=kxEgtKfixVis7/f8Q/v4tB4OiGg6weKDTnGB3YwvAwYrrduM1czpBujZtaeEWJSIEE7i2h9JLaOcgmaM8xPF1vXdmHHPJDn8ak9GtdoCcgU1XY7l3wVxjSfYpSAV/cZXUWHTBe+qkB+01Qtg9qVBydFUzA0EtpPmjxySvJgx+yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 3 Jan 2024 12:44:03 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen and Qemu virtio question
Message-ID: <ZZXHE3lQ3XPOj80o@amd.com>
References: <DU0PR04MB9417F7A337D7CAA59B38ED038860A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417F7A337D7CAA59B38ED038860A@DU0PR04MB9417.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MW3PR12MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2623a1-a0d4-4d9a-92d8-08dc0c9cba7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tTM4eEJOEgTxt4T58N9ymEZ1hsZjijb755Ptib7DgDsX+ZbOltvBKP0E+e069HQRMMU9Pa4Sp3+0onjfq4xIPSYR2+iFF/FfwbdczZXZmI2vuxBokbHy48xbjoSLG1XNeSLJaosJTC5HbFCX+BX9RFgpvf97IM60mijl+dfmZJ9oU0TYudnM6DUYmKEEK0/7PfE1/9yXi+q+EsIdhhAh7M+g8ZRuHHhW5EXVinw1U4axvp0zr+fl2WF/4lsDSZLfqEGHvS71e87LBV9dPwjAkUVe1eX8WtvcqbrQaEatU4KPSZ2g4gMg0ghyFHjlw1m4E9eaqtEEOCVaDOtxUtFzykF6EEZ+5zUGQCF55UT3pLLKKhEf90hRVH4GUbGCJyZfI5YawU/aHWSTZ5RiBs94Ans+HvPxb4/jXCtN9QD1ZxbB20MUKlpUYGJW6zaToYh2Iq83L2xd6mf71YMYeeq21kc6yhYuvG5/kb4lLQQAGWT/1srF0t3j7L6LQaC1S//q1g2T4jvN9k92QV03MpzVtjEBm4I/lAuTmtJsFnU2Y9C3ykTKH0I5SGDnS/TDQerqGF0lbWp1SMcleeGwwcSvrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(26005)(2616005)(6506007)(6666004)(5660300002)(4326008)(8936002)(41300700001)(44832011)(2906002)(83380400001)(6486002)(478600001)(6916009)(66476007)(966005)(66556008)(66946007)(316002)(54906003)(8676002)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFdwa3pZWXpCQ0Z5Zy9OamcwUmdYMkIzdTV0QnU1UDJVK0pNS0xSYmlzMEhl?=
 =?utf-8?B?bGdMbXBjbjVzekViVDl6Q25LOXRrbWRjdzVxbGdiZ2crdExOWU13Y2UveCtt?=
 =?utf-8?B?YkwrUXBhMzVld01BTm1UQWp0MUYxSGM2SEVjSDdJWUNXYThoRFRwc1lRZTB1?=
 =?utf-8?B?Z1RZcHdWZjV6L0tHdjA5S3BDTTlKM2Y4NXNpREV4ZldwczdIM25iaUwxd0V6?=
 =?utf-8?B?b1dxQ2ZTN0tiWXJnTG1nczNiUHAyKzNkZVFPV0dUc3c5RWNnVXFVcExjaVVE?=
 =?utf-8?B?Q2IzWHI1aW0xcStObDk2VzRZbUJJVUxPelpiQmphd0ZmdDFJKzdvcGNYN0xX?=
 =?utf-8?B?TkNQWGl4SE9SQTJPTE50SGMxV3Nad0NkeWV0MkpjZUQ1Zzc2b0hnRzVTakxT?=
 =?utf-8?B?Q0FoNnR0bEtSOVc1WHVlOVRlU3hkWFQzOGVzUVBMNHJuT0ROOStVL0E0WjZh?=
 =?utf-8?B?Z2ZMWVpFZU9Dc0V4elNXR2lRSVVhS0M2STJUdW1sOXlad1p2c3Q1MTJBN2lz?=
 =?utf-8?B?bXpTMjNKMGxXY2tPYkh6di9RY3NKSUwzLzdQNCt5T2tjMXhzanB5bXFhWjAr?=
 =?utf-8?B?VG9hL0FHRE9WWUU4b3RsVEFkWVNqSDhnUUJhRXE3dGpZWjB0Y0hScktUZmVp?=
 =?utf-8?B?eXlJNnJzVXRvTXI0QWsxSjJqZEg3MHZxaEdBUHJYTjdLT2VjWlVUaDlVbm1u?=
 =?utf-8?B?YW4yQUlFMk5DbHpFQ0JWdmdZUUZ0emhLY3E3UThEMnBPTFRLVkxFc0VqeE4w?=
 =?utf-8?B?enJBb0pZbVpiNkp1enNSQjYvaFBXVVh3MGl6OEhLclNmVlBkQjc1ZHFDOFhz?=
 =?utf-8?B?OEpkS25QUVlCeTFMYktwWGx4R3o4ajc4SUxNVnRKTGt1c1NyTGU2ZnFUOTU5?=
 =?utf-8?B?RFVrS0hSbDFBamhKMGh6dkxhR0p3eEw2d1EzTmNOc2YyMDlCMlNlQ2Fhalla?=
 =?utf-8?B?eURXK2tCU084VllrV2tLM1hqUXpjalE2dVpDV25FMENTMUNIQzg1bER0ZU04?=
 =?utf-8?B?djBpdjF3V3JrRnQxQ2hGMzI4MXBPOFJrRlpLNWVPVEdjZ25HN1hQUzJmTno4?=
 =?utf-8?B?SXovNnBEakpiTitKdVlna3VleHpibjZDUzdORzZnVlB1QXZoRnR4Z2haV1dt?=
 =?utf-8?B?SDNHQ0U0MndKekVNSmxrektXSTJYbklUeGw4Uk85R1JIWXNCemZSR0h2TE9Q?=
 =?utf-8?B?NEV0dzlXZVgzNjMwK3JUaG5wSUowVnhBeHk3djBKTm1KbjFub3JUelprU1Za?=
 =?utf-8?B?SkVkQUxKY0NVTmVqYWxhM21VdnJNMlNQOC9FZHJHOTlzKzRYWGZZNlNUeVox?=
 =?utf-8?B?L1NxNWx1Zkg1cFNiN080Mi9sWWNvcXcvV0l4eGg0Y3FIbkNLY3VRZWFnbVBT?=
 =?utf-8?B?T0wzSWlPLzd5NjlGaVZPcWF2Vi85dko4bVJrc1lkS3RHVW50eDgwdnVNVVlC?=
 =?utf-8?B?S25qT2tnOHJoaEhTQXZyWndwTlpxYlR4cnNvc3paU2pVV3NuaXdXSjdiQTlk?=
 =?utf-8?B?K3J3ZysraU84SmpaOUN3eWRTTkFXS3doKytwTGhheXREaHgraG9WQXZSQ0Zq?=
 =?utf-8?B?YWhzaG9QUDZXZ0N0WFg3YURNNGdUQThadjVOUSsxVGdKUHJpVkU1ekVIMFRZ?=
 =?utf-8?B?SFpPQTJ0R2xZOGtlOWJ2TDFhM3U2NmowbnN3YjdLMkVrL05aWUkxeDlXaTc5?=
 =?utf-8?B?dzRQd2lVUTJZT1pzWUdjK1lnU3czT3JSeHdNMW1oaGsvU2l3RDdvOTBDa3BP?=
 =?utf-8?B?UmtXOGpIVnhlQ2lxYXlHdkdKM0xtUkU4NkVrQ1lhU2VtMEhHUUorMjRpQW42?=
 =?utf-8?B?R1U0UUJYUDBQaURyQWZTNzg2UHk1MVpidktobXlSSDRodGMyL3VrWDJPSkg0?=
 =?utf-8?B?RmdNcTNZa0VJamVzTk1rSFdRRGZHMUJZaXFMd1prc3pvdFl0NStscC9jNGV6?=
 =?utf-8?B?bTNmbWQ3WkNta1NNUVBaRjRmdHdEQjZIWExSU1NpeXBzSE0yMW5yU0FXU1pz?=
 =?utf-8?B?ZHZCUTBxUHRLeFhJUHNEMy9vU01CaXAvSThucFYzMG0wd3ZWN0FVVENYY3RH?=
 =?utf-8?B?TTgwM085NVBqYm9EMnM2ZHZRbGE4bWUzcEM2eVZHcVlnRk9hdFQycEVpRVl4?=
 =?utf-8?Q?3y6kx7+8GjM0BQo9qFIWCNjQP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2623a1-a0d4-4d9a-92d8-08dc0c9cba7e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 20:44:06.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh0l+vI1MxIrYSZLQGkTujFAXZq9gsVjjoso1yZ25ZwoI3vJiZivYgIyJRwObT4c7+yjBDnNfzB5pnHE3M/Whg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4522

Hi Peng,
Please see my comments below.
On Wed, Jan 03, 2024 at 05:38:07AM +0000, Peng Fan wrote:
> Hi Vikram, Oleksii
> 
> I follow the slide virtio for Xen on ARM[1], but I met some issues, and
> stuck for about two days.
> 
> I use upstream lastest qemu repo master branch, not qemu-xen.git
> repo.
This is right.
> 
> My start command as below[2], but seems I need first `xl create domu.cfg`,
> otherwise it will fail, because xen hypervisor
> dm_op->rcu_lock_remote_domain_by_id will return failure if domu
> not created.  My domu cfg is simple:
> kernel = "/run/media/boot-mmcblk1p1/Image"
> disk = [ '/etc/xen/disk_1.img,,xvda,specification=virtio' ]
> cmdline = "console=hvc0 root=/dev/xvda rw"
> name = "DomU"
> memory = 512
> serial = "pty"
> 
> I drop qdisk in the disk entry, because xen tool report qdisk and virtio
> not compatible.
> 
> And the arg xen_domid should be same as domu domain id? Is
> there any dynamic way to set xen_domid, start qemu when start
> domu?
Yes, it should be xen_domid. Below virtio-disk patches will take care of
invoking QEMU with right domid.
> 
> Does the domu dts still needed to include the virtio,mmio node?
> 
> however xl create domu.cfg relies virtio disk ready, which needs qemu
> start first. This confuses me. How do you address this
> or I do something wrong?
> 
> Then after xl create,  I quickly start qemu, but met:
> failed to create ioreq server, then I see there is mismatch.
> qemu use HVM_IOREQSRV_BUFIOREQ_ATOMIC to create ioreq server,
> but xen ioreq_server_create will return failure:
>      if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )                                             
>                return -EINVAL;
> 
There is a downstream patch for this:
https://github.com/Xilinx/xen/commit/be35b46e907c7c78fd23888d837475eb28334638

> So I change HVM_IOREQSRV_BUFIOREQ_OFF in qemu, but met:
> qemu-system-aarch64: failed to map ioreq server resources: error 2
> handle=0xaaaad26c7f30
> qemu-system-aarch64: xen hardware virtual machine initialisation failed
> 
> Do you have out of box repo that works well? Including Qemu and Xen,
> I am trying virtio disk, but will move to test virtio gpu soon.
> 
> I am not sure there are some downstream patches in your side to
> address and make it work well.
> 
We have a few downstream patches for xen-tools.	
For Virtio disk backend:
https://github.com/Xilinx/xen/commit/947280803294bbb963f428423f679d074c60d632
For Virtio-net:
https://github.com/Xilinx/xen/commit/32fcc702718591270e5c8928b7687d853249c882
For changing the machine name to Xenpvh(to align with QEMU changes):
https://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a

With above 4 patches it should work for you. Please re-compile Xen and Xen-tools
first and finally compile QEMU with this Xen.

> Thanks for your help.
> 
> Thanks,
> Peng.
> 
> [1]https://www.youtube.com/watch?v=boRQ8UHc760
> 
> [2]qemu-system-aarch64  -xen-domid 1 \
> -chardev socket,id=libxl-cmd,path=qmp-libxl-1,server=on,wait=off \
> -mon chardev=libxl-cmd,mode=control \
> -chardev socket,id=libxenstat-cmd,path=qmp-libxenstat-1,server=on,wait=off \
> -mon chardev=libxenstat-cmd,mode=control \
> -xen-attach -name guest0 -vnc none -display none -nographic \
> -machine xenpvh -m 513 &

