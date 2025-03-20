Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9316A6A4EB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 12:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921865.1325585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvE1T-0003no-Nv; Thu, 20 Mar 2025 11:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921865.1325585; Thu, 20 Mar 2025 11:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvE1T-0003ln-Kv; Thu, 20 Mar 2025 11:25:15 +0000
Received: by outflank-mailman (input) for mailman id 921865;
 Thu, 20 Mar 2025 11:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLXl=WH=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tvE1S-0003lh-8D
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 11:25:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2614::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd497381-057d-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 12:25:13 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7776.eurprd03.prod.outlook.com (2603:10a6:20b:410::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 11:25:10 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:25:10 +0000
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
X-Inumbo-ID: fd497381-057d-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYf+Wq/XXYoCngktOIppaQIdVOAGdtrafRiflBqTHemLgoQ6F/gLlWjcWXzsVDMcvfFkgRsktEgK0N2ZCPx2bvY/fHZQ0mE2elJyFSprezZMU7gSm7A5MeT1ye9Hc4y6AZMT13ez8TBO2996i3xkqUnYtZHEecvjCwGJDXd2Y4ZWSuUI/Oq0XYIT7Z5/10Q7kGtp3j3mSqsyZYD/EHf/swlvcAMDI+Z6J8DJpZu8Gtpq6am0reylTxzLc4k8ulfWMQoALm26xrBIAXXUcDakT2ShKBzSNcXoqtNBq5XpH2Cfv6UxcbDjV71hgXHO0+mENXuLont78pPDeg3UUiRLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNYP+musNCoEqqt1o2a6ZEl2BLOXj/7sxsEi7H4Ue78=;
 b=o2sTax+MC7/82JMpG1+RTQPOVcgE9L36aiCNng9nroyGFA4S+sWnSek2QXjCrP8Pz8umDC9DeKbdnaCDIDlb14zXmBgkWyHJzjHT/FB4qXqZOR2sIpidoLRpUhCvC4euY3hUOISbuHh9j+nPwnCLmROidPpkAYnH9lbTRmRjT2l6LB/7XVsaAM2Ep4SR/xTe+snj0y+VRpuK8zyXsvTsxLimWu1XBXB6y5guDFQAC9nr4jQXncHFT8n2330/cjEYC/vNVynTEznG7n0VjdRzjJMkGTQhojClES+0QwPw/B/8xj8iMm1093c2xKM2RjUsFGBPvTxBKpVphnfEEDGSTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNYP+musNCoEqqt1o2a6ZEl2BLOXj/7sxsEi7H4Ue78=;
 b=FqwUQGowqA2FXjm/4FtskSM0+VbQk71UjeNrc1lXeFPk57b7yyx6cfqRSzn985N1u2w8RtkkpFrCbIbuMN+CkQi6kIeQFJNH8oBS28NOKtHCIYBcDWn69+VjE6O6/VtHYTMS1iSK+Vq2Iink+eq7K852wJGgxOf51ZtdSlZcT177mNOHCHF0EuZsX6S9MH6AF3y7Pxk7xqGMTBrgd5y0ES53gzZhiOvGBkMLOsw6VJ3IQBVQEUeWxKmglhI5acy65XE3a1RiBWjN2V2FVzopmF0n2kIXlWtZVnF0ceObVuSGHqw8i0SxipKmctso7IG4XejpMQ/QaiBHdrfwRSrYwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a0f4bb7b-d560-4017-af0a-1544623abd50@epam.com>
Date: Thu, 20 Mar 2025 13:25:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mirela Simonovic <mirela.simonovic@aggios.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: e7df34c7-8524-4dee-e005-08dd67a1dfec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGdpZlVWQVRJSzllclpGMlhGTWNMR0ZVQTN5Y2RFd1o0NzErbFIxLy9rQmpp?=
 =?utf-8?B?b3FDWCtKYVN4NjEyVWpvanNVVlBQN2YzMHd2YjR6QkJhTkQwQmlTTW8wcWQv?=
 =?utf-8?B?d1hQaC94OUNMM2tJQzFWSzJYT3RtU3ZnSHRIYkNsLzl0R2ljT0E0OVdnOUFw?=
 =?utf-8?B?ZkZJandXL280aml0bE9adVdNMmlYRVZXSERBbW1QTjl4My8yakZNcmczK1Uw?=
 =?utf-8?B?eGFXRllqeUo0RTJ4NHEwSmJETHgwVW95M1lwVmxwa1VidytmZmE2d2ZIeGR6?=
 =?utf-8?B?UTFZRTdMb3QwOCtobk8vc1R2dVJqYnZkYTQ0SUpUYWdOYzR0UFJlVERLRFdZ?=
 =?utf-8?B?SktlREVKYUlTOFY4U2c0UkNKZUp5T0lqNDBpWlE4RldHS3g4ZEloZ3lNVk1C?=
 =?utf-8?B?QUkzVkkxZE9vTlNpd0VocExvQmlFdDVSSlRVYlFET0pIdGJCUXpYUUxzMmo3?=
 =?utf-8?B?M0xzMzA0QlB0bUV4bXRCQWhzZ2hoVHl3YUd3V2VTd2ZqLy90b29FZkFKYVB5?=
 =?utf-8?B?Nm8wajVOSVkyN04xWFpKRWV0SzdHN3Y0SW1qOHVaOWFKZ0hoRE5waDNBalhQ?=
 =?utf-8?B?a0F4YWE2M2duNHVJQW1id2dxVkV5ZUpxZU9RbFFhVWUrSjU4UmhML2NHeGRN?=
 =?utf-8?B?R3huRUkrOU0vR1pZZklmdnIzcC9aeTlITUV0d2RBUWRkVHltMUQvRWFhUU53?=
 =?utf-8?B?SndhcGtiWjdieGhLcnl4NkJzZFRDZkVKdStYVHFUZWMva2hSYVc0cDFZNVNJ?=
 =?utf-8?B?c0IxZDExZjJvYmUwOG9oYnp1aDEvdWtEMVVwOHE0S1FPWE5OZTA3dHBvdWtt?=
 =?utf-8?B?cll3Qk1ZeGYycjd4cFhTeW9scG1DS0o5ZXB0ZmhSVUFVWVVBekVYRHBWb0Nr?=
 =?utf-8?B?cXBwWWNYTHpjU2FvcDVSZndhalJ1cTdNR3JzTEp3WmQ5Mnk4MWkwWExIM3dp?=
 =?utf-8?B?TzNmNXc3d2s5R0xqQ2VCZFo1UVIxTEhHbVM0SGFVMFpqbkVHd0lMd09yN0Ni?=
 =?utf-8?B?eEV4b0tuOTZRR052U2E5Kzd5RTlESkwweGx1dnFBekdtdWVXbXdLOVE2ZDZa?=
 =?utf-8?B?M2RrcVJFRFZrZGZZbGZjaDNIZEhoY3cvckxRQkZ5R1ZsWkkxU0pMTm96bW1u?=
 =?utf-8?B?UTNlRGs0TzQvclJTZzZQT2t4Skkwa01iNDR5QTJEK08waFczL1IrS3Vpc3Qw?=
 =?utf-8?B?dGNBY2t3OWN5aFVjYXg0ajJHWGxUVExETHI4K1hlaHlOVkVEMmJTUzlEK21H?=
 =?utf-8?B?eDRCUDhvYVA4TGVGbEtaZXcrYytWbFg2OW1CNjdaMGhMekZmUXcxQjFvQVkw?=
 =?utf-8?B?SVJ0TEdNc04yZDc2c3YyaUZPN3U4L1l2NmU1TThMTkRNVWlXL2xpUUZYaDAw?=
 =?utf-8?B?UmlmN1I5aGFNUnlVS1M4c2g5bWduSjIyeGIwVm5NWmJQV1VubThCZW8zTUdC?=
 =?utf-8?B?VVNrUzFqb1Z1Q1NVNEh6TitZTzRLNDJFNzNMZUhsYkF2TDIwK2J4MEpnRmVp?=
 =?utf-8?B?OU5aTHBjZkNnTmhhdGp4czlxUFZ3ek5tUVFtOUMrK083Wng5SHF5Q2hCV211?=
 =?utf-8?B?dXhxNnF2OE4vOHovUE5WM0JoaUN6bkdXRFVXdHVFUXNoaXlLSGYyUFBsUlZn?=
 =?utf-8?B?TjhIV25EbmpIM0drdDA3TUlDTDVxZS9RcFFQNmU2OFArNlB5aGpNbDh5U2Rp?=
 =?utf-8?B?UHM1UC9Rbjl5QmlKa0N1aXJrMWtFZFFyYSt3VkRQNTd2RVVMRmRaWEpocWky?=
 =?utf-8?B?cnVhQXlzK2N4L0krTWdDeTJHRkRIUnZBd0cxM2F2dU9QcGNEak9WZTBJb1F1?=
 =?utf-8?B?VFVHTU5QanN4SHVudE1yT0xyRkEvbHNVYUpRQmJ0a2VNV3NDeDF4S0k3MStK?=
 =?utf-8?Q?hYliJ/Q4v9xuf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1pYN2ZZRnc3NVRjSjFQK3p3UnowMWt3Z1l5alVUcGdiMFF4cFljSXFVUHhF?=
 =?utf-8?B?UGNsQ0t4WEJoVjZnRmxDd0I5L3dtN0VWRnVGbzdIdFFtaWV6V1hxY2pMOTQ3?=
 =?utf-8?B?QktsbXNWQ2VVOFZZMU1qajF1N1ZMSjEwejcwZVRlWUs1NFZGVG14Vi9yM2l3?=
 =?utf-8?B?cWUyTzBRU0xJOVV5RTZsd0VlSm5hb2VFeVU2NkpUUUpjVE40NGV6aWlRcUVC?=
 =?utf-8?B?cmZyT1NpQWZEQnNSOUhQUzZ3MXNhUGFyR1JXeS9VdFphMUVGd2ZkbmY3dVJB?=
 =?utf-8?B?MllmQWtCb0xUMmpOOE5LTC9iTXI5NXBMaWZEd2VoQUNkckllNWo4ckJUNE9U?=
 =?utf-8?B?Vm9hMnhFcGhqaC81eXVtVnFpMEhwY1Y4Zk96THhVcnJmOVFZNzNuWHFLbEtW?=
 =?utf-8?B?aEhXNEZFUDFrUlR2cFFnREg5YkQzNXhXaGN5TTJseFl5OWVsczlhMVRrVXdp?=
 =?utf-8?B?S3FacVl1bTBWcDVzQ1NqbGMzS3RibEk3TFVRcnZybWtPUlV6U1VwRUdMb0Q4?=
 =?utf-8?B?emJid3ZVQ1crNEZ6TGp5SXY4UURKR1NWc0prTytPRE1xWmJyVVFVbERlVmh2?=
 =?utf-8?B?MVdxaVRscnhiSTExQmdQQk91cEJtenAxWEFpSlQzRjFaSlNqSXBmQ0g0ekFr?=
 =?utf-8?B?VmtKcDBmcVI5MklDWlI2QTg1RlJ6Q2ptdGFlQlIzZURwWEx0MEowWmxXS3JT?=
 =?utf-8?B?dHh0aHdwSVBlYUduQ3dPRUtkcDJxU2JVbUwwRHVNRUFITjhWVGsycVVXdW13?=
 =?utf-8?B?dDJFUXJ0TG1MSG1iWVFmL2xHeXYwV0NTWlVXUS9FMWZhSlgyQzhNMUY4R3Bv?=
 =?utf-8?B?cDBzcWxWbVdhYWpCK3RibzJ6Uzl0eElIQUZYNWFRRHBDSzVMR09MdzVTYXNs?=
 =?utf-8?B?dUY2K1FoM3hmUGVsekQ4QndZWVlLK2c4TStRcWdHRTZsNlJtTG8xejRBVUdQ?=
 =?utf-8?B?bzR1b1k5TEJDeTNXaXRsQlZ5LzEzZ0REa01vVjluQ1dtVGcwQ3pXejVmWWcy?=
 =?utf-8?B?emhOcFNtR21zaFJkWmZSak52ckxOdkVnbEFRSWx5STRSMm8rZkVMYWRTYis2?=
 =?utf-8?B?UDZLTUlWbk5hZVhoTjg1dUEzZ09sWDVLM2U1WEdnbVBCNmkvZjZHSUkxVUZt?=
 =?utf-8?B?dGhDZWhmWHNublBhall2WXRNVzZnc0ZYelVwekdFeVk2TlhwL21sQmJGSmtC?=
 =?utf-8?B?V0hEL2tGdFQ2RHA5MktCbCtVSzhwTm9OWm5hTFVNQTRPZEhML2w0Vkg5aXF5?=
 =?utf-8?B?aC9vVnhvVTIrUFAyYWdIb0VHSXJoT0owbS9qNytRQTNZOVU2TUlYTU02djFs?=
 =?utf-8?B?Y3hFSE56Ulcxc2l2cTRiS1h3UXdUM1VleG1EV0tKa1NLa0Y2bHlkaWlVbExv?=
 =?utf-8?B?anhDYzUwOEFKSmNTZXJQZGM5MzllOUlkSEpaYVpNWmRhWEk3NEJtck9vMyt3?=
 =?utf-8?B?SVdHdithUkFkUUdqMmVKcUgza1k3VnNxaytmSE5obTNCYkNBbzRSNGcrRXZk?=
 =?utf-8?B?eXNhbWVmSmIwMktHTXdZSkZOMWRiMUJQczBzczVqUVVYRS9BRzQzSjlOb010?=
 =?utf-8?B?N2FHanNja0g0UW5XZm0xU2gzNi9YWmtBb1dRVCtwZmEvSmgybkVidG56aE1M?=
 =?utf-8?B?QWRYdlhpd0hFa1NkaFNrVVhzMVZwOHFvY2ZQMzYycFd2MGVjY01KUFlabzNS?=
 =?utf-8?B?MmtMY3M0VHJrSXR0elY1QlhTWkNPenE2VDF3SDJIeXNYdG9MQzhWYlFsWmhY?=
 =?utf-8?B?NzhPRWhJcDFINXYrTzN2NmtqQ3lhNERmZDBCd20waDdHd3NsUnpOZ01qYW05?=
 =?utf-8?B?Ky9BTEhJVTdQZjNCYmlTWlZyRzdGSFp4UjF2V0gzQ3d1bHFkZ3I5b3FPaFBT?=
 =?utf-8?B?V05xVUVUWFAwWU1sdVhqY3I2UGZGR1BHd0c1azRsRFZzWHloMEVHSWw2NmRR?=
 =?utf-8?B?ak9YZ0ZHRHZ6SmN5amMyaVVVSlBLb0xPQnZsYUJ3UW93Y3VHSi9xb2UrVk50?=
 =?utf-8?B?aTFxVXoybEovWmZWWjNSelRTengyRTZrcW40KzRPTzU3bTBXaEozdFNDUjhO?=
 =?utf-8?B?SWlUdkg0bnFxVjJjVG1XbU1hRGJJZVpVbDRYU01la0krU2t3OFlEd3RUYXFw?=
 =?utf-8?B?b014Q3VPNmhpRUxRQ2lBUjhDY1czRlIwVHkzMHp0VjV6cGlrRmlMOGo0bkdM?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7df34c7-8524-4dee-e005-08dd67a1dfec
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:25:10.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpsxCnTC55M/RxD3y857H+0AZxWyAHEI1RtbZSmQ5hARr0A6igDO3Gw9bNrwA1XzNp1WSdFgBFqSwtNigyr5R2MISV7XwsBHCthZKrpNTCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7776



On 05.03.25 11:11, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch implements suspend/resume helpers for the watchdog.
> While a domain is suspended its watchdogs must be paused. Otherwise,
> if the domain stays in the suspend state for a longer period of time
> compared to the watchdog period, the domain would be shutdown on resume.
> Proper solution to this problem is to stop (suspend) the watchdog timers
> after the domain suspends and to restart (resume) the watchdog timers
> before the domain resumes. The suspend/resume of watchdog timers is done
> in Xen and is invisible to the guests.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - cover the code with CONFIG_SYSTEM_SUSPEND
> 
> Changes in v2:
> - drop suspended field from timer structure
> - drop the call of watchdog_domain_resume from ctxt_switch_to
> ---
>   xen/common/sched/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>   xen/include/xen/sched.h |  9 +++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index b1c6b6b9fa..6c2231826a 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
>           kill_timer(&d->watchdog_timer[i].timer);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +void watchdog_domain_suspend(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            stop_timer(&d->watchdog_timer[i].timer);
> +        }
> +    }
> +
> +    spin_unlock(&d->watchdog_lock);
> +}
> +
> +void watchdog_domain_resume(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            set_timer(&d->watchdog_timer[i].timer,
> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
> +        }
> +    }
> +
> +    spin_unlock(&d->watchdog_lock);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */

My understanding is that domain's watchdogs support are not mandatory requirement
for enabling basic System suspend2ram feature, as they are not enabled automatically.
So, domain's watchdog patches can be separated and posted after basic functionality
is in place.

[...]

-- 
Best regards,
-grygorii

