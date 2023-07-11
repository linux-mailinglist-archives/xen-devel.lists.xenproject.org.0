Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD874EA4F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561657.878162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cK-00053d-5U; Tue, 11 Jul 2023 09:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561657.878162; Tue, 11 Jul 2023 09:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cK-0004zX-1s; Tue, 11 Jul 2023 09:25:08 +0000
Received: by outflank-mailman (input) for mailman id 561657;
 Tue, 11 Jul 2023 09:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9cI-0003sM-MQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:25:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d06f4972-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:25:03 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:25:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7465.namprd03.prod.outlook.com (2603:10b6:806:39d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:24:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:24:59 +0000
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
X-Inumbo-ID: d06f4972-1fcc-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8+Sl3H+wuO6OVjhm1WdnZ0irrqzFxLxnse2I2rwpE20=;
  b=BbiVLyUzmb6HvawruLMjvSgQby6DWXjDjZ2Gym1XHt/e8ZOTa0kTQRWz
   wfErWyYCsyGbBNkskt83GxiBR/rwHhLr9jHwSYRYT8F4nQDH/Rm3YN1Yj
   saXs5f3BVm+Ck0kxBzP5gY19dMa1O563cY/b94y1xAR4uG5N4DuSXg/qs
   c=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 115102774
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hNdzOKLvd1zNBLMTFE+R9ZQlxSXFcZb7ZxGr2PjKsXjdYENShWRVn
 DcWXmiGOavZamP9eNAgYI/k8R4B6J7WzNZnSAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4sK2VS0
 sQxEAlKQQCPhMDrw72wQ85F05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv127aXx3ykBOr+EpX/+/lUu1KC3lAKNz8PEl+C+9iGikKXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnop4thu3MCkRaGQFPCkNSFJc58G5+d5tyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:NToACatxuAC6qO5RiJJpf3iW7skDqtV00zEX/kB9WHVpm62j5r
 uTdZEgviMc5wx+ZJhNo7290eq7MBfhHOdOgLX5ZI3DYOCEghrLEGgB1/qb/9SIIUSXnNK1s5
 0QFpSWY+eeMbEVt6rHCUaDYrEdKXS8gcaVrPab5U1ECSttb7hk7w9/AAreKEtrXwNLbKBJd6
 Z0ovA33gadRQ==
X-Talos-CUID: 9a23:R+Cn22zWJQA2LT/WYpjrBgVPMMQ5VUX09E6XDF+0CkQ0S7KeQHi5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3An1jfow2ZtAfXl2MVoD02m7Qq6zUjpKmpNnsCgI0?=
 =?us-ascii?q?6ovamLGt0Am28szS7a9py?=
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115102774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKGd7xRA2+5+DPnpQECHCyu1PZgkvPOXlNMnM/b7WSyDy0zC1lBMPhDPIPO8AYv6avLb+Tcpm3IbpDPSejIYHx4yg+AiTdPvOldQNZOyyz2TySYrjgpmm9HguwIkQ4X5/6VyqHELZCQwnC0JqUi3M6CfwL6QRZWfg1j7kknGO44um/cOzfu4xlDCQKFgdLN7MY0WhitqWq8+Cy/h0u1WtZA1t70FCt0hvMGrwmXdWb0dnOf77LvtHHL8CkZLW71tjNW+qdq97sadf5oltC2ZeZCMo4RgSFM0DU18J5CANGxh9hCdFIhlWw0x+7KBBSAXNnD2FTCdKGYPaS5MDhLG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JBJAb8OYXFMhUt2Wfrjf4RzfJzF4XKtInaUKwrNQWE=;
 b=LHD65IAVARXCl1KgibSWkT4CiCqyqxPO8Esqnp6+fF3aoKhHwcQFPYPA0x1hPQlohLOWyzbArz2i3kQZzNyRQB7rRYJobdNtHTa8LZOb1EeQ4l2xDc6D2QSHIYUewMAq+TunuVat1bDeaCemH+3/P9W6CKkPzFSxm3+EnGOJFq9KSyd7sz1mkTRzJTkMv49dZISQPXP9pO+ICnA5EgJS+IQ+e5VYSUF2sY80KbnCYyJZgz29Jkpud4OnVJGb77C2vWTo7sYkhQiOHyamNshhEXjlBZsFgo74u8kd8NrbcV6fB5OBUo6l3clmBCU8DXBmFbSLuoY8BlRYLO9PBhM5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JBJAb8OYXFMhUt2Wfrjf4RzfJzF4XKtInaUKwrNQWE=;
 b=PuOLk2ZXfWAuoCLqLNxjlq5VfE1lgnxMSOMo2MAmXKWsX8wLHp5kpQGwWaEj3/fl85OMKw8Ew1vab8ALKG9eefCpEhdSui7qpkrq/HEDNo1PcJyWW4PhuSGyDsZbFFjuUXUToPMiqiiQsLknLntDEH07mdo8cjteZDkKdfAUoIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 4/6] libxl: split logic to parse user provided CPUID features
