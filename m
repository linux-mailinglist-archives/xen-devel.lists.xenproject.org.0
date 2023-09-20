Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497A7A844F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 15:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605734.943328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qixh6-0000pl-8R; Wed, 20 Sep 2023 13:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605734.943328; Wed, 20 Sep 2023 13:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qixh6-0000nP-5g; Wed, 20 Sep 2023 13:56:44 +0000
Received: by outflank-mailman (input) for mailman id 605734;
 Wed, 20 Sep 2023 13:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wrp=FE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qixh4-0000nJ-CE
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 13:56:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857e3312-57bd-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 15:56:40 +0200 (CEST)
Received: from DM6PR11CA0059.namprd11.prod.outlook.com (2603:10b6:5:14c::36)
 by DM4PR12MB5963.namprd12.prod.outlook.com (2603:10b6:8:6a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Wed, 20 Sep 2023 13:56:37 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::c2) by DM6PR11CA0059.outlook.office365.com
 (2603:10b6:5:14c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 13:56:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 13:56:36 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 08:56:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 06:56:36 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 20 Sep 2023 08:56:34 -0500
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
X-Inumbo-ID: 857e3312-57bd-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXTXk3DnOXVsCeIlJyyM3V9Nwpq3hnMyye8zAmYn9GyNIZO4Nv/Im04MalI91AUfPd2H6QRrYkDRIZOWAWrZE7M+u4BIsfpLt39c+kzg0+nrJbTD+i4FmPx3R+9OQVc1mD00L/5E1pNafI2g+rygSvpDP+14fjQo2+Kd+UcDC13oVqBOb8wo577ihmXveXNibcsGMsl13WUYsNrBR5AiojVJWU8u3ZySUjU4lEr2ZwZRusQ6/gK4aPHrEpuSs4XAF6j4QnZFH4szeLZwZuMyCKQXNFeY2MKjmbdHuOlhJcXQRF07h4ugPUjHDTQKq8qjTy5t9dik1PdJZtcsQv/n3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQJh4EW+gXVDVoVOEtiegw9LowjMpw7R7YalCQsWz78=;
 b=dl13YtBAaH8Iqc7hS0ufiflt7nKJZV4mYFSN/35JhPoxdNs55i//UiPKYFYBSkja37PG2Dp7UJUHzQMRp47tbGu54nUgOyYOUU+AilXc93H/5Pz+dDtGuOHFRzo7I7mtbMEHA7UxOKrYSJKzXKPvfZvWwLFg5gCJRO88akBj8GO7v6wSBT3NU7XokScv3H2bUeqQFqUsvWrDF4Y7xE5bUitFNNI8cKgXisybnfc/lsUomTBEgtR5CdCJfPzKJSIWcOsZ3T/St0dZU01FkYo2wbRjYmHVV6qLpUt6U0PHkiEj7ficeW+c+Q0BnN6PJN5FtfuFSsAVgVesDPMWUIdnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQJh4EW+gXVDVoVOEtiegw9LowjMpw7R7YalCQsWz78=;
 b=jtQNi2l8Y//tGaBhOFLttn/BI8YE9dtzi2HXvgSeyYjzMtM49kS+0DPFGIhf7uUrk3WLZuBQBGvSIt7LuljTjTr1ZzUUYVeOO5wKq8PPL5k/NKRSf5j788bvD4ZWeXVKcD+2YM3apu2DRV+KSaJAu5obSPfqOmBWhC4xfkVBjAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8f8e293c-80a9-03e0-0c19-e641dc42d42e@amd.com>
Date: Wed, 20 Sep 2023 09:56:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Oleksandr
 Andrushchenko" <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
 <ZQqoqrmDr2jY_bMu@MacBookPdeRoger>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZQqoqrmDr2jY_bMu@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DM4PR12MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf3ec5b-0624-425d-fc3d-08dbb9e16836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vu7ZZqkkiQC1Nt0HHbbRCXAQvJ+amX/hH//jgMzbJBIbapULzH8Z1SZ1B1WmgpuFtA9HD6Wi9KXyn9Kjt8K6nES3p+LCR74fYLFxU1q2YHTX89uZ35wZIr1Zj2lhpri3qe9EveC3smHbck4PZ1DPPXPAu4t80yYLgb93z3/ePrPw1+3rw6PZQ9HCvmtAVqu4/g+YS8RKoT0z1adKhjjUQv5hGxTJ9Dk3ZvFxxtR19ww9ZQzeH1/EnOJqYfqTl44c2k6Xr0Tz97dyeu+UAVZQsCgyye+ljLVr5hLZSvE+XTE4lYMJHODVRqhOR71o2twmeaK06gtWFvQWLt84Ysl5TVadsbq7FfdOAdkY8g706xtA/l1Snkp48dtKZAbRXI92TPqav7DmvfD7vYgf5qUrQy9IdqvHx7bgwGAR5sUbtmjSsnDo6wJkX7hcIimpYM6OdPLw0AtU5yQ18JZKI1uP98l8AQybayBbqArMqJ3Sz+XiniIL4FjgCxc1c3IaF6NjmJnVqFxRnbiR4CubIHO6t/5WAuQ82yXz7RU8fNtQ8W8a3qQZjoDPkEyu2kXmEebBTjHY3YUyX3t3QPI0UTFPbWJL8smyI77SmZZ2HUIsTtHr0Brn+7Yo2XPmUjq5y28Q4igJGKgV/dhsmGZHcahjyoKxXRThy4D+L9bNZw9os2p8k9Hp2KocihtITx1Gh1AD7gXoYFVuo09r79s4rX5OYLY6Zmzm3v5G7NRstmkfw0eFKK0Rb7IkM20kF9e6nZKHxyKeGJ8+jen91UC8Ws9wz4ww9ZDfiuMRQTyS6EEOOdZq9w2Uoz7myfpU/0cgJTMC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(4326008)(7416002)(40460700003)(83380400001)(70586007)(16576012)(54906003)(316002)(6916009)(70206006)(478600001)(81166007)(2906002)(8936002)(8676002)(41300700001)(356005)(86362001)(31696002)(44832011)(5660300002)(36860700001)(47076005)(2616005)(82740400003)(6666004)(53546011)(336012)(26005)(426003)(36756003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:56:36.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf3ec5b-0624-425d-fc3d-08dbb9e16836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5963

On 9/20/23 04:09, Roger Pau Monné wrote:
> On Tue, Sep 19, 2023 at 12:20:39PM -0400, Stewart Hildebrand wrote:
>> On 9/19/23 11:39, Roger Pau Monné wrote:
>>> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
>>>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>>>> index 8f2b59e61a..a0733bb2cb 100644
>>>> --- a/xen/drivers/vpci/msi.c
>>>> +++ b/xen/drivers/vpci/msi.c
>>>> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
>>>>                       * holding the lock.
>>>>                       */
>>>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>>>> -                    process_pending_softirqs();
>>>> -                    continue;
>>>> +                    goto pdev_done;
>>>>                  }
>>>>              }
>>>>
>>>>              spin_unlock(&pdev->vpci->lock);
>>>> + pdev_done:
>>>> +            /*
>>>> +             * Unlock lock to process pending softirqs. This is
>>>> +             * potentially unsafe, as d->pdev_list can be changed in
>>>> +             * meantime.
>>>> +             */
>>>> +            read_unlock(&d->pci_lock);
>>>>              process_pending_softirqs();
>>>> +            if ( !read_trylock(&d->pci_lock) )
>>>> +            {
>>>> +                printk("unable to access other devices for the domain\n");
>>>> +                goto domain_done;
>>>
>>> Shouldn't the domain_done label be after the read_unlock(), so that we
>>> can proceed to try to dump the devices for the next domain?  With the
>>> proposed code a failure to acquire one of the domains pci_lock
>>> terminates the dump.
>>>
>>>> +            }
>>>>          }
>>>> +        read_unlock(&d->pci_lock);
>>>>      }
>>>> + domain_done:
>>>>      rcu_read_unlock(&domlist_read_lock);
>>>>  }
>>>>
>>
>> With the label moved, a no-op expression after the label is needed to make the compiler happy:
>>
>>             }
>>         }
>>         read_unlock(&d->pci_lock);
>>  domain_done:
>>         (void)0;
>>     }
>>     rcu_read_unlock(&domlist_read_lock);
>> }
>>
>>
>> If the no-op is omitted, the compiler may complain (gcc 9.4.0):
>>
>> drivers/vpci/msi.c: In function ‘vpci_dump_msi’:
>> drivers/vpci/msi.c:351:2: error: label at end of compound statement
>>   351 |  domain_done:
>>       |  ^~~~~~~~~~~
> 
> 
> Might be better to place the label at the start of the loop, and
> likely rename to next_domain.

That would bypass the loop condition and increment statements.

