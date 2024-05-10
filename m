Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26508C2232
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719730.1122579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NYX-0003BO-Ui; Fri, 10 May 2024 10:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719730.1122579; Fri, 10 May 2024 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NYX-000399-Rr; Fri, 10 May 2024 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 719730;
 Fri, 10 May 2024 10:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asbK=MN=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s5NYV-00036i-UT
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:32:48 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a32f425a-0eb8-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:32:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB6629.namprd12.prod.outlook.com (2603:10b6:8:d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 10:32:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 10:32:41 +0000
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
X-Inumbo-ID: a32f425a-0eb8-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APD3gvOqEcQJQ6279n9k7BN7Y1z7b/0qm6JzmuP5jKOt2J4uE80wAB2xg2U/F8Y8IdCgIHewANU8H55nUHOgnM8efEDlYJH+oeD6jx+vdP4BRqvLiXBsEPOsC2QJ8kyX5naHOG2rcLiV9wdvO6Uvu1OxlXAsjKFptsIyd/3Q/4grHe3XcqBn4Fxy1gFiVXKq0Hh9zM3f3p4cRnlUl3Xg3FM8g3nNjkUU2GYaxXgIUcDQtCw4Hle2Xseaqtcc7fvG5GR7HdWZV56paTYgHwoEw0nakR2V+zxk8BDAVo+sikkuk24cYZnMWFghxe8++qFC0M04tVDsHdGOH/j0VozX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DlvffFaJWIcmHhxIE29kRj/ZR0JyrabAJyzSjN9rTQ=;
 b=EvZDVBLUoLq6z9SwcW9iIww5N6Fr/oSpsSeVPXkj2/5uakikqucRno+e8lKU/X3wvmIp3ZF2ObfC5K8OaBppMNlQaR2Gd6UyWeihiF8SzyuYQl/2SBp833tCZKlwS84WEqLl/08lUJ2gBP/M1KRTSrFloosPnASCSr8ssiHT3W0vc/ACmIQHyx+NRVHBdHdzk4OlpezDf3iLgBzgwiPltuWlgARQv6/ZZbrvZep6JZfbRezGp820bBdGI1isR1f5pd2HV4PTQ0n2FAt9m8tq3wF4Bn2AhC2N1GEJA1k8kOWkf3D6jTEJmuZkd1I5p3MY2juZX0auhr3P/JLzm+1TJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DlvffFaJWIcmHhxIE29kRj/ZR0JyrabAJyzSjN9rTQ=;
 b=t7SMxhd4BL7jJRgEIwWORoLKiMfeX6Nglgyrc4bvpkcPa6/YmMrra757kmsMSuqANKrQ2pUY0/S7vY2JHc4QUx1YwnKj+ssmxJb0NFjHwmLv/zgYws02hOfn0v7aKHbpIiM39c/PZqll0O13xwscS+Y6ANQ7T3QQ1xpSXZBegY4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
Thread-Topic: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get
 gsi from irq
Thread-Index:
 AQHakgrPZQMiHHEzE0Gs/TUOGsHh17GQJ2yAgACnAgD//41hgIAAiXAA//9+YoCAAIdwAA==
Date: Fri, 10 May 2024 10:32:41 +0000
Message-ID:
 <BL1PR12MB5849F1DE8B4A3538C79CE5D3E7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
 <20240419033616.607889-4-Jiqian.Chen@amd.com>
 <79666084-fc2f-4637-8f0b-3846285601b8@suse.com>
 <BL1PR12MB58493D17E23751A06FC931DDE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c30ebad2-1ad3-4b58-afaf-e6dc32c091fc@suse.com>
 <BL1PR12MB58491D2210091DF9607A354AE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d0b5e7d5-3503-49be-9fa3-4b79c62059ca@suse.com>
In-Reply-To: <d0b5e7d5-3503-49be-9fa3-4b79c62059ca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB7579.namprd12.prod.outlook.com
 (15.20.7587.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB6629:EE_
x-ms-office365-filtering-correlation-id: 349365c0-84e0-43e3-6bc4-08dc70dc85b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?SVdyVTlKbCtTWHNsTTZyUDRzUXRaSjBmYXJqVHMwc0VweG5mSDVnV05ZVUpz?=
 =?utf-8?B?YW9jSTRKS3l4WVdRWmllbGVsRTNleXEyUjFvY2g0UUhRSStQb1ZFbFZ1eHlh?=
 =?utf-8?B?SVFycktjWkpZV2pGeVRMWWR6VTVFQk1QSjhvajNHQTREWDB3S21uNDZiQW9P?=
 =?utf-8?B?Mys4ajJlMmZPdnYwZDhlZkpVZnhKUGNMckEzSkhBK2V6WTlsa1dZbk5xOEZJ?=
 =?utf-8?B?ek1JZHlnYmsxNVBzb2hmVHdCZDcrRnBnQTh1WjBqekNCZXc5d0c0OGVJaWtO?=
 =?utf-8?B?N0ZvVWFjVmh6QjVqT2pIMEtmUjZuM3huSnVlRmN3SW83Z28ra0FSNVAvSjVv?=
 =?utf-8?B?OHJ1ZlQ2OUw3ejl1YTVtdElybWp5TlRmaG9CNzZRQlhkTkxVempsc2Q4WmR3?=
 =?utf-8?B?SVJQWTZqdkNPQ1BLSTJVWlIyMVVCTi9iSm1zaFdxUVpkMFNTZVIwdU1LVDFw?=
 =?utf-8?B?YjJOZ29tUVU4MmlXak9YUW5FanJMMVN6OHQwRVYvMXlleXIrTGRGOXRQUlE1?=
 =?utf-8?B?eG9VYmJqZk92T3Z6Lzk0RVZMc3dFNFQ3ZmtWemNvVWVweUdNK1BpeUh0K0sw?=
 =?utf-8?B?bGZmcFI4bUhPSnl4M0VMSzV4ajBTTERMVlJwOXUxWjl5RXpjTEpvN3o5YTlC?=
 =?utf-8?B?bGtFYzUwSldmOW01eTM5UFgyaTlkN29OYVpVMDdTci9kSzRJODhXTytNTDU4?=
 =?utf-8?B?VUJMSmNrZjRINUQ2cnpmTjhJSDJLMTdnNjk2SXg5QnAwT3FjSHFwNXRmS2FR?=
 =?utf-8?B?dVNjZG50THlCVGV5S1h6UWNRTzBtZmVGeUgxNkpjUWc4K3lKdGd5ZGN6eUJK?=
 =?utf-8?B?NWNNZExxTk1nYWJlZ2N4WE5IR3ZKK3p6R3Y4c2FzVE1VV0tFMW9GSXlTODdi?=
 =?utf-8?B?ZU9RY3JyU2piaE1zRlRETXJvM0Q1UzN4UFdMSHpJYVZIUlZGVjVMUUFuMTNo?=
 =?utf-8?B?OWJxUWUzaSt3aGhBTGpRSnpoUyt2bE10M3ZkcnRQeGhJMmF3WHZJTnBCOThu?=
 =?utf-8?B?UElSSkxpU2JQK1V5YTRwSjMwdTdndXRKSzR4REt3SmF6Yk13UHkvdksvNXlz?=
 =?utf-8?B?YXpOUEFsb3kvMlNKR0dTSlJVRHdHSVhKT2RCaXdGMVd3Tk9RUXNhcUVDZ0hP?=
 =?utf-8?B?blhSck5QbFJUaitjVUZ4cFFKdklveW40Z1FQbXBRY3VrQTAyVW1YTUlvR29m?=
 =?utf-8?B?TksyRDQwK1JzVUFmNGU5NXFqYVhRdm5OMnIxWXFYTWhQUDRhTU1SOXBKUE56?=
 =?utf-8?B?V1FwQ0VPSVYwQ3FzQlRjamcrMWNQNEFmZ09iT2VkQlpCOHRCRGdkTFlmaHh5?=
 =?utf-8?B?U2lXU3RLNzJYSWtVQTk4dTAxWElTRUxXWFNpVnlZdlpXRTNuVWVkbTNaSklR?=
 =?utf-8?B?UXBnbkU0SHRnUFNJTGo2MEdFSUhlOFRaZU9kUVdUUzlPQUNMaUl2N1gxM292?=
 =?utf-8?B?TmJTdStjbHpNTXJrYlRwWkswN2tMcCtkY3N3UXU4SzYvbGFLQU5ZOG1tdDVt?=
 =?utf-8?B?K00vb05RZTlySTJ4eFVaaE52bmxnWnNiN2NOdldVVnErMmxNR0NnUWxRMWxT?=
 =?utf-8?B?aml2M2ZwTjM4VjkyQkM4amdFQlZDdm16dkVZRDZKT2ZwSFFKaG1oSDVaUEww?=
 =?utf-8?B?MFlnWkN5N2F1UnhRTUhIRE11eHlEMGhHMEJZekdjSnlJYW1mcXl0cnh2b1Vu?=
 =?utf-8?B?dStIU1NYa1Vndm5xU2t3K084RjdJUGExdFl0WWtzUE5CbUw5VlRxaE1pb3FG?=
 =?utf-8?B?Snc3MUZRNW9OUlY0OUU3RDVpQVF5YlhjSEpqYkFBR1RGeERzd1RoV3IrRkhV?=
 =?utf-8?B?OHhPbENhN2VKbzdUWWJtZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3MxTCtvbTdZaHI2cFNwRXVvM1lQVmh0UG9FaHpDSHdwcHJ2K2JGUUphcXJ4?=
 =?utf-8?B?K2t3WVhibTBoaDJSejViT0oyb3NsdnhGSjIyZDVxT28wVCtReUdJUGJ6V0E1?=
 =?utf-8?B?d0FQak81S0xQdldldWhRZ0h4Wk1Mc0dBWVBra2xXaE9aUTBSdlYwbWtQZjBs?=
 =?utf-8?B?allkNXFXc1o5RTh4SVIxcTJlMzJBNXBQKytzZzh5S2JucWwxby9UazByNFR2?=
 =?utf-8?B?UDM3Qktrb3NzNnF2UHJUdzFjOC9NalZwQ2RSa3g3QUp1VmVmNERKU2YwMTZ2?=
 =?utf-8?B?cmVXMHJtOGtJS3p4c015NFZKU1hNczZUNDk2L05EeHJ6VGRhUnovNjVoR1Vw?=
 =?utf-8?B?Y3RrOFJzZzZqOWVGRzRaY09kQnV6T2RTL0dmRExHeWd6azBvKzVZSHNrQzN6?=
 =?utf-8?B?czJLQlVqRjhxdUEycU51bGJrUENyWDFKMjRSbUN3N29qakhQdldiZEJaVEdo?=
 =?utf-8?B?MXVTellxTjBkOEMwM1Z4NzFHMHNYREo2b1NMZkt4SUx2dkZBQnZNUnREak1w?=
 =?utf-8?B?aTZiTURWSGpybmlLYm5EeW4ycWtGMDdKWEZqQVJQdHNWNzlJRVluamtySisr?=
 =?utf-8?B?L2RpNTZ4TjU2ZmxhWnFtd0l5WFVhdS9HMDh5aHRTQnhrTE9ycktUUS9CaFVt?=
 =?utf-8?B?eU5rckZxK3U3UWg2L1J5ZVRTQ3o3OHdOWjZaUHBTZkJIZ1BrelB5WkVVRU8w?=
 =?utf-8?B?dHVHNVliWFV5dmd2NFpFd2hKSzA5ZVg2WDZJbmV1dTU3dVFxb1RzQWJrVlFD?=
 =?utf-8?B?LzhaVTlSTUI4ZmdJd1QwRHdtdzh6ZUZkVkVIQjRYSGdOSTd2NFJzaGUyMXhX?=
 =?utf-8?B?TjRlUjJKa1IvcmdBZXViUzd2cEpqWE1TTlk4RWRMWVlkL3htRTQxTm4wUTU5?=
 =?utf-8?B?djRCRlJEUEtQSldsTEo5Nk54bU9WM1JSUmdCM244aGhUN1VvaC9IUDVScFlF?=
 =?utf-8?B?SGN2cE5WVk53SFhZQndTeXZqRmtLUVlneHd3eGFtWURIL0ZFSFdPZ2p4Y254?=
 =?utf-8?B?NVIrWDNUcVVrcnZBV0JMNmp2TWpBZjZacWpyVDV6Q0JZb2U3L3M0dWdHbGFZ?=
 =?utf-8?B?OGJ3TUpvOUpQZFBjR2k5Y1dpbGdSc1daOVBNME5JMHl0MEdma09SVHRtSW5p?=
 =?utf-8?B?aWxjODNqck1mOFdiUEJmYWhhdUtwNUxVeXJnSVFrT2hXYjZSZlUxNkRMcUl5?=
 =?utf-8?B?OTk5WmdJODlEUmZrbFpFdGxmaW50eSt5SFZsZmhkeTk3U1VjSVdiWlZpK1Fi?=
 =?utf-8?B?TjRYemVRckNQR0RZVmw1bTEzK2RYZHM5dUlFcmJRaGJrMUlJWnZtWE5zRGdP?=
 =?utf-8?B?b3k5WldKd3NFQXNFUHBhQ0UzcVFRVEpuUk42OEN5eVJDRlVFdys5ZDd3eDdo?=
 =?utf-8?B?aXViK2xsR1l1eFI5eXpJU3BYQ0tRNVhtTmpRL2JqRGsrWkFUbXRMZUtXRWwr?=
 =?utf-8?B?OVNmbnBEazY3cm4vMkZFaVJ6TXVWL3VyNEIvQkNlZnViQWRLV1ZqUEsxQjRa?=
 =?utf-8?B?dUZwbWZ1QnNBSDA2SFRrV3ZMZVF1cW9VQkhWQ21RK2RidGtCcW5qNjRCR3hH?=
 =?utf-8?B?cFpLdkJRSmhhY0Q4dmI4TVhnMlFYUUR2NSs4QTlVRG51M1FuT3p6VXVUWEM2?=
 =?utf-8?B?eVZ1cktMWjdMMlk5Y25HdnVGdWFYZHdqUng2Q2F4V2plVXA4TFFCaXVBTU1V?=
 =?utf-8?B?c0UzMERpLzJTbmVnZDVPbFBWRU9saDhqUWN6T2dlbzNaejQyYUg1UUJFaXQ1?=
 =?utf-8?B?MnJzQXVMVnRIbitoT3FydGtWczhURG1zdnFDWU5Wa0gvNm42d2IzR3R5QXVW?=
 =?utf-8?B?MCsvSjdhZVI5Z2MraWhXSHpBa0FGTG5jR3JGNTRFckRkY0VTaWxqd00vRHRP?=
 =?utf-8?B?WnVkK2pLRTEzRzFBWFBySDFsbmwzaFR3OEZoYlJ2MCswR2RjQmlHOFZzd0U4?=
 =?utf-8?B?Z2dJSHJpOUlGejlUSmd6MlEwSlR5aEYzUU8xUVN0c1ZZVW1uZVZLcHVQbk1h?=
 =?utf-8?B?UkpaazZOQ3Q3OThzU1p0QWNrWFVyVmx0eW93dkRMQjJQOU91ZjNndjJQM0pl?=
 =?utf-8?B?S2JaRnd5bVc3RGdoN05wNmh1TUsyNHNMOFBTeHJvK0JnVU9VWEI4TkdaWjhL?=
 =?utf-8?Q?Eros=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4484D65BF67E54B92A7D46EA85A2853@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349365c0-84e0-43e3-6bc4-08dc70dc85b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 10:32:41.7907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fe9jDEy0gxptDI8M10sIrAqA+uKHMDogMvsOl62gzxqSSFAwk0zx/Q/DmdCBudXrh57TmkQsoR/zBFhtO0lq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6629

T24gMjAyNC81LzEwIDE4OjIxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiBPbiAxMC4wNS4yNCAx
MjoxMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzEwIDE3OjUzLCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOg0KPj4+IE9uIDEwLjA1LjI0IDExOjA2LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBPbiAyMDI0LzUvMTAgMTQ6NDYsIErDvHJnZW4gR3Jvw58g
d3JvdGU6DQo+Pj4+PiBPbiAxOS4wNC4yNCAwNTozNiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+
Pj4gKw0KPj4+Pj4+ICvCoMKgwqAgaW5mby0+dHlwZSA9IElSUVRfUElSUTsNCj4+Pj4gSSBhbSBj
b25zaWRlcmluZyB3aGV0aGVyIEkgbmVlZCB0byB1c2UgYSBuZXcgdHlwZShsaWtlIElSUVRfR1NJ
KSBoZXJlIHRvIGRpc3Rpbmd1aXNoIHdpdGggSVJRVF9QSVJRLCBiZWNhdXNlIGZ1bmN0aW9uIHJl
c3RvcmVfcGlycXMgd2lsbCBwcm9jZXNzIGFsbCBJUlFUX1BJUlEuDQo+Pj4NCj4+PiByZXN0b3Jl
X3BpcnFzKCkgYWxyZWFkeSBjb25zaWRlcnMgZ3NpID09IDAgdG8gYmUgbm90IEdTSSByZWxhdGVk
LiBJc24ndCB0aGlzDQo+Pj4gZW5vdWdoPw0KPj4gTm8sIGl0IGlzIG5vdCBlbm91Z2guDQo+PiB4
ZW5fcHZoX2FkZF9nc2lfaXJxX21hcCBhZGRzIHRoZSBtYXBwaW5nIG9mIGdzaSBhbmQgaXJxLCBi
dXQgdGhlIHZhbHVlIG9mIGdzaSBpcyBub3QgMCwNCj4+IG9uY2UgcmVzdG9yZV9waXJxcyBpcyBj
YWxsZWQsIGl0IHdpbGwgZG8gUEhZU0RFVk9QX21hcF9waXJxIGZvciB0aGF0IGdzaSwgYnV0IGlu
IHB2aCBkb20wLCB3ZSBzaG91bGRuJ3QgZG8gUEhZU0RFVk9QX21hcF9waXJxLg0KPiANCj4gT2th
eSwgdGhlbiBhZGQgYSBuZXcgZmxhZyB0byBpbmZvLT51LnBpcnEuZmxhZ3MgZm9yIHRoYXQgcHVy
cG9zZT8NCkkgZmVlbCBsaWtlIGFkZGluZyAibmV3IGZsYWcgdG8gaW5mby0+dS5waXJxLmZsYWdz
IiBpcyBub3QgYXMgZ29vZCBhcyBhZGRpbmcgIiBuZXcgdHlwZSB0byBpbmZvLT50eXBlIi4NCkJl
Y2F1c2UgaW4gcmVzdG9yZV9waXJxcywgaXQgY29uc2lkZXJzICIgaW5mby0+dHlwZSAhPSBJUlFU
X1BJUlEiLCBpZiBhZGRpbmcgIiBuZXcgZmxhZyB0byBpbmZvLT51LnBpcnEuZmxhZ3MiLCB3ZSBu
ZWVkIHRvIGFkZCBhIG5ldyBjb25kaXRpb24gaW4gcmVzdG9yZV9waXJxcy4NCkFuZCBhY3R1YWxs
eSB0aGlzIG1hcHBpbmcoZ3NpIGFuZCBpcnEgb2YgcHZoKSBkb2Vzbid0IGhhdmUgcGlycSwgc28g
aXQgaXMgbm90IHN1aXRhYmxlIHRvIGFkZCB0byB1LnBpcnEuZmxhZ3MuDQoNCj4gDQo+IA0KPiBK
dWVyZ2VuDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