Date: Tue, 11 Jul 2023 11:22:28 +0200
Message-ID: <20230711092230.15408-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 0502cf19-beeb-4311-8550-08db81f0b2a8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T6Lkgzl7zecqMty/g1FqPHkG10n556apvSJS6EYQLDzf0PRjOhN6ezB8xCRQBxumrT99YRTZMKiBydlXGBig8xtg7rkCyr3rqYMc+1f0/kGyKFANCNHFkONvpY0O+CBN7PCHb900QnFZqUHAWt2yhQytSU/C618/btdBOCqQ5ikd3+RIVVEU2O7qrUJ74a/cr6Lzf85gBXOmns8lALWHCsuJjwosyXzvtqIaSHWCyanHg6+UVniaYohspenjWWYjyssYU3kNvt/DP3s3ZZJTLzvJNbu4+OAXN6IzWBfZZg9fTCvcwnOAua2C4F6WR3DYBPxZGQl7QbBAZ1km5u2t9FzIPk8Q5XL4OIziOD76PDGe+O3VJAUz7dRcHqchewsBqNoZVR26Z5yjr+MamcvyzUfrfMxaTADwQTbCEXAWxBjz5JkGXepNfdVAJTRerq+KDQd6IyjatiR/Xt5zYm+cJ58/Thn1cxxA+Tq4MZ+SwuN/oTod4XE97dvjRbCGx7AOSLHYDMqb8cWIaJTd5u8blcQrokVDP98Sq6B9Qf9awyzscYLaeKn5+jnEzlpb5b+M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(38100700002)(86362001)(36756003)(6666004)(6486002)(54906003)(82960400001)(2616005)(26005)(1076003)(186003)(6506007)(6512007)(478600001)(316002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(8676002)(2906002)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGg3SWpIeVFMbEowTFZkV3ZlQnBnTU9iSmd2S0dnNWtKaUVtS0VEdi9obVVw?=
 =?utf-8?B?N1JUTlo2U1FidWxJZENYVFN6SFVtdWhyOTBDV25lU1Ezb2lySzhxZlY4UGx0?=
 =?utf-8?B?TnVYcFRCNHRZbGYzWVlWdmxhVkRiQXkzZkpaeElCYlJ5cEVpWTZ2SGw1czZI?=
 =?utf-8?B?UXV2MFlXWFF6UStyekEvYmcwaVpYT2JxYnNCaHR2ZFd1ZSs4OW1PWjZnZUxk?=
 =?utf-8?B?a002NTNTejJOM1JFR2E0bmZrWE1JNjJYbFU1SWVVSi9ySS9Nc1lhUytXbkww?=
 =?utf-8?B?NEFKOThTdE1lZEgxQnN6VXJ4cGtWc0lFemhiMHRneDVONnB0b1k5bWFHYTFJ?=
 =?utf-8?B?Q24yNko3RFlENHNscTIwSjNWakpCc1RBckxkMVBqeDA0RVJIWjRneThOUUFV?=
 =?utf-8?B?alBHSnMwS2txcWxTbzZLOGU0OG5wMkw4STRNdXg2NG0vNnlmR0xNdG43azRK?=
 =?utf-8?B?ZnlmZ3BOYmF4elJ4VlVoOGNhOFBaR2NoVWtnVXNnOVBvdVBSYTZuNnpxRGJ0?=
 =?utf-8?B?dlYzMlhzdi9NZzQrdldwYll1RmNDOEhDT01mVzVMdDZDSWNmODZ5c0JnZHlp?=
 =?utf-8?B?dm5UNHJUYUNpbHZVUEt0SlRjY2lnWTFyT0k2c3l1N0dIdDVNZjI4eDUvT3R0?=
 =?utf-8?B?anRDd0lEQVRJZEVnZGtWMUFERUFtVS9BYVY1MkZ6SGhGVGh0UzRBeVFublpV?=
 =?utf-8?B?UTZnMXE5eTBiMG5ENWZ4MEtrUkhCNFNwUDg1OVlBWGErQkZqVlQ0dUliTm1w?=
 =?utf-8?B?NFVwMnRrZ2swaHlvYWt3ZXhCN2h0RjRWNTFZWXJWYzZRbUR2T0NZTTl5Y3B2?=
 =?utf-8?B?ekk5elN4ZjFmdmxUVEc1T0hmY3pPbnVsZm41clJjNXBhTE5Rc2FYaWFBSEtS?=
 =?utf-8?B?d0M3S0VnWXNkVFcwQmRwcHd3bGY3QVVmYVoraWREUmhUUmE5S1hVcVg0cHZK?=
 =?utf-8?B?K2hJeXdubU1EcmNKOGZqU01yRTdZRDZiWGhyNDRoMWF6eldBOWF5QmdVbzlD?=
 =?utf-8?B?c1h6VHVkYnFwbHpXcnFwaEdVWVBSdXFnRVVlSnpXNjIzdG93bE9pMWJsSkRR?=
 =?utf-8?B?bWlnZlArVm43TmhKSEFjdTZwcWJZS01vQWRSa3hmc0tCMEJVeVhTRW53RjYv?=
 =?utf-8?B?WTRwVXcvQldKdy95Unh1RnY0cEhwc3ZTdGVuRTF4WGJxRTA0b3R0SExQQkJW?=
 =?utf-8?B?dFR4a0UyQU1laDZISkVrODdkUzRXVTdSZ2dxZGhQNTB6YlFkRmVQWlFVQVZn?=
 =?utf-8?B?QUM5SFBOdEs3WXdUTkJnUGI3Q0tBTU5qS3Q0MlE5QWFDbDRNd2ZlbksyN1Fn?=
 =?utf-8?B?WGsxTTlOcU00dWlKUHk5RHZwdk0vRy92SGUzbkdRa3JjUU5WVktXNWFReXZ2?=
 =?utf-8?B?Q2JpZTF0aHdlT2pxV3NZWDNWZk9FOWtLaWJhTjdJYUVYSUJCNXFYdkE2QkJ2?=
 =?utf-8?B?VmhLSldnQWUvcWpsZW04SmRZMkcxalpGL3RVU3lCcDNHSTlpUDJPVTV5Q3U2?=
 =?utf-8?B?cXBrZ0lEdU94ZXpiQ1BscXN5RXlPSjdqOGlxd1IyYVMxeUVEcVZvdktuTXhm?=
 =?utf-8?B?QnRXQklBR1pzV0lIa0c0SnBGQzlhTHNvM2gyWVlhVVhsSDhKZTU0Y2N5WlVz?=
 =?utf-8?B?OTlxQTY2VmpBMlBXa1B1Rm9RVjBKMkEyMEZRc1kxMmRkVWNoWjhKUGVkR01W?=
 =?utf-8?B?Y1N0bStuQWppMHp6OThKcjdNeFZzQlY5MGVqb0JaZTZ4cW5EeG5lUEdvQ0ln?=
 =?utf-8?B?V1Y4OFhDYXZwT0RNN1MxTGduZzZWVE95STlXbFpOKzZ2UUdoV2dkRXk3U2hx?=
 =?utf-8?B?alZkS1NYQzR4YjJLSTZpVjRNRVVrbkRST2d2MzBuaFNRRkVyMmxYZEVoRndu?=
 =?utf-8?B?Z2E0QzEzUWlIUUFNMDAxVEVRMnBmV3pLRUhGS3RWWVhkOFNYMG8xUkQzcVMv?=
 =?utf-8?B?UFk0U3p5UUUyOG1GUU4zd3RYK0gxNkF6RXNTakZ6bHNaYTV2dXhLSkFDUzE3?=
 =?utf-8?B?Tk1IamVMc3hHRzVjdnI0YmtPMDM3ekVUTHU2MFJJSXZyN2NsQi8vVWZBeGZG?=
 =?utf-8?B?NXRTMm9vQjQ5TDR5bUNnTkpSUk8xRGNYQjRWWXZuWm8yZjE5S1NEWTNEWVAy?=
 =?utf-8?Q?YP7+mS438fF8GEQAY9VwJz6GF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sDxXipLZ3jgwFqsFPR5us9m4C1nUXhETraMe7eVdZFFTTm5ZTyC0hE2uMc4qBDnT04R7VzTHQ7geWAMzqhw0vs+yiyqmq9xpmWQoYo/wCb3ge88bO/RnFDuOiqAXbzhsHjRyUXLg6v48fhM/kGQIo0fxFPG9rzeaJfeVkkZSgPSyWFlkIrbySvAWygLqMbaUTc+CqJbGeFNiT5d7KMr4YFUnlJePG9yvQEHzpEza73aMdhrUz+iZd4n7/k1eOzvsHGOrBfyhy2q+4RS+HxzFGrSK+GC41HQuO2obOkxGxos1IoTqzvhcFrZAIpFwo+FQfnNCE5yGSsSn4Vd5pdZxbGCLsWdYkfBlcBZekzftTzUBtcad5tVMo5B44euq7oqUpxCm6wxxIXxmKWVtkZgzOfAPk1sN9FVVljlbAc+vkR7e/5Ucuo1hGv8xiF8ljA1SS9F82MA1kBVgw7Q0+o6C8Kuho3/1+3s95cKPv038NVzIQCQrm0FLV+sJXRSm1TlLcR69u7AT53BRnXwm/MrnODUekcwNP05W2UQuz4EZuZhy+YfHJg0OqnUb/rLUpXoy1j4Z2MuOnhkDWw8N7yjj0/gPZ0O2CYitLaRuZ+a4NzeUzhhUsAgFV8ZfzgvtQ8DW5J6dKuqvxt6LmUgKhV/Ual8jI/JsGA1s8HgrwN27MYdVuNp2ewyXg3goZTNr/2RJHlUGJqwfRNI5pxHvQS4lpybPLmABrawuJqgFabEIe20sqpep7NKiOIe7Kjo4rFcF3IxELv4H+WQftjLiMSuuExydziwI1yJwRm7DVQComN6qrRq6MiSlECjwn2JJgUhg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0502cf19-beeb-4311-8550-08db81f0b2a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:24:59.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjMYJpdBkzXyCjpHRuxELP72Mp2LE4ekPD5q6a3g3Kl/+i0vXCepaNTJPy52h9tQS5N1VLBp+pcX+qHR2TLGpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7465

Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
newly created cpuid_add() local helper.  This is in preparation for
also adding MSR feature parsing support.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 120 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 65cad28c3ef0..52e21de81fc7 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -97,6 +97,66 @@ static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
     return *list + i;
 }
 
