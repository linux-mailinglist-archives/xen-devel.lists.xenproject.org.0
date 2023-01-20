Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058ED675873
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481938.747183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItFW-0000gW-CQ; Fri, 20 Jan 2023 15:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481938.747183; Fri, 20 Jan 2023 15:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItFW-0000eh-82; Fri, 20 Jan 2023 15:24:14 +0000
Received: by outflank-mailman (input) for mailman id 481938;
 Fri, 20 Jan 2023 15:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pItFU-0000eb-Ly
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:24:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c670f11-98d6-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:24:11 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 10:24:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7059.namprd03.prod.outlook.com (2603:10b6:806:354::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 15:24:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 15:24:02 +0000
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
X-Inumbo-ID: 7c670f11-98d6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674228251;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9FyDFegZWA77cL2zFRx/jQPKAl4s+UblQw0qsBskao8=;
  b=fISwajgV7v5OK5gzg7k1qQMgaWPz93feJaxxGk3n6oO4hD2vCvf0EYm2
   2lMGHNUtyJKWlqRqQ2izWkQxQ+Mj6u6cfGlw7oceQhd06uIbzYmJ7GMCH
   +7iacvpgDQQotyRUasxY+YGXRGX4HPIfCPmLrRZI+p+/Qw33UYO5KC1zb
   Q=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 93501386
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:95RdlK9nGsJG2vL4rVNiDrUDsH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zMaDzyCP6uJYjOhfdp0Ody+o09QvsDTm9IyQAA/q308E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklFr
 +MYKxowaCm4rMSHn7ypU8dLj5Q8eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpjNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdlPTOTjpqACbFu7y1UROEAnDHCHut7mrG2iWMoOL
 k49w397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUceZCosXQYDpd75r+kOYgnnS99iFOuwkYfzEDSpm
 zSS9nFm2/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswZb2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:Rucbw6z6wP4nb5NACKIqKrPwBL1zdoMgy1knxilNoH1uHfBw8v
 rEoB11726StN98YhAdcKm7Scy9qBDnm6Kdn7NhWYtKBzOW21dARbsKheGOrwEIcBefygcy79
 YZT0FWMqyTMXFKyer8/QmkA5IB7bC8gduVbD7lvhFQpNdRGthd0zs=
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93501386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXu7E7B6Ausmz46JFhlxQocqteXDRAMYnsNJ4VRCWoJANOdKBWhyvEPrO0Dl2FNE+JKQgr1z5cINoDiEtAmc0Fj6k9oDsMrG0ZCoOaLjL+88jA2+nDOC6/M+6WxFTXZw1vNWHHl6cSGaW9c0+/lrh10wn4Xw8HiuCYg17RNVBRMfNjid7e8t5l2x9ThkIudMVmqhDP54Vrg/3Op9ibcvY30dfccy36iYgqSmZhXmx7QBvPCTE4ZlnfpuNRfwaTqk0UZJ5w73DDaVXVJhtbWox6ztGZjXaV4fRpumwABCtJoPLJ10X1FTiQ9VZfa3ndtmgoYJG/GdJ8TTdURzmjmk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FyDFegZWA77cL2zFRx/jQPKAl4s+UblQw0qsBskao8=;
 b=Xthi5kkZYx8xdZJCitj9X1yuO/ufB1xvg6K/KshhRBMuRyWQR/JhCF9qIaEnXftEG0A6a7Z6WpluZ0keEis2Y4ihYzktxTXCt4AQH/URRd/CEinTOf8us+7P42heOyqBBB4t/t1cWBytFCGgVqeXDPbSL9izvGeI5e4PwUxeDmK2dnCooP1FpoVs1WFl7wSdV+QMXYbOQTr5Xlhkh8YI/pFxF6b+IbYBR3nG4xZAXhvW7Jskp7gTht09yQXQFFW+NBpsbwBivp78oj1s61c5EPkKeQrsKXD2dFB3uFHV5mG4ioty9Z3XR4TZQd3NkMHqZlRkLOWEIKupI9FoluTMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FyDFegZWA77cL2zFRx/jQPKAl4s+UblQw0qsBskao8=;
 b=UYeQsJMTNGJIMdjj1w5VqQ6Sx0QSrqJFlUrftv5psjR0ypRl3xGuvPlrdIafp3bZuYtk35QwpS35JXrSzzxfkDTz+5mbjRclZ0ko5vSI91st5f00BqJlotng2bwn2sxN4Re6/EYHoWGl/IvwKIhexaKFY0+0JB4tqmkO/YbzehQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 2/2] x86/shadow: mark more of sh_page_fault() HVM-only
