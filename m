Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB546B792C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509282.784769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiOM-0007Lt-MR; Mon, 13 Mar 2023 13:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509282.784769; Mon, 13 Mar 2023 13:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiOM-0007JS-JR; Mon, 13 Mar 2023 13:39:10 +0000
Received: by outflank-mailman (input) for mailman id 509282;
 Mon, 13 Mar 2023 13:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbiJD-0004ws-Lz
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:33:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf013e4-c198-11ed-b442-930f4c7d94ae;
 Mon, 13 Mar 2023 13:16:52 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 08:33:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6485.namprd03.prod.outlook.com (2603:10b6:a03:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 12:33:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 12:33:00 +0000
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
X-Inumbo-ID: ebf013e4-c198-11ed-b442-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678710795;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kyn4WieAyjHIQy+g1/Zcr7snJR74eFHpuaU63/mvlyA=;
  b=Zy4Oy2yWFCBv45Tosdr1Gl9jEo0PKCFidv5sLZqRCPy8JW8txTrjoJTZ
   wo7GgJ5aSacQT/rTql+EY1aSCBGWCeMVTjqcCxcc2hv0mh5KFylyBxIMX
   tTUlNis7qSAyMtii526lGln4vi2DuK+bf+O41tkbfQgV3DdNba4wKpu4b
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 101008811
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VWCS8K/4YsTGHJ5aGcJ/DrUDiH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2IfCDrSb/uPZGajeYsib4vkpE4FvsXRydc1HlM9pHo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklR/
 M04BBM2MSyhnua46rGpS7ZDlMcaeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpLTOXopqcz6LGV7i9CBzgoekuwmsWeoEy3aeIFI
 GoV9AN7+MDe82TuFLERRSaQoWWNvx0dXZ9cFuwm8hCl26PS7wuJQHIZJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETcRBX8PY2kDVwRty9vsuoYolTrUU81uVqWyi7XdGzv93
 jSLpygWnKgIgIgA0KDT1VLahzOhoLDZQwhz4R/YNkq+9R9wboOhY42u6HDY4OxGIYLfSUOO1
 FAYks2X98gSDpWAkiOcTeFLF7asj96MMSbVgFpmN5Mg6zig9XOlcY1Kpjp5IS9BKt4FYzTgZ
 EbZpCtb5YNfMXWna6N6ecS6DMFC5ar9E5LjX/PdbNtLa7BwchOK+GdlYkv492Pgjkkq170+M
 JGzcMCwAHJcAqNipBK/TeoZ1qIwwT4W3X/ISJvm1RW7wPyVY3v9dFseGF6Hb+R85qXUpgzQq
 o9bL5HTlUUZV/DiaC7K94JVNUoNMXUwGZHxrYpQa/KHJQ1lXmomDpc93I8cRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:Vqg+aqgiOLFl5ka6AU3db/PmLXBQXusji2hC6mlwRA09TyXPrb
 HKoB17726OtN91YhtMpTnuAtjmfZqxz+8N3WBzB9aftWvdyQ+VxehZhOOI/9SHIVycygdz79
 YDT0EUMqyXMbEVt7eD3OB6KbkdKRu8nJxASd2x856ld2FXV50=
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="101008811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb3QHEqlBbGm52GBDCTjqkMdMYmB/RlZnoDMbzLVMgxUSlxLKnhUYeCHsOkOtDdcJrv8cWRTaMn+LzbF4e7LoZV/H+XvaB9kFLOQcwsD7IqNkOWmb6ILqUYvNwP3wcUv2x32C9Jfh8cflWZEk/y05f0KXyjgnm/B6+VP6kyC4nZuosMoJWvrPKIJSbcLkHKqV3KRJ1qrbOsOOts9l3pyVqKETtG5nhtIEajryIYQbqhQJvnaNLruwZ/IKCdnUWethoNLogJu4ap8w+W8UtWCZNz4iBY7aoagHXD3tuwf4C32yIhEdyVOKzSIE6M38LSbcS1dhVJeWXtOjyOjOeee1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9dFtfzQkyiRQz3eN4tzt3B8OXqbHpwxydE9VnCLBj4=;
 b=CVNiCy/EIWxqYww531hKdWKV4KiiNOKUVKVkdxV/GXYz6e9M/yCQ63R/OML+t7hGLSc35n2rGy19oihV5KicbwlWnMSw8yjGCrnkzNIf9P0lWMR6q6LN67sHcCdu9gCmpEnW2DSZy6Vd2k0J48YHCWeon45QKOuvY/CJ3DCU3gT3isKJpJ3/n+G5e3O4eOv4HQ8AvQ+iiPyVx62H8uJ0w/vtuflPzpKlx+7n9AoGFyqRvD8pI+YOfL6pM9s0u1z4yjLqNtB0sjiLofIAm+k6VAGpfAT951AeJ5F5y/hpcRi4ZJJ+q23S5EJkVDgCcerOS82ekcJDV9dhggfA/Q+I6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9dFtfzQkyiRQz3eN4tzt3B8OXqbHpwxydE9VnCLBj4=;
 b=CSYfIwfu+WrtAl2lFyynrzZE4dQEty3M1o81o7L5kScUb6BzASSbtXCxo/ZpIUUIJwsWfXIOyvH2AQH+1J1qNdddOq94J2k0IGyksG9pdV9AHV4RgY5DQ8XrJsFOJbxc2uclKqqP7i9P1JuQDA1Df00oGdUGGmns9GPPPXU0Bgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dd6018f8-27f5-d61a-7dbd-515dd432e1a6@citrix.com>
Date: Mon, 13 Mar 2023 12:32:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-GB
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>
References: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf417e0-22ce-4ac7-ab64-08db23bf1530
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XlF0QBU/GxxvaURWXnskynKZjg6grEJZA+VY4Os1hhlChd4+dPwp5A3N9eekGmkGXwKQTlrSVq4dQ/Rn9CBUG/0GFF13tN1NzbD3uYzoi3c8JjvlsVc5F94wLXinK06syqtBsGOplN2pKVQr4W8f49QL5G4WWwyt0xX3vYOb1G13eQr3xrCLZKuj0aR+OTkhvxTXFiRoGOHzszb7YqXMY2MbzObf6XX9MIbDlhCGSuXuWg7+z1rxkMYf0wU3M2M2h+t1UkaJVs1rqa3qaO40wizVwU12uOX8nO2E9+hcL6MShkSgIr1SZeaxtDos/9anMWsMuZ3iu5mdQ27mTMpUYFOsvLeTFst+rlmIeuUATLhcAE1K2CalQaOVBaOgYwuigUxuXlOB6m55bAs1blWH/8QY35DXcSBYqIgE02ubrntt3l1qhKK+EgdVFUTFUQiM6LrNfzPnJU90d8Qg0/uaoqfhq6B6e4SWRETLZfrj43hBq2ciPYu2+ilroVgR3ly5PF5MZC6UK57U4oVlMNKVj5ZX9omwaNuMFh2xSZHOKxjtl07T0jQfgkkZmt8LZMrltpYSMBxQFH7qp8amNUAgNi45Nbnpm6f3c79N0Wmi+WBUacq30wWCpSCa6uCNNIWwTxtScjswxujBaWVZXsHJ1bZnFDD0vtKFlmSNI8WwBfXCaNxh6Fie38UAbCg8V4glaaDlcYac9zXrvq0LenWxID/dd3YJ/fMHeSUonTD0VT8bzXEZcF9x4mrOoYxl6JxVtwNNFBbwcAX1jXFwDlIQ5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199018)(31686004)(54906003)(8936002)(478600001)(41300700001)(4326008)(66556008)(8676002)(66946007)(66476007)(36756003)(86362001)(31696002)(38100700002)(82960400001)(6512007)(26005)(6486002)(6666004)(186003)(53546011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005)(23180200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SllyRDROV3IvQ0xPV2xqTjY4MWNGWUNXTDdta0tOWjN2QWNod3lvVWhKa3Mz?=
 =?utf-8?B?S0VRUU5WaENHN1lWRlUvbGp1K09MSTJjaFlxYUlaUlhDdWltWFZKVkgwOUdj?=
 =?utf-8?B?cnE4UllJSm9MWkt2eTYyYkxvUWQ2dWZDRkdYZ3JvQ0pFRGY1RGdPQzBCeVB2?=
 =?utf-8?B?MHV4T2o3bUpQN0ZQWklzdG0vamNNZytYT2lCUGM5Wks1RUdRYU1TVUlSVnk1?=
 =?utf-8?B?TkNPM0U4a2FqN1JJVDdkajF6bDhHSUYwdURPS1F2QW4yMVdrQWF1SzRmVk9H?=
 =?utf-8?B?RWFzb2NoRjg2alpXTzVaMitTeThrSEl0aFlYSlVycVVaUUJ1WHVkSzhKdFRQ?=
 =?utf-8?B?dFBhWXBXWi9ZalYwWmU3eWZ0bU5SbjdMRUwzSmJVVTNQNmE5MmNqMFBoRjNt?=
 =?utf-8?B?bUl1aXU3NEM1ZDJoNkdjbVhLZWRQMEdKRTdyRUNrdHQ0SzFhUy85WHkvdVpD?=
 =?utf-8?B?a0pRR1FsWGRTZVM0Vm1GY2w3UjdVbVpnL2F4NktPWGFUaXBQQUVQbERhbUtX?=
 =?utf-8?B?SVViTVpnYk0wdEk4YThrQzRFVi9UbDg2WVZsK1NZUlRlV3J4Z3JDVHYvTENQ?=
 =?utf-8?B?OXJsNzZERWRlZmhTQUpCMjVaY0RONXl6TzYyWWlVcXhPZUpWVkRESjc4Tm5s?=
 =?utf-8?B?Z2NpZUJITW5VWVZsMG5qQnYxbW44Z2p1TDJGMGxtaVpEMS9MaWYzcUZzcWlK?=
 =?utf-8?B?a1daTkt4QUJwOGZ6d1AvRjY5UkhjR1dCVmd5MFVxOG05QVJTRkhhb1Y4VGU0?=
 =?utf-8?B?MjNLaFllUFdpdDJUTUozM21UTTV6QmkrQnhhbXpYSkpGM3p0dGorY2tLWlZO?=
 =?utf-8?B?M1BlbjV5bkl4QVU2RWNSZ0NYZjgzYnVReXQ0UkpGbUtXM3hLbkl5ZDI0UW1B?=
 =?utf-8?B?RWxGVkpkSlh6TkZFUHJWclFrNDRpZ2N2NEFBM2NHNGlFdFJ4YjFsRFFQUDh4?=
 =?utf-8?B?U25sMFh1aTNYcGQ4VlE3VTVSS3kzc0graDdmZ2RSajg2SWRlSmh5QmxtYWZu?=
 =?utf-8?B?U3R4RWJvVXMyMVJ1eDlLYUE1ZTJ0YzFiUWhWc1U5ZCtIQ3dGMm5CUDhxeTBR?=
 =?utf-8?B?SHd6QWxQUXJZbWp1UFFwZ0ZmaHErSTUzV1hybmU2bGhoNWRieU9aei9yN1RX?=
 =?utf-8?B?RXliSkxFWmJQZ2hZTk5aNHgzWFE1aVhGdmF0YjNtQ3dQdTdWdmlZYUlVUysr?=
 =?utf-8?B?K2loM0ZMbEIxR21SMkNxWnNiazdneEJTWXB3aVJuMlN2Vjl4QmE4OVFFcDk0?=
 =?utf-8?B?RC9WWEdFL1kyL1JqSVo0aHhWUFZxWVB2UnMyZGtkS1lLeFE2cUlwMUNZY3U0?=
 =?utf-8?B?U3ZCdWVmUzhlbUdqd2Z6cjVsUGRpRkdoZThKbXpUYWh1TU1Wbm9iMGhZN1FV?=
 =?utf-8?B?SjhvRzh2RFlQY1AzNjYvdThBK0YyVW9ESVJ5Q0hyNkZ2UzNzNjNEQ2I1T3VR?=
 =?utf-8?B?bC94QUZjOW1hc2hkOU1jRmR4Y2J3OE8xdVVhbjdjVk5CZzRvdUg3aENQVjhI?=
 =?utf-8?B?QWZ6OW9adFBGVWFjcllnQmZVbTZ6MGtaRHcyK2Myb1hQbENVR3ZEZ0E1S3Vl?=
 =?utf-8?B?OWdvYXZPcVdvMEdVTDZCQnNXdVliV3NkN2hCR1RSUFFIZWdKQnN2RCtkVzdU?=
 =?utf-8?B?ZGZsTHhUUmRqWjBsTXFPWVZvS1NWVS9rMHJhQ2ZDcjBya1NPQWpySHEvQnNi?=
 =?utf-8?B?L01Qc2QwZ2gzMkVZV1g1MFVNOVlOMDkyTFdLbkF2UnNVSHZFY2lpTURRQ3Jz?=
 =?utf-8?B?eFBmZU9JSTM5SUxENTZaeUlxVjVwTVBtSkt1UDcxK3c5cnpCS05VeVRBaXcx?=
 =?utf-8?B?d1R6a0RkYzIrUEkxaGlYTm5BTTNQdENoV2tBem4wUHJuRno2bkN3Y04zdzVs?=
 =?utf-8?B?U2YzTmJKTWRPaWtXbkQ0Q05kNjhRaUVML0Y5aGlDZmFJTUpjRVBYYStNeHd3?=
 =?utf-8?B?MzJVUzU3MXJGWUZURHRUeUdxdW42QitRY0pXUVRFenlWUUdveE8zNzNZR2ll?=
 =?utf-8?B?RFlnOCtaQXRhbE5NNy9QTnI3RVpmc01lYk9VZmV1OTJLOXp4Tm9BYlZ2NTVw?=
 =?utf-8?B?R2JsVXVZd0kydHhLbG03bFVqbDJMMWtHVnFUOFNGNDdnbFd1NHM0dmI1NTBv?=
 =?utf-8?B?RmJ1ODJsQm5hSXp3UWptQXQ5dlN5U2luQzQ2WGpFR0xPajFLRW15c0FsREFF?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?L1pOYmdyQjZibC9OK01rSGZMMlNEdjh5am9BL0d2R2RTdUppQVloeTFLOGZV?=
 =?utf-8?B?WW9IZlVCNExTRjVPNHpnaEYzVll1MVZVd1NXeXlZcUFNNGQ0QlNSTHhRVWlJ?=
 =?utf-8?B?TXc4Y2g4RS9UUkhUeHNCQVI3K1JEVWhYNHp4Qm95U0VGWGJHYVQzYzJ1bnE2?=
 =?utf-8?B?S3pvNGR5eGhKcm1rNC80a05qNUMzL1I2Zk4zRXU2SitPdS9kcEovU2xnZ0th?=
 =?utf-8?B?ajY3OHlZYm96c3RyMlNDdEl4SmloRGM2TG5nVCtibzREdm5LMEZQelY0Z0RO?=
 =?utf-8?B?MWZhMDU0ZnR0Uzg2SkN2eU1CeS9SU01JSEc5aHlzRnBBb05KMldkanpVQ3pP?=
 =?utf-8?B?ODVpV1FSZUZ5Yk1yYnhIQzdXRHQwK0dwM2NudjN0L3hJMk05SEROQlltWXhG?=
 =?utf-8?B?UWxKMkhIT2VWUE5XYVVUMG5JdUdTbk9QaE5pd25QNGhYYUVpTEd3MVhJZ05H?=
 =?utf-8?B?NklRQXppS0RxOGlzV2hQUVAzSThWK0grNDRzNFBINGpHN1hUWm10eUVxeUsy?=
 =?utf-8?B?d21QYm5YanEvMUZQaGloUzFnL0lJcDhKNEt1ZzIxd2pZYjYxZmt3ZllxSDhV?=
 =?utf-8?B?OUp3cnBOTzU3R25lcDlMQ09hMTlQSWhwd3NaTTlkU2d2dFd3akd6YUNqaWM4?=
 =?utf-8?B?eXRKbngvb0hTWjAxd2x1WE1Zdk1aaGM2S2RHVytPNWRONlJXQmF5eXdmN1NE?=
 =?utf-8?B?Z1hTOHJzM1RJRUtYQURPbVNQSWphbWJvKzU3Y3lyS21uOE0xSzJTakhYNnpY?=
 =?utf-8?B?bGdwQkZUK1dYMjZ4WUdVS2o1N1pmbjUxaVErN0xCNTVLNXpvUys0UmZaY2t6?=
 =?utf-8?B?WjBJb050VWNpVHVvaUtpT1hCSXo1dlBHZStaVkNSUkhocHBpck1DTUFDQnpV?=
 =?utf-8?B?L29ZTWlyL082KzVZVlk0cklLS0ZYc09pMlBVeXZGa1d2dkFsUkV5eVJvVEQ5?=
 =?utf-8?B?QTV2MWVFcTJtLzFJVjF3dEVyUVdyc3dIVkNjSUo4a3lFaG8rbmcxdm15Z3Rr?=
 =?utf-8?B?QmRlaDJ3WjJqdE5oMjg5NHd6WmlIbUNXOGJQVThKU1JZbmwwKzRreGIvNWpK?=
 =?utf-8?B?S2tBNzJGSUpVc1VSRWhZZXl5c0c4ZWdLNUpNdStTbnpFVW1MVGhZSUFoVUFK?=
 =?utf-8?B?UTYxcHZPTzNoWDNBMlVQamptaEVYWiszR0FCNzZGWmdBL3dpa2ZwRHpZaEM3?=
 =?utf-8?B?ZUJQYnRXZjAzRVFSWGJJS1hUWU9VWG95SVg3WkZpQ3FIM1ZPMUZUc1lSOVdD?=
 =?utf-8?B?ZlRJOTZINFc2cUVqUmRmcDNkY2MwSzhhOWorTVpjUFMzaEdRY21ldmp4MTZ2?=
 =?utf-8?B?N0NxOUwwMi9EWGdmVURDbm1CMkVrQzg2Yi95NFVyRXZCMGdQNTkwWm82WFN4?=
 =?utf-8?B?V3B6RVNFbVZhSFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf417e0-22ce-4ac7-ab64-08db23bf1530
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:33:00.7418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F42jZrwGpR4bEnRi7bcQ47lVBDu5v6xtGy1h3lmFBU5vQjf7lZx3IX0G/fWuPRPGP0bobzHvs6O7Wz8CLvvSX9eRAOmOk/JRN4KiVLkEmX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6485

On 11/03/2023 3:57 am, Dmitry Isaykin wrote:
> Adds monitor support for I/O instructions.
>
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>

Thankyou for the patch.  A couple of questions.

Right now, you monitor all IO ports that end up in a vmexit.  But this
is already subject to hvm_io_bitmap[] which means by default that port
0x80 and 0xed are not intercepted.  Therefore, you'll not pick them up
with this monitor either.  Is this intentional?

MSRs (which are the other monitored resource with a fine grain bitmap)
take a different approach, requiring each monitored MSR to be explicitly
opted in to.  Are you able to discuss your intended usecase here at all?

> ---
>  tools/include/xenctrl.h                |  1 +
>  tools/libs/ctrl/xc_monitor.c           | 13 +++++++++++++
>  xen/arch/x86/hvm/hvm.c                 |  5 +++++
>  xen/arch/x86/hvm/monitor.c             | 21 +++++++++++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c             |  2 ++

You've wired up all the control infrastructure as common, but only
plugged hvm_io_instruction_intercept() in to the Intel side.

All you need to make the AMD side work equivalently is to hook
VMEXIT_IOIO in svm.c in a similar manner to how you've already modified
EXIT_REASON_IO_INSTRUCTION in vmx.c

Please do this.  I know the monitor subsystem doesn't get much love on
AMD, but we do want to do a best-effort attempt to maintain parity.

> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 278b829f73..a64c5078c5 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4579,6 +4579,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>              uint16_t port = (exit_qualification >> 16) & 0xFFFF;
>              int bytes = (exit_qualification & 0x07) + 1;
>              int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
> +            int str_ins = (exit_qualification & 0x10) ? 1 : 0;
> +            hvm_io_instruction_intercept(port, dir, bytes, str_ins);

I'm afraid this can't be correct.  Separate to Tamas' observation, in
the case that we do monitor the IO port, we must not continue with the
rest of the logic.

Otherwise what we'll end up doing is putting a monitor event on the
monitor ring, *and* sending the same event to qemu (or terminating it
with internal emulation).  This is fine if all you're trying to do is
log the access, but doesn't work if the monitor framework wants first
refusal of the access.

Monitor functions typically return int, identifying whether the vCPU has
been paused, which then controls whether the subsequent intercept logic
is performed.  See hvm_monitor_{vmexit,debug}() as examples.

> diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
> index 639f6dfa37..22d2b366a6 100644
> --- a/xen/arch/x86/include/asm/hvm/monitor.h
> +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> @@ -54,6 +54,9 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>  int hvm_monitor_vmexit(unsigned long exit_reason,
>                         unsigned long exit_qualification);
>  
> +void hvm_monitor_io_instruction(uint16_t port, int dir,
> +                                unsigned int bytes, unsigned int string_ins);

Please could this be named hvm_monitor_io() for consistency with the
rest of the monitor subsystem?

> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> index 0035c26e12..86e4cdba7c 100644
> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -388,6 +390,13 @@ struct vm_event_vmexit {
>      } arch;
>  };
>  
> +struct vm_event_io_instruction {
> +    uint32_t data_size;
> +    uint32_t port;
> +    uint32_t dir;
> +    uint32_t string_ins;
> +};

For a string instruction, don't you need %rsi/%rdi too?

~Andrew

