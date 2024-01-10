Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F21829C08
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665512.1035706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZGe-0002vE-CX; Wed, 10 Jan 2024 14:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665512.1035706; Wed, 10 Jan 2024 14:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZGe-0002tP-9K; Wed, 10 Jan 2024 14:09:16 +0000
Received: by outflank-mailman (input) for mailman id 665512;
 Wed, 10 Jan 2024 14:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3bl=IU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNZGd-0002t4-Fm
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:09:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4992047-afc1-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 15:09:14 +0100 (CET)
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 14:09:09 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::ef) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 14:09:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 14:09:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 08:09:08 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 10 Jan 2024 08:09:07 -0600
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
X-Inumbo-ID: d4992047-afc1-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QculUaKTvkthz5jpvAnKEIFP1mCRvEKdBgLEC7o1TzBNE2z4ri0ckonTNazYHfEQkTUWnfeNy8fI3KiS1e4emaxnDCWjmYe11HctOT8OcHCxH+ZmF1AqbYN5DplK38cWF6NAxns8Lowlb6xopd/oobIFzCbFiawUiIiXmIL9jnGbp78WPIriTzZPy1gOpO/B5C3GwqriD7IRRWStkSUczNcwXDTP/eAr5oyE4sn1b7WFVpccYaV2OpSYnMXi9QkLcMhpfRvQeRp9ycoWaN+kQAVt9O0YM4FUpFJkUadEjg6n6tkdgrilT0PnyXwxeOXt4BYlrgWBtupcsHA8k04TFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AA9/pnc0GnX2BrERDELIxm/XSzXhaAGbxx3jRIpi6J0=;
 b=E3K8+FGLHNLYr07wl0krLpryhV31oluZO/UnFNwGRE4whRGQLx0/V7bIGq3hIcE2qMS2Oxmw82xuGGIRzUvg9Q8AgNPCjJOvVrfiet5u1UHiIndJGbSxZKro5LzsYJ0EvK5ykP62QzSPbGFALGWxnzj0XJUkJsZixbGf8GGN5mOrXeRoBMcUPK69ALjyaCb00C0C/MAhJB9cX300i4oSdtDSJSVAd+uQlx4WtIl2xq3emTLEZRYTXmKrjaJx+CPMebIe5i1Nzh5bkTszvGFFerPaE1i9Aa6Xv+HKjGMWThUNbIYfbMhEGQJSB2YgQngeinMjHJ+QbeY2kLMM4pRJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA9/pnc0GnX2BrERDELIxm/XSzXhaAGbxx3jRIpi6J0=;
 b=rtCrT51NWk4CiMXuDlE37KBNJ/DB2m6PFTOkAakFQhhe/aEUF2sFiwaLaqMb8zMVM8wnmxpUqqZYYAuqM14dvmCetv2cQYvwlP2rFF8XVWqV83/GjvaftpJN9tSQI6HlcPr6GtbHikMg0Xvpyyk9SOUoW2lfB74HBPiQd7Z+jiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0bbb2260-3fde-4b0f-949d-01ffd03029ce@amd.com>