Thread-Topic: [PATCH 2/2] x86/shadow: mark more of sh_page_fault() HVM-only
Thread-Index: AQHZLAix9A0R4pcRYE+MObCQxsOEfa6nbmCA
Date: Fri, 20 Jan 2023 15:24:02 +0000
Message-ID: <c44f7536-b86f-4f39-f097-2ab25676cd63@citrix.com>
References: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
 <a4d6ac67-15c6-a7c7-d27c-b98544395a52@suse.com>
In-Reply-To: <a4d6ac67-15c6-a7c7-d27c-b98544395a52@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SN7PR03MB7059:EE_
x-ms-office365-filtering-correlation-id: 50bc4c77-0c9d-4fac-8a42-08dafafa5c57
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FqHaTfRnp82tg9G/IaaywBKcn+YxaPZFgQX1zGSFx0cl+3/qMejT5abHQx/oUrYRkdh1EEYc2LvNPNAh1/mSWMIjBq2/hfYWVXQl79IvaJt8Gu4ZTkQktYukpn+3S+O5AmLNykWDtkSMk+7hg+t0qhyKebvnZ9iqvPBn0o1nF/mCENZp/L5YNALbxfG1wXCUNbtzkdGVcyuLGqz7OEhwBGfJe/AdNa7/E++7qcCwRYD2FCQvyA6Tp7C99+8QP6ZjJLXovXnkr6GbNeSGajcZC5+IP/jbqgIoGwfvRqBTjOnug+bleWmjw5dtADpn0CmM8YEelwnGvhmMkNuCG+RY9gopXUHedhsdTb6Y1ZMb+48K9gVrz1LwBOwKlfeC6qDO7AZsiwU6u0K0GvaSLr760K1xrf4E+B82dDS1W229/7N+MbGFqizfGM12P3gNF7hlZRh4oHyZVEKzKTNhVTpPiWyAp61CUmWqXq/FGV45vJZKpHqueDLW6Gtp11MikKtCjVmah3fWqQUNa72JvX/rIuNwMTW9LaQhi9Cu5ux/N8JqoLdyPbcLelbW2jhK7BljxxqP98+y+a15gtTRCeShu1pK0aVK70q3XTxm9oDY1cbTlTgAClMhkJKXcgKUek3t/6aHlqN9XzE7gyIdEVlCZsu8MDV7RG7n40gOkJlmYgyw910tmDohMQTyOrv+84jwa8ptvyz/rza/WwwRnugk/w6oCLo6nFoosoZsjB+kVuyytrIU951Yf8nAuGZ4oC8PpVuijT4M2/AnEhmNbRbHOA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(6486002)(478600001)(36756003)(71200400001)(316002)(110136005)(54906003)(86362001)(83380400001)(38070700005)(82960400001)(38100700002)(122000001)(2616005)(6506007)(107886003)(26005)(186003)(6512007)(53546011)(31696002)(66899015)(8936002)(2906002)(41300700001)(5660300002)(31686004)(4326008)(8676002)(64756008)(66446008)(66476007)(66946007)(66556008)(91956017)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnQ2UGpZemhldm56clVpNmIzRGFkVWJmaDhiQXVsa0J5d3hwTUJSRDJ0T0hC?=
 =?utf-8?B?K0J6YnJvZlY5SUhETGVBcTlZeEp4N09DRms0QjQrUkFzZ2pOMnhoUUE0QUto?=
 =?utf-8?B?RW90bGpMY0lrT2JxM3FkcXU0MzZkQmVzWXBNekVyanJQL3R6bmdDa3lsOWtI?=
 =?utf-8?B?RWVpdHJvelprSHd3Tyt0akdHZCsvWEgxTzVnRGo2b0pYWDJrU2YyUWN1dHNj?=
 =?utf-8?B?SFR3aS9hZFkrUlE3S0IzR3BCeStYK1NwMFJ0WVVnekRXMGJ3NWJaWkRMaXN6?=
 =?utf-8?B?Y0lMZUx5cTZNcytvWEhPRWxhb0JZWWExNytxRGlKakVZSytKZmVTVkNBNEc1?=
 =?utf-8?B?WHRPYm1ZYllsQ3lIeTZQSGtjWlNqVjBmdExCeWhtNzBYdVN2OWRJMUFhOEJx?=
 =?utf-8?B?cUVoT1BKVkY4aDRtMHpqMktBMy9Fb3JsRlB0SC94OGwxTlU1NW9PcFZjY0JV?=
 =?utf-8?B?ODJuK0Y3UWZYYy9YNEFWM1VzaHdZeHdkelcwWWt1cFZwWXgwdlNvVGdIc1Uv?=
 =?utf-8?B?QW1jWE5zSkpEUUxpcXVQRklaYkkzM0Z4RkZVMUN6ai9wT1FVcmh4djA4MXhJ?=
 =?utf-8?B?WU5tNzQxS1RXWSs2Q2pOTkhZNitDWVZOK0tHTmZIUUxOeElqbk0xRkZjNkFk?=
 =?utf-8?B?ZkorSzNBK01RU2NSNDhlVG5wSmI4bDl0Z3FRODhqQ2FlNjVLV3lRUUdjdm05?=
 =?utf-8?B?VnpPSGRWQ296SFh6aGs3ZWZlQlJNQ29waUd1UFUxaHhic0Ryekh6OC9XWVR0?=
 =?utf-8?B?MmRjRXI3a3EydmtZd29reVVkTWM3a3VTejRvQkRjQmp5bTRyNlFRU29hckpI?=
 =?utf-8?B?LzBjVmpCOW02cUtIMng3Sll6elVtS1phNlVtdVNYSzhzcm5nQmxvbWliSkJX?=
 =?utf-8?B?T3Zpemh2NlN3aTc0UG1XMERRdlFFaCtsUURVenpGS3h4ZnZXbTFBWUM0bFVE?=
 =?utf-8?B?cEZBM1g2bytrYnQvY2p1RHZDWmluK2hUakNuckFmdVVBa1UxcFkxalBHeFpE?=
 =?utf-8?B?NW1YOFVEZ3BtMVlVMW1rS2J4dFlKY1hTZHNhTTNjUlIyUlNnRnNKTG9xc29q?=
 =?utf-8?B?azFhMDZveGg4TVdjeHF0Qy9sTU4wQ0xqVnVRYVlVQVJCWFV2Ni84cmZQeVJU?=
 =?utf-8?B?MGJVNGpLRDBIbVZ5NUpnTyszY3N4VmFxQ252cnVocWFwMG1VNDJ2M3VvM2w5?=
 =?utf-8?B?SlIrM1E1M1VtczZ0RWg3ZURtUkhScnY0Tm1xTHhMQXRxR1ZuWHZMNFdaRE9y?=
 =?utf-8?B?SFYzNkJiUlNTdzhaTS81T1hzU1BPcFJGbU9VUDVGTHowMDBrVVUzbGVIVHNT?=
 =?utf-8?B?emdaS3BhTjFweEcrcmpZNXRCS1hycEpGWXZITDN2eEF1dUkyeTh6VDFxWm9T?=
 =?utf-8?B?TTJ0TFRGZkRDenkrNlRIYVJJczE0d1cxOGRKNDZ5OWdCZXE5NWxlbDVPWEwx?=
 =?utf-8?B?bmFhWlEvKzUveitPbUdmdEgzRUdmODFJV09XODhwdDJxRnRqRHMzVkh1cER0?=
 =?utf-8?B?bWFVZFBidzV5NFlXL3d3Qi9QaXA3TWhLa3dtL3d0TmdrSHRIMHg2VzNyYTNX?=
 =?utf-8?B?NmVzaUJuZDF5S3lleE02RjhGZXhZU3ZUckxGQkdOTXJxMDE0STJicGJGM0xV?=
 =?utf-8?B?U0g5Qm9MbFFtNkVLeUt1VFJicnJ3OWsrRGtadDh4VC9sa1R2RmRUYWhHWUFF?=
 =?utf-8?B?VDR4NTdIK3pDS3hqZ0pSLzlXVW15UW1IT0VrWmZTdUNTMVUrWGRoMXhNMG5K?=
 =?utf-8?B?RFg5eFY0ekZjRk1SQVIwMlJEQ0o3NEpOYUV1bTl5UnJMb0xIQmVYaTNQaWtC?=
 =?utf-8?B?Vlg4ZERjKzVVdkd4SFprQWZxTVJNSGpKdzZhdVNvSGlwRVBWUVlMTDFQelk3?=
 =?utf-8?B?cTJDMmtjTjdQZVJ1VWN4UDU4Tm5US2NvdE55U0lnOW9TeForZlFJRkRMUzBK?=
 =?utf-8?B?VmxiYm53M3JNTWtKSFlmU2F6WFRBM0M2RWYrbnRNSFMwd2k3YVNiUUhoT2pF?=
 =?utf-8?B?NU1mSGVoK0Z4K1RIeE44aVZMT0Y0cUVHZGhQQTJIOXBoRmtWZlZ6YjVTb3Nr?=
 =?utf-8?B?OG54SHZWdGRKTUYxNnY4OW1HQ0NRbmsvR3JIMXpGSlltOStVM2dRblJvNk9X?=
 =?utf-8?Q?ivGkcqzQ324crirSPeMHGyjsW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <842913583D17B54A94C373B437423D41@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yLBQN7U3NZOgkNeBfbcrxld9HH+tUPO7rVVo8BMIyNH4xz3GJiKc8MLLNOzpIDFIQDWfnU9JAviYK45fIHvWAwdwMfheBbJIv3EfULF6lEzwZupAVNlgdD27zXxBRvB24Oy6/vE3VSJnN19Je7jMYTPeUwiF137/2u2wvQ/XxPp9QtI0EurCp2ZPuz7NKFofRSNqDEJxyIHqwziXvCHukB3ivmo3JJE/xNjw+esEInH00GmUuEaUEdQjI1+9YvpHoqs8XWc6ifKXCFgPkkniZmRqcZlhsGuc6BhujR1acAqdNsdj6t5kEPCUeXRdTeHAqmycbfcjJACgGvh/as1dT47ianktEWIV28sFfJA/TpJwrBOrgBtRcV24l6bGSntfbeaqbdexROHoP/SLe5hxWMR3zBWDzrIzi4h+rSnAd2wIkyQ/Ws5X9mx7+QWYAHJS+6ykMUXFxnbLWPKJUSlQNEbGi/iUW2ZnMZU4rY7Nq15Dt5RLvZqnpMUTOVA74c220cnVYU5xxcl1KZFHOM0M6SD/rhxfqzn0wjQErDTJp5tbn9i0SDQ88p8H2PEz6TiZXq/jwXDdbLf/VBXSVISrQLV3InA0O8Gnnt9yOq1ePYLlO+8kOiRuJz8aTFyUK5WWgtkM4UyzgoRN9vb3quHPEKUPZUnfTWfWKEdcWxD2921ta2ZBZbRE1joxrV7JSuRaob6yPjDlN4dleD8vtdkdJD0dH2U0lasHFdHz/b5wKMFLK7sx3nFbQ8ZF/FHoRFvvs2RNliKhhjefnyZQDsUQ6F0JjYzkZZrp25cV0RYZ6HnYrKugmkDI4Us2udeoskRh
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc4c77-0c9d-4fac-8a42-08dafafa5c57
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 15:24:02.3420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ot/HPZkKSJL7wAr3j8a/hgIBjD1u4e83/b29Tw6RQcCU+Zm2NjTr2dpLRQfGvnPSyUJCPMrWpopeXGfEP5mjYiwzkkO39Bhdy7K4IlLWSJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7059