+static int cpuid_add(libxl_cpuid_policy_list *policy,
+                     const struct cpuid_flags *flag, const char *val)
+{
+    struct xc_xend_cpuid *entry = cpuid_find_match(policy, flag->leaf,
+                                                   flag->subleaf);
+    unsigned long num;
+    char flags[33], *resstr, *endptr;
+    unsigned int i;
+
+    resstr = entry->policy[flag->reg - 1];
+    num = strtoull(val, &endptr, 0);
+    flags[flag->length] = 0;
+    if (endptr != val) {
+        /* if this was a valid number, write the binary form into the string */
+        for (i = 0; i < flag->length; i++) {
+            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
+        }
+    } else {
+        switch(val[0]) {
+        case 'x': case 'k': case 's':
+            memset(flags, val[0], flag->length);
+            break;
+        default:
+            return 3;
+        }
+    }
+
+    if (resstr == NULL) {
+        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+    }
+
+    /* the family and model entry is potentially split up across
+     * two fields in Fn0000_0001_EAX, so handle them here separately.
+     */
+    if (!strcmp(flag->name, "family")) {
+        if (num < 16) {
+            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
+        } else {
+            num -= 15;
+            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
+            for (i = 0; i < 7; i++) {
+                flags[7 - i] = "01"[num & 1];
+                num >>= 1;
+            }
+            memcpy(resstr + (32 - 8) - 20, flags, 8);
+        }
+    } else if (!strcmp(flag->name, "model")) {
+        memcpy(resstr + (32 - 4) - 16, flags, 4);
+        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+    } else {
+        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
+               flag->length);
+    }
+    entry->policy[flag->reg - 1] = resstr;
+
+    return 0;
+
+}
+
 /* parse a single key=value pair and translate it into the libxc
  * used interface using 32-characters strings for each register.
  * Will overwrite earlier entries and thus can be called multiple
@@ -341,12 +401,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
 #undef NA
-    char *sep, *val, *endptr;
-    int i;
+    const char *sep, *val;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
-    unsigned long num;
-    char flags[33], *resstr;
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -356,60 +412,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
     for (flag = cpuid_flags; flag->name != NULL; flag++) {
         if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
-            break;
-    }
-    if (flag->name == NULL) {
-        return 2;
-    }
-    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
-    resstr = entry->policy[flag->reg - 1];
-    num = strtoull(val, &endptr, 0);
-    flags[flag->length] = 0;
-    if (endptr != val) {
-        /* if this was a valid number, write the binary form into the string */
-        for (i = 0; i < flag->length; i++) {
-            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
-        }
-    } else {
-        switch(val[0]) {
-        case 'x': case 'k': case 's':
-            memset(flags, val[0], flag->length);
-            break;
-        default:
-            return 3;
-        }
-    }
-
-    if (resstr == NULL) {
-        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+            return cpuid_add(policy, flag, val);
     }
 
-    /* the family and model entry is potentially split up across
-     * two fields in Fn0000_0001_EAX, so handle them here separately.
-     */
-    if (!strncmp(str, "family", sep - str)) {
-        if (num < 16) {
-            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
-        } else {
-            num -= 15;
-            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
-            for (i = 0; i < 7; i++) {
-                flags[7 - i] = "01"[num & 1];
-                num >>= 1;
-            }
-            memcpy(resstr + (32 - 8) - 20, flags, 8);
-        }
-    } else if (!strncmp(str, "model", sep - str)) {
-        memcpy(resstr + (32 - 4) - 16, flags, 4);
-        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-    } else {
-        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
-               flag->length);
-    }
-    entry->policy[flag->reg - 1] = resstr;
-
-    return 0;
+    return 2;
 }
 
 /* parse a single list item from the legacy Python xend syntax, where
-- 
2.41.0


