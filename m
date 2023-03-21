Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798CE6C3196
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512587.792555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb16-0000Kb-J6; Tue, 21 Mar 2023 12:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512587.792555; Tue, 21 Mar 2023 12:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb16-0000IO-Fv; Tue, 21 Mar 2023 12:23:04 +0000
Received: by outflank-mailman (input) for mailman id 512587;
 Tue, 21 Mar 2023 12:23:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peb14-0000IG-QD
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:23:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e36cbad-c7e3-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:23:01 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 12:22:56 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:22:56 +0000
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
X-Inumbo-ID: 1e36cbad-c7e3-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIjbrWx3eZmcwFf0/GonipsgAk8YaYPBKyGLYzIqfg+ZwJK/VSQvgUq4JmD8vvgW0JXxne4Rad6SKjEiPbjuF+bd5RcYMtabL6Cyi25QJnKQsqGd4UXDL7JCkel+n/ThMFkdKWGI+uaTc6Zw8RI2Vhm/OViUCF1mC02uPiMfN/f36hxnkSmSjI5vSzzqU+8mwNl4gakfdg4uKHLprNtctL+aaUWVtbKftWtm+EMgLgEukdYXsbiORtDWxQGubimlRTuPqCizOCExwRf+V3JxZvzN8eLhc3F6RQo6+7B9l1cwQI7kbBfug7oTfQ3Q0guSm1T9WoMdAOXLdiYQEg6kCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGgYn+wNjM5yjTo/02eNpIuzXSxxPxUypxrk+F7jdn8=;
 b=WP3x8X8WsWvVK/KEPnZXMUuL1xD2pcSA21qsLl7WcEeC4AhlsURZQ5RM546qE/TYCIA1vj40eqMZ7Md7OcV5/cYEX+Wyt76rerw5MAKcT71NVpft6fZQRqZDALBNRiun6BNvh1/ayzXi7LHM9O5vSGE4Wwn9jpQwsjOXbWMtWxo9aG/YQRJeHH+Xr6vrDys8wUpc/kfrs5K1tvoJdB/4D3zDEfjD5BEBnoXqQWiPcIOvNLbpUo4gqiUZFsyfdEUjrMlUUuCUpj0d6e0OyKaQ4olDbqwTLT+5TcvkSPYRTMrIzeMfokGolakkYNjqmJsSKETjrddnclhPUYKWeIaDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGgYn+wNjM5yjTo/02eNpIuzXSxxPxUypxrk+F7jdn8=;
 b=LhfB25RWhPq1mEQg/M8e8zkGqmFHzwEAtCNPqrTepRZIwskRv1VBy5TaJ28EfbO/oc1Faf8jFSe85wgwVYCpPrOznv5/+gnGITUwEMYEmEPrAAlpbDaDLYVMbO3afv98lLtmHrJKJdL0BYq7g1OkFyBp7Kjt6KVznsZvALYILiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 20:22:28 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Message-ID: <ZBmhhHT8P5wUjxX6@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2da7cd-666b-4eff-289c-08db2a070053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5yx06cquLRJBYIDWyrkO/hED7rg3M9P65dB3jhOEHoh6OjGbsoClZ6AOUDEeKhwxdihc2cIy3urMMiPfAekc1icv4s0fukUHqNBQMntXchU26jc/PNUPH58IiskUW6a+e9ry5ldnKIsdY+CG8q8AINU0//Cfc+EA8fDWWoV7y7ZYIjk792IJKDe/xeLHUvJP0mb1klo6cqoRcbUBjMcpoC7HqiLT9Irw/0I0s5O2fCJ2sGD3tqcJQnBbexhPU/bvUpCdDqFBjWM8UIq2ExPCBlSVeCr6VIWBDBw/HSZYyFC7S0z4ghWk+BUI2Kd1Gb8azZ8xVwLIJMb/G/fAvYnJfkxbYGsUhAp6gRqQTcb0cjjKVOzsugfzOsR7XgorKCiq8kgXGcQ9RAzT0IQPWqbVBPDhsbV1UI6HGv1NYYE0S0h6PfZE+QBHwelGoBvZAEteCITer+cXrJG6TQ+y9ZHVFjHY2E5hCe0XJz2PH3SKKNe9UZ/4HvysNqdCjlK9de0AkluWNdOQO1RZKVfyjDtJ1x0kzuYo5X/ZgdXyX1IXAS6VvuhTUXM7gdkuuJondyytaQUFWB72/DfW/I17Mp0voyEg+BWJwPVuBxuNPn5yfkDRDwBt2j78m0S0VEiKxB9K5KQ6KHNjXzIViTKb3Hpy2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(316002)(54906003)(6666004)(38100700002)(66946007)(6916009)(8676002)(4326008)(478600001)(66476007)(66556008)(6486002)(2906002)(41300700001)(2616005)(86362001)(186003)(26005)(6512007)(8936002)(5660300002)(83380400001)(6506007)(36756003)(53546011)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmuSCK7FYzU5KLXrLY8UCCSt5u6zoOKBJFIBRrBRIywew1cZYGaeO2jOE4VV?=
 =?us-ascii?Q?OL0kU0FkzW1VTYFkTGOfeTOEr8QfHCEw4ETj1BLJrcYXI6o5366TX7D5TuKG?=
 =?us-ascii?Q?HHPiloVHQ+MgQMY1qUR53zdf/WD46NlyM/wue+Hc2ePb7UPpik+zq0prc/pf?=
 =?us-ascii?Q?tU0RGiCTVAhf8s1k3ECfLsH7m/fL7Lb28wv2TRN56TKMtIkYNGYfsoRPPDqc?=
 =?us-ascii?Q?k3TERuqai8TM+05iA7jWZEy8cT8355n24GZziixVfe1UtRZLuLkcgrafhWDm?=
 =?us-ascii?Q?LK0BIL8DqOgcfEEhCXjL5NMq7cbSuh4jrIdXdMP0rsxBHnUf+kD9+0OzkIJ2?=
 =?us-ascii?Q?UDaix/+rthkol7n7NjJjhpFKzARdqrceRNj96/M4qIwHmTRJiITneBsPrvw6?=
 =?us-ascii?Q?C4dn+eNC2SoxtPbBP9W1Crp6wCsTClLCh5VWp8uhLDJ1s3yzW6Q5H3tw8ZXN?=
 =?us-ascii?Q?wBYVSFX0g5t30uet2wANieEg2P0KI7vnUwQRLXUeTfoRZW7UcPitZEWX6hSk?=
 =?us-ascii?Q?NDn7+QpkLLLm3cbzZ2WiNInUnWNa1XrMgXYdp8xr9BdneUY3vvzCH8BS3+Iv?=
 =?us-ascii?Q?O7//Q+tGbq4whIss4PD4DMkPlFeDSUSK+8CrkaSKo+HKysgc/1aq2A/Y6hUB?=
 =?us-ascii?Q?j+5U3YqSezZexttwJ3FCKieGsrguG/VeVozBrvzKbol3XcmXTE+yKTXCMmUQ?=
 =?us-ascii?Q?O2MXTbxnYfM8nM22bqmqCI8Zn4ktNIE60SdVuMrljYYLaNZJKlNDBmVeKEuJ?=
 =?us-ascii?Q?8GaA6Zvijf1LFOfz46FM8VWqUBxuGefIsTrdtOKIvVdLr4dl3zcZjAm0jaIf?=
 =?us-ascii?Q?skena28KFmwTV1P+exc7cV4SNRgZVf1CUZWYfAqNOBD9V9VhM5UgLH+ra3J7?=
 =?us-ascii?Q?BXnoYaHzDn6n9Dbk440yXPBjIflQsKALfNIFJUFjkRqbI9BQPyD53c1BH0RM?=
 =?us-ascii?Q?q/u3QSJdLk7YeQU2oG9/6PZ2IMU9Ge3BNYafeRL9Ni956o2aiXHwG5U0u7SJ?=
 =?us-ascii?Q?D8dAx0n1RFlMB9JkxOzxmp5AODq9ftC6EpRSbTQfPRt7s+OmbR+veuDQmKQR?=
 =?us-ascii?Q?FKggQ8AHy5VUIJo2x4j+zT/vIZcwt8tdCpCHeWm3C4Pm4DctC2NZbdJAJzJj?=
 =?us-ascii?Q?/ZniNfqbR49QIpxJ7l3tf9cstMeKiop9BY3nLHcUb3OVJ5iDb8xsaqLC7Ebg?=
 =?us-ascii?Q?D+SjWVl1XoshCCwRPYcdZ0hWy7Lnn89scP93coyrABtUMoRXFVqzxV72L2jz?=
 =?us-ascii?Q?Bn0ud6OBE1I60EAbLUzYJcWA44sBfeqeiRrJ11t2a2uT7pdhdP5KD/peVSdG?=
 =?us-ascii?Q?iyd4jFvZwxcl/tCiEL0np5zyV9zADio+Vq/ItkHBrd7pFeqOPrS5Ychp/noH?=
 =?us-ascii?Q?WGYrp5pc9AyLLHDCDFGKWdtQxKXtEx3k4SHg/+ZEOqNW9MASUgeR/MzmLvNX?=
 =?us-ascii?Q?zM6qJsfsw5pOaUTwjzdn8caVJP7Zbn50PADWp8nhPfi9Vne7hNlp2rj+ywMY?=
 =?us-ascii?Q?EdTct2ZOBQ4P1HYe8Y1CpH0WEZ2ej0VlaQMqKgtW9HrxV8Ztd2MS6bIeCWb5?=
 =?us-ascii?Q?NtIM1H6EQosntfku0eEs2QjJRO71KmKIsXvUkjJd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2da7cd-666b-4eff-289c-08db2a070053
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:22:56.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3ySoJw0NeZ3Nz5ZVvgliIHa5Z9pPVjCGFn7poExwU5qrSpVAu327aelOQY29U2cqJHWcIEWFS1U0WRfjUYlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912

On Wed, Mar 15, 2023 at 12:30:21AM +0800, Jan Beulich wrote:
> On 12.03.2023 08:54, Huang Rui wrote:
> > From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> An empty description won't do here. First of all you need to address the Why?
> As already hinted at in the reply to the earlier patch, it looks like you're
> breaking the intended IRQ model for PVH.
> 

Sorry, I used a wrong patch without commit message. Will fix in next
version.

Thanks,
Ray