T24gMTkvMDEvMjAyMyAxOjE5IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTmVpdGhlciBwMm1f
bW1pb19kbSBub3IgdGhlIHR5cGVzIHAybV9pc19yZWFkb25seSgpIGNoZWNrcyBmb3IgYXJlDQo+
IGFwcGxpY2FibGUgdG8gUFY7IHNwZWNpZmljYWxseSBnZXRfZ2ZuKCkgd29uJ3QgZXZlciByZXR1
cm4gc3VjaCBhIHR5cGUNCj4gZm9yIFBWIGRvbWFpbnMuIEFkamFjZW50IHRvIHRob3NlIGNoZWNr
cyBpcyB5ZXQgYW5vdGhlciBpc19odm1fLi4uKCkNCj4gb25lLiBXaXRoIHRoYXQgYmxvY2sgbWFk
ZSBjb25kaXRpb25hbCwgYW5vdGhlciBjb25kaXRpb25hbCBibG9jayBuZWFyDQo+IHRoZSBlbmQg
b2YgdGhlIGZ1bmN0aW9uIGNhbiBiZSB3aWRlbmVkLg0KDQpXaHk/wqAgSSBwcmVzdW1lIHlvdSdy
ZSByZWZlcnJpbmcgdG8gdGhlIGVtdWxhdGVfcmVhZG9ubHkgbGFiZWw/DQoNCkNvdWxkIEkgcmVx
dWVzdCAid2l0aCB0aGF0IGJsb2NrIG1hZGUgY29uZGl0aW9uLCB0aGUgZW11bGF0ZV9yZWFkb25s
eQ0KbGFiZWwgYmVjb21lcyBjb25kaXRpb25hbCB0b28uIg0KDQoid2lkZW5lZCIgaXMgYWN0dWFs
bHkgd2lkZW5lZCBpbiBib3RoIGRpcmVjdGlvbiwgQUZBSUNULiB0byBpbmNsdWRlIGJvdGgNCnRo
ZSBlbXVsYXRlX3JlYWRvbmx5IGFuZCBtbWlvIGxhYmVscy4NCg0KQnV0IGxvb2tpbmcgYXQgdGhl
IGNvZGUsIEkgdGhpbmsgd2UgbWVhbiBlbXVsYXRlZCBtbWlvIG9ubHksIGJlY2F1c2UgaXQNCmNv
bWVzIGZyb20gcDJtX21taW9fZG0gb25seSA/DQoNCj4NCj4gRnVydGhlcm1vcmUgdGhlIHNoYWRv
d19tb2RlX3JlZmNvdW50cygpIGNoZWNrIGltbWVkaWF0ZWx5IGFoZWFkIG9mIHRoZQ0KPiBhZm9y
ZW1lbnRpb25lZCBuZXdseSBpbnNlcnRlZCAjaWZkZWYNCg0KVGhpcyB3b3VsZCBiZSBmYXIgZWFz
aWVyIHRvIGZvbGxvdyBpZiB5b3Ugc2FpZCB0aGUgZW11bGF0ZSBsYWJlbC4NCg0KPiAgcmVuZGVy
cyByZWR1bmRhbnQgdHdvIHN1YnNlcXVlbnQNCj4gaXNfaHZtX2RvbWFpbigpIGNoZWNrcyAodGhl
IGxhdHRlciBvZiB3aGljaCB3YXMgYWxyZWFkeSByZWR1bmRhbnQgd2l0aA0KPiB0aGUgZm9ybWVy
KS4NCj4NCj4gQWxzbyBndWVzdF9tb2RlKCkgY2hlY2tzIGFyZSBwb2ludGxlc3Mgd2hlbiB3ZSBh
bHJlYWR5IGtub3cgd2UncmUNCj4gZGVhbGluZyB3aXRoIGEgSFZNIGRvbWFpbi4NCj4NCj4gRmlu
YWxseSBzdHlsZS1hZGp1c3QgYSBjb21tZW50IHdoaWNoIG90aGVyd2lzZSB3b3VsZCBiZSBmdWxs
eSB2aXNpYmxlIGFzDQo+IHBhdGNoIGNvbnRleHQgYW55d2F5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClNvIEkgdGhpbmsgdGhpcyBpcyBh
bGwgb2ssIGJ1dCBob25lc3RseSBpdCB3b3VsZCBiZSBmYXIgZWFzaWVyIHRvIHJldmlldw0KaWYg
aXQgd2FzIHNwbGl0IGludG8gdHdvIHBhdGNoZXMgLSBmaXJzdCB0aGUgI2lmZGVmIHJlYXJyYW5n
aW5nLCBhbmQgdGhlDQpjbGVhbnVwIHNlY29uZC4NCg0KPiAtLS0NCj4gSSdtIG5vdCBjb252aW5j
ZWQgb2YgdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlIEFTU0VSVCgpIGltbWVkaWF0ZWx5IGFmdGVyDQo+
IHRoZSAibW1pbyIgbGFiZWwuIEFkZGl0aW9uYWxseSBJIHRoaW5rIHRoZSBjb2RlIHRoZXJlIHdv
dWxkIGJldHRlciBtb3ZlDQo+IHRvIHRoZSBzaW5nbGUgcGxhY2Ugd2hlcmUgd2UgcHJlc2VudGx5
IGhhdmUgImdvdG8gbW1pbyIsIGJyaW5naW5nIHRoaW5ncw0KPiBtb3JlIGluIGxpbmUgd2l0aCB0
aGUgb3RoZXIgaGFuZGxlX21taW9fd2l0aF90cmFuc2xhdGlvbigpIGludm9jYXRpb24NCj4gc2l0
ZS4NCg0KVGhhdCB3b3VsZCByZW1vdmUgdGhlIHBvb3JseSBuYW1lZCBsYWJlbCwgYW5kIG1ha2Ug
aXQgY2xlYXJseSBlbXVsYXRlZA0KbW1pbyBvbmx5LsKgIFNvIDMgcGF0Y2hlcyB3aXRoIHRoaXMg
bW92ZW1lbnQgYXMgdGhlIGZpcnN0IG9uZT8NCg0KfkFuZHJldw0K

