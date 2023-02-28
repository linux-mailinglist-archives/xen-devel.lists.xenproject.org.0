Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75C6A5EB1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 19:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503672.776021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4fo-0000gc-0P; Tue, 28 Feb 2023 18:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503672.776021; Tue, 28 Feb 2023 18:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4fn-0000en-ST; Tue, 28 Feb 2023 18:25:59 +0000
Received: by outflank-mailman (input) for mailman id 503672;
 Tue, 28 Feb 2023 18:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzr1=6Y=citrix.com=prvs=4168607d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pX4fm-0000eh-Bh
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 18:25:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d7012e-b795-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 19:25:55 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2023 13:25:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB7006.namprd03.prod.outlook.com (2603:10b6:303:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 18:25:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 18:25:49 +0000
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
X-Inumbo-ID: 55d7012e-b795-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677608755;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JRmP5cQzkhMr0IvDE09UaF4/GHUkfM+n1ExHHJe/zq8=;
  b=XXa7nFziy8vq0ATkslbPHBaluXAIvbOkbZOy+kGKoWQh2WB3ejDi0poA
   BvV2U298ityS3CSIpmT+EeVT6f3ifXbJqlaqxdYej26tCf9CbRpYZQdYf
   wSes7jAYio6adoz+l3cF4G58XGWQUGvfcROamtKz6UWhNO1kh6GPxifQe
   k=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 98803007
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qnphN6x9vEkY+ucs8cR6t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 GQdDWuAbvuOa2fwfthwbd6+9BgEv5bWyN9hQAA9/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRkP6AT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWR80
 fZHATI9UhCsq+uJnpaBeNVGmct2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMquFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCNJKT+XgqZaGhnWj4zIeVgYKbGCYrPq7tnGhe9EAA
 R0Lr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOv8YsSTsn/
 lSAhd/uCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0ophfGT9ImGqjliNTwQGv02
 2rT83N4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:S8ncnqMZFnaBzsBcTvyjsMiBIKoaSvp033AB3UoZc20zTiX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFgrX5TI3DYOCOggLBRuxfBODZsl/d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="98803007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdZ8cLfDO8z4d+O1tT4Y3loUsjxoqRE8gof8PrJgb9MM1c/p462IR50IQ45QEz5q02dwBdm9UmdyyVq0v3udGs11UKIDK6JV3iSqJ5HWsguSe/nxK8qT01GtQ3RG9MxocU6XrWCJDDW29etrqtIWx0b3LIEPB3nWiqBXOI5KKBu6sDub43ViFHYJMOioWgp3s9q130DSFak2JFh62FZI7fAADxoCzgBT/Q7ZxHhVykzZ4XrZWfXoqeUP1ulSKvob/29WkRCX9a5VYw60+vXpIEAEsRGH+4UI9lvbzrfwYUssUl+v/uRdLyn8Pihisii8z4YSleq1+VJMFWkotWqV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRmP5cQzkhMr0IvDE09UaF4/GHUkfM+n1ExHHJe/zq8=;
 b=J7lW0qFM7CeEBLX520lxHyS1GtH2EH2PGt22nfBJCxMcF+cPdbsxkGFFCwZzYql0wRgAK/wfqt+7RRHXwBNlIlsM6LRhKAMU7cmsRpP0jzf++XFKclutTpQNTLdwbfUK1QhK9zkMSfaOt37PMGOiUKVhCLWjN5UYnGrXyK5wZV31H2J0P3uyxgROiMvWZUdEVOicWfeJUVKQbyMycxr9AiwcKCGGHjFoWe8dLV9P0kY3/OicyjAvEku8Y6RmAQzr0VGy6LB5Dp8TLPYUmrW9zLjmCSoTF0mKEzvozF0SeauBALa3XNQkxcql690JGrgWWe1eM/lC5aaHHSAocfbcJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRmP5cQzkhMr0IvDE09UaF4/GHUkfM+n1ExHHJe/zq8=;
 b=A16hYfAvzYDjFmziWe/pHV8vCqJSKsOpF455Ard5oybUgwb0z1NmVBzUR34gr3ZPN3lKjWfYs51DGywBx/WqAFSRWRVRsg3td/A3AI8pA2eFeSrt0ZknOKiYmEm3Lw21g/200sNbZKe7NpjNPuGswviJ054ElvPlZzkBlvEfs9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <abc54c8a-f38a-6beb-49d3-6f35a1bfd3d7@citrix.com>
Date: Tue, 28 Feb 2023 18:25:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] automation: Always pull base image when building a
 container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230228182226.52201-1-anthony.perard@citrix.com>