Date: Wed, 10 Jan 2024 09:09:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-2-Jiqian.Chen@amd.com>
 <70add06b-59c6-469a-8570-f7a6f5bc15fb@amd.com>
 <BL1PR12MB58494843C4BCE9A522A0E674E7692@BL1PR12MB5849.namprd12.prod.outlook.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BL1PR12MB58494843C4BCE9A522A0E674E7692@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cd0677-55ca-404f-d3f4-08dc11e5b6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6zBBuVOcRMthEg+1nBH7TdFt2N62O0piMw5qC3c233oXta+ZVw0D2l9TjMTsK1Y80HP71GT4QZQaX4GiiV1p5PRAGnUqxb4rBSXIpAUKTojAI4hCm/ENVUupPU1Tok3uZMA0zToqeE0IJ3FZ69NBQFI4CcQlkLTr5CUaOUJrq0C2QWJXHhu9fGXdGQxCKDlGLjuMgbnVlmVknD6AsnQrWBTahMVlLQvpqEvrFEhfli7KDwjHW20UpbrijOGpe7CT56GIkTIDCKq4qdhiKCdIHW6H56zSfm1I/CW+48UNEOmHJ1tuzfRo8oau+gQf1ZN7QE2B/H987zG3peJRwQ6QX3ZWXepIuu/tLR5MDQcq5pH9mqhqR0QRO4Vrl9TVyVufZJ6UBH3cv3Z/kVWq6A4msenbqZz9AIT/++Ows5cPtXjWwBBVM8U5/ZaPCzGCcfKr1URkzIKTWrtFznxP+b3fP+hFH+12a4egB2WYbg9eyXAnMoqmC/xUYqb+mWvgSyFIN1JRLMefsE+6KKNk0aT9SY3PZIwCaaodI352csW28gfqoMyRyyYZHrivfH8xhXdMw+LNosBuSHlKKD2PkNIyXG5qqrTCZcG7UrP/roRjtsAHI9Lat6MEWYD796uchnu//mA1VuSNmpJmKYPQEB951/5XLrS4JmG86w71v9Fzd8pbKN5A/8+JOcIFVmm/9QHqAo5M7+pXATXo+1xMbQ63W2B3+x9ax1ALFuozyzAjfg0/uDG9cs4rJJG4okBDpmmplb8pLpegXpS2NPSioVh5kl5Mgn5k/6SZ78zgq3TjGs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(53546011)(2616005)(426003)(336012)(26005)(82740400003)(36860700001)(6862004)(4326008)(8676002)(41300700001)(7416002)(8936002)(2906002)(5660300002)(478600001)(44832011)(16576012)(966005)(37006003)(54906003)(6636002)(316002)(70586007)(70206006)(86362001)(31696002)(81166007)(356005)(36756003)(31686004)(40480700001)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 14:09:08.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cd0677-55ca-404f-d3f4-08dc11e5b6a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334

On 1/10/24 01:24, Chen, Jiqian wrote:
> On 2024/1/9 23:24, Stewart Hildebrand wrote:
>> On 1/5/24 02:09, Jiqian Chen wrote:
>>> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
>>> index 42db3e6d133c..552ccbf747cb 100644
>>> --- a/xen/drivers/pci/physdev.c
>>> +++ b/xen/drivers/pci/physdev.c
>>> @@ -67,6 +68,39 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          break;
>>>      }
>>>  
>>> +    case PHYSDEVOP_pci_device_state_reset: {
>>> +        struct physdev_pci_device dev;
>>> +        struct pci_dev *pdev;
>>> +        pci_sbdf_t sbdf;
>>> +
>>> +        if ( !is_pci_passthrough_enabled() )
>>> +            return -EOPNOTSUPP;
>>> +
>>> +        ret = -EFAULT;
>>> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
>>> +            break;
>>> +        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
>>> +
>>> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        pcidevs_lock();
>>> +        pdev = pci_get_pdev(NULL, sbdf);
>>> +        if ( !pdev )
>>> +        {
>>> +            pcidevs_unlock();
>>> +            ret = -ENODEV;
>>> +            break;
>>> +        }
>>> +
>>
>>         write_lock(&pdev->domain->pci_lock);
>>
>>> +        ret = vpci_reset_device_state(pdev);
>>
>>         write_unlock(&pdev->domain->pci_lock);
> vpci_reset_device_state only reset the vpci state of pdev without deleting pdev from domain, and here has held pcidevs_lock, it has no need to lock pci_lock?

Strictly speaking, it is not enforced yet. However, an upcoming change [1] will expand the scope of d->pci_lock to include protecting the pdev->vpci structure to an extent, so it will be required once that change is committed. In my opinion there is no harm in adding the additional lock now. If you prefer to wait I would not object, but in this case I would at least ask for a TODO comment to help remind us to address it later.

[1] https://lists.xenproject.org/archives/html/xen-devel/2024-01/msg00446.html

> 
>>
>>> +        pcidevs_unlock();
>>> +        if ( ret )
>>> +            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);
>>> +        break;
>>> +    }
>>> +
>>>      default:
>>>          ret = -ENOSYS;
>>>          break;
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index 72ef277c4f8e..3c64cb10ccbb 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -107,6 +107,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int vpci_reset_device_state(struct pci_dev *pdev)
>>> +{
>>> +    ASSERT(pcidevs_locked());
>>
>>     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>
>>> +
>>> +    vpci_remove_device(pdev);
>>> +    return vpci_add_handlers(pdev);
>>> +}
>>> +
>>>  #endif /* __XEN__ */
>>>  
>>>  static int vpci_register_cmp(const struct vpci_register *r1,
> 

