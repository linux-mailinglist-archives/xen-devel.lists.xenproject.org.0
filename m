Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667B6A1FD0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501280.772958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb73-0006Lf-U5; Fri, 24 Feb 2023 16:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501280.772958; Fri, 24 Feb 2023 16:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb73-0006Hm-QQ; Fri, 24 Feb 2023 16:40:01 +0000
Received: by outflank-mailman (input) for mailman id 501280;
 Fri, 24 Feb 2023 16:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVb72-0006Dk-Bk
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:40:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df36389b-b461-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 17:39:58 +0100 (CET)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 11:39:55 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6179.namprd03.prod.outlook.com (2603:10b6:610:d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:39:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 16:39:53 +0000
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
X-Inumbo-ID: df36389b-b461-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677256798;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2Emg39pTfnI8nhGWBdriWGevupgKdOb/6oGg39CZ38c=;
  b=RmGXntP7olAly2z56x7VtfSrJ4C436GPe54vdnGXgXkBH0kjrfY6O4e7
   bexnZ/NEJJQG9JXv5+cuGOCBgabq/WRnGz+FgiNa5/JsWmeC4Mv8XpI0c
   pt1S7GwVxh29V1NXM49sVmVwfzP1aqcKrxDmBq/D/JBFRfBjedLAw+XL4
   o=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 98440680
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8pHfUaL3sudoiLGqFE+R4JQlxSXFcZb7ZxGr2PjKsXjdYENS1TBTn
 zFNXG3QaKyOa2XyLthzaNm09U1S6MCGyNU2TFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c52IjFk7
 qwmGgoxazedm9Om8qm5b+5z05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHOnBNpMROXQGvhCrXjO2TY4ARsqdUqEmuGnkW2ge8xNA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAJLGoqdSICCwwf7LHeTJobixvOSpNvFfCzh9isQzXom
 WnV9m45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:5GpK9a9lqNaHEYXvx2tuk+AVI+orL9Y04lQ7vn2ZLiYlFPBw9v
 re+8jzsCWftN9/YhAdcLy7WJVoIkmskaKdg7NhX4tKNTOO0ADEQO4N0WKI+UyEJ8SRzJ8/6U
 4ZSdkGNPTASWFgi8D0+Q+5FMtl7uWm3cmT9J3j5kYodBptba546Qd/F0K8KW1ZACd7JbdRLu
 vg2iJgzwDQAgVpUi1+PAh8LpT+m+E=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98440680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYQ6zhl3wu7q3PRVzDhqPP41GtQnrp7Ktp9h+vC5FDMXXAh9/xiT7d09weiN9Z+XkYqXJx5AJItHu+BBBLcpMMNaOuRJZrW7xCMv+wzU4C5KQMdr8AFapzSGsLvSzAA9/mHLNuZRk+D1LA9bj8dCCkDJ1y9/QaAC6rNcu9G9zEleZG9hYz1b4isNq4dHT0Y8oH5ftQ8GY5IvD+8kkphGOC4mZQ7OCYS75GiVyAUfBU9WQ+PbOwgiFU+BZhJoVJ1/Ip80Kc6YcYFrynkmybkxDi1hIinev1ulDdAnyAkxsX3w/VSKD5p2+G8Zg3XMY1MPrwZsb7wTdpvLyE/ziKe0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Emg39pTfnI8nhGWBdriWGevupgKdOb/6oGg39CZ38c=;
 b=arTe3EkTtfnb0r9S5dv0iBYxqzWrx+6VS7s1zbmG30pGr/iLQ7Im1Itm4a9zl76xuVHO+Z6PvGvCanbpPs3rJt80CTlRkdvgEopw4lBIejvkVl5b7LmdFDygPEZY3uoJORveMD2i7ZYlM5fE55pS46dMkHGta9BYR2V5LoW5zI1zakUguzPUGrgQ/eUfK0u32v+qTO5zRaJZh0/Fk+ZtjAYN9ZAOta7iZHHMqbfanCdf265HoYi5k7cVJ3+P8GxUtaa3ws1RqU8liJttNwOvUeaUsSSbEPfQYFoH8n6CVdC5MK1WKp29+CAvBtib6i5KOFEA/FP86GZm1+Mop0rroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Emg39pTfnI8nhGWBdriWGevupgKdOb/6oGg39CZ38c=;
 b=sduhoM2XgTNSkLEeRnBzzEq/vWlx+OfsAeydcguI9IpVogkMINaQ/bGL/o601n7yYf6pe/g/PmnXyeE2Ue65jsSR7+lRb6IzZiUJB7dPTswlrb0xNpPDOI3037hM/zJP2K3ltaMAlFoaryC9qMvXmSphZCLyFOX8YCdrxiRHflE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f5035836-fcb9-2ca5-c53f-3a8f2159bfd7@citrix.com>
Date: Fri, 24 Feb 2023 16:39:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/shadow: mark more of sh_page_fault() HVM-only
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
 <b0b6309c-680e-a764-8f62-3ae5d0751917@suse.com>
In-Reply-To: <b0b6309c-680e-a764-8f62-3ae5d0751917@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0672.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de4b087-da1a-4ad2-4bed-08db1685c12f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BXLcZKtzHhxPIjHJ0b3GKGq8abLNIsBqTcRhbJOKuCLA3UfTo9G2md012oDaEoU4TkeR7WjAP5yzMB76KRqOJWeEfwximHKHAEBmpD6cCM1Mg8ouI2NikmZxMcpAHAT5o+DcHnLM3vsXNtT9FZ17G2iyujtGNK/UHoYLwlfGfVhSopAipJu4uFFCDEEGNlc/EThD5J82sN1z92BZ0azPX+b4O+OZ5NwEFsxq4sF/78XsTRRrOMTGkD2dKlOZJsIUcxip/8GeMYQQL0f7iDsa/xaElYNho59hrsQquT51Ohmh80teyhMGO5/cDQDZTNRmR8hIOplo0KthPIgvNMqiR3lusEFaUbUPmDsNcmxnu9MEXEhu2fkOXCQXgLlqX76w2ZOVIw6Sq9jZIbXb3p5WIz1O2m28mUEx0aB4zEIt9UxFiKmYVtPaUo25IVwB9B6G5BgyETSVGQE7EkL3+srZTfdWa/sx1u4NEIOYQOvMv7xMOgOKvpb8brUqsfwsAinUVn8kJNdye6J2YE8h6stHYooJ+QvUfiRdoXDKhezc2xAGXn6v9XT2sdyeAyBWYbCpxmXlBMIwzSrwaVbJAi+Dc39QNtvOWblSny2qgFeuIAMlSogwEVPOoa0oUFHieG+N8UVdHHG2wovjMmSqESTlSc/xAbSF3em2gYqFzm/tobW4tW/Q0nk4GHUVCfZRPjwcu4aOBdc9HeC/C/RhilqduZHGKL+zIz1lRo+3jEFVgNU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(31686004)(2906002)(5660300002)(4744005)(41300700001)(8936002)(66946007)(83380400001)(66556008)(4326008)(8676002)(66476007)(316002)(107886003)(36756003)(186003)(6666004)(6486002)(26005)(478600001)(53546011)(6506007)(31696002)(38100700002)(86362001)(2616005)(82960400001)(6512007)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNGRHlySVFwd2hkbXFleVVxeTYreVAzdHArZXp0eHIrY3RzSGQ4aDRDUGMw?=
 =?utf-8?B?RGdaeFRIWEVxVWR2MnBRK1Iyams3b216a21wYXAxWDVacjh2L21taThZVDY4?=
 =?utf-8?B?QWdjQksrSzhpUWdqRmc4T3VWaE1BZzBjU3Q5TndHV09DWWdCVGgzZ2FoRFM0?=
 =?utf-8?B?NkNIQUxvdkUwcThBK0NjOXl1SjlSWXcvTW5YbGUxcU5Vbi9xQjQ3TjZZZ0Fs?=
 =?utf-8?B?Qmd6eHNrMnJ6c0YydFA4TytoTDdoekhidHd6a3V2NUMwVFVGWVE1eTJKQ2h6?=
 =?utf-8?B?WWdxNGk0dlYyS2hPd0dxQWJIbWxSRFVoYUM4SERPMmV3TEpqTC83dHhveTFW?=
 =?utf-8?B?a2VUdmJhcU9CdEFiTlVsT3A1ZWtROWpGZGxuWTEvSVYvM2s0ZWdibCt4cGtB?=
 =?utf-8?B?U3N5NGk3UlVDUTliN2JWY0ZmUUFIUlN5YUZxQlBjWldjdk8wZ0txS0dnRm1R?=
 =?utf-8?B?ODNuTE1INzQ4MmtEMGE1MkFYV0xrUjBFakRCQVQ4RkFSZEZ0V2RrSTlvSnU5?=
 =?utf-8?B?ZVEvZTlqTzdmSUgwWGhubzhod2syUnVOdHJjbkVhMHJ1d05Db1RMYnJoeWgz?=
 =?utf-8?B?K2lzOGtQdHJoL2Y4Um5aQnV5SW9McmMybTNOQjV6c3hDamxDNHQrWW1KTm5l?=
 =?utf-8?B?Z1FLZDBWaVdyTzBBVWpuOTJ6OW5BSm43VFh2c2VON1FGNjhsMVJUSzlkVHM2?=
 =?utf-8?B?QkZpMUpTUTBSdjl1empZTklaaG9QUzY0LzErVHFaaEFzMHAzYzQyeVVORE92?=
 =?utf-8?B?a2llZFo5SHN0SVE1T0FEVm1yRFBYS1AyTXlnMTltSzNrQ0dSMks4VE5VdXU3?=
 =?utf-8?B?Y21xQkpZdUlTTkNjaHI0Zk9jdjB3SDAyUllsQlQ2bmthTjd0SGJPTUhkTW9K?=
 =?utf-8?B?TzBCTkhjbWt5SnpHaEd6MWJmaGc2anZSRWNjdjhkY3RSaXg2RmJ3eDVic0dU?=
 =?utf-8?B?Q0FiVXVZalVMY0lxeFcraXkvR3hYVDFLZWNudEJEWGtFWlVNWHljZGliUzRW?=
 =?utf-8?B?aEoranFwZjkvYjQrWHZEZVJLZHpDVmlsV0RZTFJnVmhxWVNtQUN2RDdFQkVC?=
 =?utf-8?B?MGIwOE5LSEhMdXZjY1EwU3EzTXA0cDVSZGM2eDRsZHVWd3JZNjlzL1pTOGxr?=
 =?utf-8?B?d1FQZnFWZnVWYjNVL2pmZTVJNU9lUGNSVndTOVY1RVhjTFdIbFRHSzA5VmtS?=
 =?utf-8?B?L3ZlRk1GZTRlRjVVSFdmKzF2aWZTMFBtTDNuTFBHTDlPNmwzZGtWRXVneUV1?=
 =?utf-8?B?ZElFRGUxOUhCREVBYTZkdHZzWjQ5RlhmYWxIeGhpNUFMOERSNWh2QUh2QXZS?=
 =?utf-8?B?Mkp3R2VRd2ZIREl0c253Uzd2eWRzMTFVSGJZcFNIbWtlMUovUEE0eGVjYVJ1?=
 =?utf-8?B?OFFxbWlVNFZBajBLYWRxb0JLQlpnVnQ4bUhPMkVLNmEwQ0RSRjZ6RFd4Y1Zo?=
 =?utf-8?B?bFBLd0lZQVUvRkwyajByenBzbEI5bCsyNHQ5YTUrRkxsK0t5a240L3dvdjFj?=
 =?utf-8?B?Wkc2SEltZURJdDM1eUZENDJkV0NLeWcwd01lVnBmQXBKTTB2ak1IcThqWGg4?=
 =?utf-8?B?NVFuRGlVUStpWHRwYmtUaUJaZC8yR0N4Z1IrM2RnNzZWaDRtdlpNNGNTWC9M?=
 =?utf-8?B?TWRyc2k1RUpOY0RzbVhJaDEyeGFLeGRXMDdzUU45dis5bWdDeUxjMU1qYnpW?=
 =?utf-8?B?NW9YQjB1KzNLcUdWWmxSUmFwekczSjR4QWVhenBpMVgrc0dXTm9WN3hvZzZG?=
 =?utf-8?B?UTVDWmFISmVsbzVGVExULzJtRWNIODFub0VhOUNGMTlkeVpha0VKZ0ZvczVM?=
 =?utf-8?B?T25ZamZ6ZGMxVzJCUWkvZWkvL2Rucno3SnVoT21jRFZUb0NQb0JtUUMrVzVX?=
 =?utf-8?B?UkF5WjhMcmZmRmRyWkNZWWNLcnVNLzV5dkdPNkRteVYzZWtFdk1JaS9rT1Iv?=
 =?utf-8?B?Nk9lZVJqZ1FCYlRLYnRDb1JPOUNmOStKeWw3bGFhVUZRQXdRWDFQeTkybWtE?=
 =?utf-8?B?OXBJa0tpMVZQMjRsanlIQ2plVS8xYUJrVHovWnAwc0NTVDM0QTZidUNLMTFF?=
 =?utf-8?B?WG1EbzcrcEZ6YVpCaVgxZGpOMlJIRElqRkJGSXY3RFQ2aWU0cDkweWVXaFpH?=
 =?utf-8?B?RkVKL09BS2ErSG43YUtIOG92N2pnZ0gwbXN1WHNyWnpmQW1TdXpsU1Nwaktu?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CtI0ihkvHUqpo9xJi7HdRxDCc3I60DcYvtRpdXbrlr5K90PkiQuRs5Gxk3xene7DrLU82SE66ELlLGdqC5L3/3i7tHJ+GeetjR3yiEvamUSUJHnv0fAJVhCc30trU6vptMXR3eezECkme2wZ19DhN7vARRc92zFGNDlm+e3h6MiwMDaYMwOkmk2J1LgWvo1NLFMDnDbKrl+/UWqDUDhA3YurZEzr5p38xtXID2yIlFfks+s0UD+JGM5s2jv3PW8BcLnuZfvt7cZgIFkSSTzSmdwXoTHtZJbrxSkb2FfQHInshtkmYLrmQuAD1NVPBDifRDYL7s3Fw99eMUWXdO9wconzRhYDQv0HNWwLNhPUSg0WsCddpQ2MBLIqhFbcQJtPdqYKqWQhlHLPZ3eQeWyd4g6ANFqy8RQZh05ahGg4/9qLanFbARqYELl9uvr4siFCSYCdOpQBSWvq4Y0krNVqZHkE64yoPqkrtIzFLteVqQOnNHZHPmn/CD5Y6vxij2Od0jESz4Dd5c/5SSndAtUeamnfYvufTy7qfPwi1qQBjqyITzK0XgOs2M0Ri7WJeoxBwMmBj+SsYF8rCswgb8hka14J7R5R/UKCNv0SxiuDOZYyqCssq7rrUAngjwILk0El28lG0+eDtdJnaWPSVvbSNXott2v41O0lFJQ3H7MV9jXxBA7IM1ESnS6jCkeVP6Ku/6SXhKartQQ7xJr9BTTQ1gfUwjHQKixF5jlwh1PMNg/ZtCvigGpqK/CQWRGxVUggbUSSIS37SEXo03+Gp3067EP1d7WbOSf863wdkTthZbJxlQkdHVDECzb5zpnjb3TQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de4b087-da1a-4ad2-4bed-08db1685c12f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:39:53.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30ZeCq9idx3hbPKdB+5JO1QWnFJ8mJaHt9U8e3SH9fkMe2aLxITRBkfaaTY+SachDJXFl6ryrSSvULLrDZrfKhtsH/wqoGkoHnhzy2+tlis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6179

On 23/01/2023 2:27 pm, Jan Beulich wrote:
> The types p2m_is_readonly() checks for aren't applicable to PV;
> specifically get_gfn() won't ever return any such type for PV domains.
> Extend the HVM-conditional block of code, also past the subsequent HVM-
> only if(). This way the "emulate_readonly" also becomes unreachable when
> !HVM, so move the conditional there upwards as well. Noticing the
> earlier shadow_mode_refcounts() check, move it up even further, right
> after that check. With that, the "done" label also needs marking as
> potentially unused.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