In-Reply-To: <20230228182226.52201-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: d18cc5f6-86e8-4cb7-cc8b-08db19b93739
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VODLCyIB8017nNKdLvMp9BAL61S7DBHWnA+HB4gso5MrY6/vH0GFoR4CvmBJmDFpmRnL8lNGQl0rDXAEWZSO419cIwlkdOadu5HsyfIKNLIyHqRcyIZV+5Hzw0uEKpdXtqBq/qk97+O77DVJJ860Q7PmoBHiaZ58HeKvKrhds4bUhzoL7/v5gwVZj5Jx4SjfozKZZ0F6c0z8bN5HyKG9CogD6Pmhz3ghMbeknbHlUm2+4+8p5p3HA9AXpCRk4aLgUM4kJwzlElCMvv08/XOL4jTBK72dmzN2DOzOocnzoQFg3g7JCSPtaMugj5PXbP7nytm8aEBJg64dMKChXqgKafLDmtMIl6J6H0c+T7j15V5ec2a7cl+SQ/9lteuCI2zGODDOsNKmK/e2p1eXZkZLDIm1J1AJVMXpVJmw/YXNzIa5kqzO2W3Iwclw+ZMNtYfCmrKhWITzlTLDMhC0qK4JhhH6aFS3t2OJ1LE4sXW20tmsVM5OMTMjqwWp/G1KSvpSSE+b9E59p8nddaT2GAJzaXZ9icPqi9U+rdrAdoy+CipGYsNA/zVA/9dDJ1YitjXI9MytSx6ebJI3e0BwmsO7kNDfMcMrdghX9iONXlNk6WjqPTLVDVgpNdzDmK1N4/vMFF+dqXRrxUSZtVPZIXpE1eCQWrY4SgFMd5/MLQNSgLXHQrtLgivT5E6Po8jdn1jJ1C2BXl7f8aeXJ/h0mzjXv1RWjD7z9i9MHM6UK2OyDG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199018)(316002)(4744005)(8676002)(86362001)(54906003)(2906002)(41300700001)(8936002)(66946007)(5660300002)(66476007)(66556008)(4326008)(31696002)(36756003)(2616005)(6666004)(6512007)(186003)(53546011)(6506007)(26005)(83380400001)(82960400001)(38100700002)(31686004)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2ZwYlRtSmxhbENHRE5BWldTK3BRUUQ3SW9ETHVuazZGbHdJZ3VKaEVTTi80?=
 =?utf-8?B?RTZob29ad0lhSXVBaVFaVVFoVDRpMDh3YU05Ym5taEtmZmVLb1VLLy9LUW5M?=
 =?utf-8?B?QitLMVRVS0lvTENXd2NNS3l5YkY1RDUyZlIwS0FadCtCN3lZUjBjWjh2MUsv?=
 =?utf-8?B?ZUMvdjZtMGIwNEUva1lnY0I5SnZCR1NaLzhYQzlpTnNyVDR3bjJZZEF4WEph?=
 =?utf-8?B?bzZWYUFleHpuVnZvWCtIVERyUVo4eUszUkhsbHQzcTRockFhTW9aMmRZREhP?=
 =?utf-8?B?cEFPK1U0SEFCRldkSDhMMlg3RnVHL3pWc1JRUW00V2RCYjdqSkF6QWFyOWly?=
 =?utf-8?B?ZE1hNzRzVHMwTUNwV0d6VmM5VklmVHR4VkQ0a3Fjeit0WkRIQzc4MXVaRkFD?=
 =?utf-8?B?eUZrWDYrdGs2bGEwVmZJdEx2MTA3MENkUTZwT09KUGdFU29BZGZHRVZ2RmJR?=
 =?utf-8?B?UDRRdzJsNGpvVG1ldzBZQWMwT1lEMEVDaXc0ZVl4VjlvNjBvbUh4eTBzQ05v?=
 =?utf-8?B?UE04THI1MFZJYWs4Z2NUWDZvQ0piY0l0K1UyR2l4TU8yaHRhTUNRWEYyMGhz?=
 =?utf-8?B?OVBoT1QwR25ZY2dteDJJUk1sZFhVNkJwa0tURW5jdGRFZVM5Tm1PQ1k5NlVy?=
 =?utf-8?B?QU8zeDFYQ09od09pSmw5SlhvZ0RLTlhydTNweU9Cb2Zwcmk4UFR4VEgycFFL?=
 =?utf-8?B?U2ZQQ042ZW84a2NDZlhwU1VGbnFrMUl6TzFCNU9zTTBRc0JpVCt6ZW5iWHVU?=
 =?utf-8?B?Y1M1b29HOURtK2x4SG9td1ppZnJlZCtYSkZGMlprMTZwNmt1dVo5aWpYYWo2?=
 =?utf-8?B?cElhc2NCOVAzKzJ3a1hucGdoSDFxM1VPS0dpaWtrVkpJSHViZ3lrK01hR1VT?=
 =?utf-8?B?M0dVV0tBdXRnaWswODZSRkh3VU1manZEcnk5a0FrWG1UVzF1dFNLRFo5UkdS?=
 =?utf-8?B?RVVjaUlGNlJLYXFFT2VJMys0YmlIZmN0VFlxMFNPd3N0b0dzVlgyUEkvYXBk?=
 =?utf-8?B?UTlHMHgra0s4VHlPTVpESlBVdll0c08wM1MvVTJpbUk2WmlyZHYxeTdIYThv?=
 =?utf-8?B?bXlzUFBTek51WFdyWHVxRFNUZkJaV1lIQ1E0ZlBIUEgyQTJFN2VmNVUyQWQ4?=
 =?utf-8?B?TVRkR1J4V1JvUkMyRnEveVRGbDdSN2NielRQZWowOGZvdkgzUzUzeXFpUXJF?=
 =?utf-8?B?ZnJKWCtrZWcxM0lvY1ltYS9EVG5KZjQ0ODRBT0xkMW45bTUxK3JHNzJJOUlH?=
 =?utf-8?B?OUoyUTd2Y3poQUJWdXNJVFNDc1pQb3AwRkx4QkljamptTXdIRXc3cHUrQXhG?=
 =?utf-8?B?V3RINTdWbGc3UXZBbVVmT0dzV0VwWVQ0VFhTaFljZFhsMFc2S2FlWmR0WXFI?=
 =?utf-8?B?dTh1WnFhQ1FKUFhMK3phbkRPSlRyKzEzK3pBU2hQMUJ2RVllM2hTTkFZRWRm?=
 =?utf-8?B?V1NQNXloL0JuM3RiejYwV1ZzdXdTQjNobmw5aE1MbUhPVHBleEJpVGZvUmtq?=
 =?utf-8?B?RUxPWnU2Q3VxOGhON1ZPNDNUSzY3ZGpmR1pVRVdObHRMUkhNQlJaQVdOWjdV?=
 =?utf-8?B?UWdwOHpQcUo4SFpFejVIeHNDRXc3ZTVMUDRzVnAwMHRtelRadUdxSXRDUkF2?=
 =?utf-8?B?RTBJWFJUenEzMVRjZWhhR3RKY1JZWEQ0K05kazFmR0kvajFpVzkvVFl5YVVn?=
 =?utf-8?B?VFBxSzhOZFk3QWRWekg5bVA3aEZ5anNCbEk0Z3dLYURIZXBaY1IxT28yREpC?=
 =?utf-8?B?ZFJXdUJIQUs3VXgyRDl5RE1GZWtvanRndkxVei80SlVaSWdvL1FWcStZR3Ft?=
 =?utf-8?B?cTlBT2EyNTd1bjdxTFV6NWZ6VklqMUtET2kvRHZEZFhwRW9ZbUJxUno1eGJ0?=
 =?utf-8?B?NGdnZHZSSEV6T3gya21yWDdrcm5veUtESm9HVHF4VUhOeWNqMTBzZ0FQb2J0?=
 =?utf-8?B?UExLZnlkZ0cybllvZDM1THFKaTBWYU9kVEp6SHh3WXZ6VVNrZGxHL1o1aUdh?=
 =?utf-8?B?aE5jVFNRdWFYQmRvRTJDNDV5VlFiTlEwbzB6Rk1ZWG1zalBuclpBRHlmTC9L?=
 =?utf-8?B?U01kV2NrYXF0THJjM2QxdFhxUGFNMHhoUkNtdmpVY3NVK0VhWHo0VTdLYXNq?=
 =?utf-8?B?MitKL2RIbllFMWgwVTRvT0VEMDRENEtYVit3M1ZvTmtGdEU2cDVSUHAyamU2?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NYHIk/5+Nc7YOijo1Rz69Tgfeg3wVJM3HVX7cYJ0Fxd2cCqQoEoK5+68tgtbdRWeuNKzCU9Vi9jDP1/eIWMpdWCN7IiQtBhuthk9gGLsegWg38ZId8z9L0WRVLY5Dafg0GeYnvY0Re58TB+G1skUg56wJUDpVM7GIMCI8Sd+q+aT1Xk5uoVWjHJjMCHqZ031vD3zFXkHPgBJu4XLlvynBLCH0bQgixqf2EjeJ3gYononZg5nxt5PrI/20zfYkgQZldjMznQ5bnedE9r10gNEcB00HB6By2lNUoewlbOgRB0uqw7ytqtZfuLsQj41uzBMVPU10Ev8UooajXzKb0yZt67QWgyc5IGdZ4AURCa+G6k/p8cRiRk93LQGfhAduGX9tOwcdA5EQHVfFh1L0ZYREzqZ4Y/Uv1uZvsS8OGJDKERCDwCuQZ0sTOzPlZzFwq8vQXVZBT3N+Qm5r33Eos98/3Tkizn5YYFE2In2+9ACOV2EJWS/D4i/15weAoIAsF3r87j+4o7K6JKTCWLZts9QrmP/etVl1cx1G8W0hF6/8HXIqOTvQTvoJQJdoR5y8jB73sMW5PCAVjj9sytbfmV49SvV9+VREHyCBSXmfxIA66ND9iAwg+w2JCBwZ7XtmmcVv/yO2+jmUCWA1ajzAiNTMxmnQZwHAfUONLyLldJEvZ9R6PaaZga8u1qqhwjZ1f3UzBImiebk0ZQzsH0UnNcmMmggckaGsjQTkOcL2kcAPOKCEoVDxTykQqVbZMkJLrj5nUYxjOqwqPqjhNr1IZqJ5fWOd5g6GQsmme0gqiknFA5O90WNxHU7kqHYYqOYWcmn5KbosNynTHTZ6ZYX/rqBcQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18cc5f6-86e8-4cb7-cc8b-08db19b93739
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 18:25:49.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z8wCiWs1q3+ikSQG1sgFGceTtJftHfv7GxDGxEt06e0KuZRZm9eNPFeXzVuUNTy6aYFzxJKGrPrGYVWqeAujcpkFmsLTofBg4J6h+iKFvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7006

On 28/02/2023 6:22 pm, Anthony PERARD wrote:
> Ask docker to check if there's an update of the base image to avoid
> using an old container cached locally.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've lost count of how many times I've fallen over this.

