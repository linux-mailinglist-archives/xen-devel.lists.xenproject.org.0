Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900786CA1A2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515146.797726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkOK-0003kH-4S; Mon, 27 Mar 2023 10:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515146.797726; Mon, 27 Mar 2023 10:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkOK-0003i3-1o; Mon, 27 Mar 2023 10:47:56 +0000
Received: by outflank-mailman (input) for mailman id 515146;
 Mon, 27 Mar 2023 10:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgkOJ-0003hx-6E
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:47:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d266df-cc8c-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:47:52 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 06:47:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5900.namprd03.prod.outlook.com (2603:10b6:806:11a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Mon, 27 Mar
 2023 10:47:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 10:47:40 +0000
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
X-Inumbo-ID: d1d266df-cc8c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679914072;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cil6/5KjgxHKbEaxWOrC4op8X6fk5Dg5ItbnAVmQ79w=;
  b=UlX1FpM+KOc8QotlGqxOCJN/JU5nkMRJJY2h2svCZh9yheNKdX3Nj4Rc
   KoJCxh0ZJMgkWYpmVYhxbdM4onpmZ1fH/UmL4pj4MEdDPJnFm6u1XJ95R
   1lZz7TnxWhohBHQw8ky0dRoDXtZP3xymTOk4RzkXMHDVp6y0IgXYDR/Xr
   k=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 105360576
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U1nyCq/5dGjhTH6mmLX9DrUDWH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mNNUG3UOvreZ2r3Ko0laYri9ksD6MLRzIJkT1Fr+yo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkle9
 /83JmlKMSrbqLuwmJScd7JJnZU8eZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpjtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpPT+Pgq6E06LGV7kcwKiA5akernamS0USBd8liD
 nE4+DV7+MDe82TuFLERRSaQpXeeuxcGVtl4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGRA0J+cj+o6k8ixvOSpBoF6vdpt//FCz0w
 juKhDMjnLhVhskOv42k+XjXjjTqoYLGJjPZ/S3SV2Ohqw98OoisYtXw7UCBtK4eaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:BXhwNa+sJa5MbWkGDQtuk+AfI+orL9Y04lQ7vn2YSXRuA6qlfq
 GV/MjzsCWetN9/YhAdcLy7Scy9qBDnhOdICOsqTM+ftWDd0QPGQr2KhbGSuAEIcBeOktK1u5
 0QFJRWOZncN3U/q+DQiTPVLz8n+rO62ZHtv8vli11Kai5LRZ1axzpYLCHeKGFKLTM2ZqYRJd
 6S5s9KvTqydW5/VKmGL3MYRfXEo9HRtL+OW29lOyIa
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="105360576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2sexa1/o2i/7aXqrTagfrUHoKixbnHcTcSrCBbHzaxK1y7daaLrunM7EAGJrjxiFGg8UFsLrMwkfI+1Fxg4bVdgWetkN/cEUH7pBOJHfKHgS3hUNEJJKydwVUNoH7X5X6lzA9Dx738I/1qYv0vYNaMwdHMJihAETVpATGw51KIjjgIpRSNhROFn8bpe9ZshQVm+la8JDGBWmXwEK99S6W4DwNbRyUnBBibc6131uwxaoLL071u3lYis3DL3h3CKJlJ7xPi1ZmuoxBU2W9NbSWsUYvG65PAkFUouirA6YPdzTUv0OKmIgnW9zR1gKATrBBYFIAXXlXYf84cE3Zeqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0tta+3gd+Qbjy7buj0oN2bF8xS/bZ0jMcrsNxM5LU4=;
 b=VZTqE4xAQzenA3VdParJZnOt25OkUWRO9O7UoUKtziYXCpDhNUUYNCoX5JpFndOX403ap2P8b5GmuqJU2zjKtkFJUeASkOGhjVc8U0KZMCwphZWkbE0LVzVuBg0Jy/pMIoPb449kpLNNgZushuCA8R/WCRjmvqnsW4YYq8R5K2Z+5tBh3r+uDSkH7TkQA/74PulAxLvYVEF1bJMf15qn2+KdI4+UrsLa3EEgpHFi0jEEUaZoTT7dYfa/12X3WCCjq0SLh2zjiSgAuO0zbKEBlFpKR/pWYRKbaaup7chVtYwTvx1x0MKXp+fK7W8YRGpwCsel60mwy3WaggAGLmBEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0tta+3gd+Qbjy7buj0oN2bF8xS/bZ0jMcrsNxM5LU4=;
 b=wh2u5eSVI8oLCvpzds/HhR/KCh+iM5jhAbEYneMTp9j0bwsMw/91NwBI9WeMULrC2RHEeBHXQe/P8awJJ+6DgyWNORiB6tl7fE/RniP6AVgSLWgvWw+Pdj8GeUxMIxRrpjW1AsF+NjcVVkDg1/Z5MA4BxILDz/mbPnNZh+l5SLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dbd5508f-7971-1c25-09b0-e8eac2a9415e@citrix.com>
Date: Mon, 27 Mar 2023 11:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20230325024924.882883-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: b05f1d28-5d76-4b7f-287c-08db2eb0afa7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hp7RUcoh3338yujP0WxWvOrUNPBZcyjV+KXdeDHJYSpwNmulvLdqFm1qCMcXAsziMzQWZTpCGKf8V1ZA2U4y6N3DH0/d6D1B30dUBkW6Mh2XjzI5tZacIOfMf3/7JNoSWmFhI5GVc2zEbMwAwNwY8m5MqGTwWsQJlmVuR9LleAHlaAvhdEfw+Y5RrIPnAIenFDD4KoytnRCEuWyGDjU6NKEGX5v4Ya2c+PpdVatZQOHzAQ8zbYu5XhKZFfShb6oTBfsM1y86NpHsZMnxUuasiOhWdHeT4c7/WBQ5g2BFVObvmOdOKbIznF/AFEdZnmfr6cCuQnbiWq2jiJPGRIwRE82IcjTDZJgvIpmli58lSCjDhEjUC7YsYxHfox/JWuKEFONZf4lxY/XUuvB3QOgypdA9s78e8F6ImHcjdmbCKoCSG7tza3JYHiuTYU7aqkgUOv+4t9xYac0bmXBo1UkOO+utJdaKUdGQxI5W1OOLLHF0zFmoSVaOa6vTvNuJ2Di3FJ3PEZZaMgIsehv+agbhfQd3b+rhkUgxgkyqvlJra6r5RLa8z3Lqe5ml/nsjlWFrvCsr+DXeL4qdlT3tRf7am0j/EyfVxnsdhZUi4vN1qAgylXYiTT93fQ724FyAz7FsEnsOkBtMVM00B03Aj54SVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(8936002)(5660300002)(6506007)(6512007)(186003)(26005)(2616005)(53546011)(36756003)(2906002)(6666004)(86362001)(66574015)(31696002)(83380400001)(82960400001)(6486002)(54906003)(8676002)(4326008)(66476007)(66556008)(66946007)(41300700001)(478600001)(38100700002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnNPN3ZNZTRGS1lFMDFlclFFVEhzRFFOTUtMb1BRZDZ6Q294elNBK0tEL2Yv?=
 =?utf-8?B?NURnOU9QRVRWczlITVF3MUw5b0ZhT3dvQXdva0QzMy9QRkRUa2l5STlTNHRB?=
 =?utf-8?B?VloyK0RhK21mZitQbWZkalQzSDNGUlZQbHhxY2NYOTVZbFdhZFAweVpsbU0y?=
 =?utf-8?B?d2E3Z3l5b3Bna1drMG5LVzFBOWNiYS9pVXhsWXkzaVIxdlBjdWFwMWZxYkFs?=
 =?utf-8?B?WDNzZmNXbHRIdWlCbGowcEE1VVJHbnFPVXRlckhwZi8xamlCd2t1QnUwM0xs?=
 =?utf-8?B?K2VEd2JQenpVTFpqc3Nvc09MRFl2V2xsdnF5eDl0MVFWbVE5dHZPejlFeUU2?=
 =?utf-8?B?V2Y5RGU1OTFpQTFkb281VzRKV0Vua2gxUncxemg0UkNGZVN5MWJGTXBTblE4?=
 =?utf-8?B?T1QxWVZVZTRjREZkOFhyeFZZQUlmU2V2Uk5ycEh1MEllanY4ZzBsM2U1WHF1?=
 =?utf-8?B?aERGVy9GQTl2cU52cWtxd1VhcmZYQkV5R1ZIN3BMSjA2cnpYMllIR2YwMVU4?=
 =?utf-8?B?WHVpQzlqTFZsT0RlZEYyTGg3dUxtL3pQNnFrOWhhODY4V0FMbzBwdHgxVTRy?=
 =?utf-8?B?OGtCU0hSd01Nc3pTM0pnZmpOd3gxbXJjaEhzbTR4algwQlRrVjJ0TWhCU1Rn?=
 =?utf-8?B?dW1lMDVodHIxQ2JHS2RwdTFsUnNjMVp3Qy9IZlk5RmQzM2tiWFVjM3N5TE4w?=
 =?utf-8?B?SThaSGErbzlhWVg1T2duSlBtYzRySk5aWWtYVHBLK2ZBOTBab1pmR09DK2pJ?=
 =?utf-8?B?Z3ZlcytrQ2dsd0JsSCs2MEw5Tk9YeG9hQzFob1owaVZZMXdCck1IK1h0VzE1?=
 =?utf-8?B?WDVkZnc5UjA0QUFlb2NsNW5sVnF2TlMyQUovSjdmNDFIaXVsRzUwcjlUV0d6?=
 =?utf-8?B?K0RFemVkQWJjQkpYaUw1SGthSGphUlRKTklRcTA2a1dUbU05c2VLMS9ra3FW?=
 =?utf-8?B?amdYNnlWbS82R2kvN1dyRFZDQ2xnd0JmRW9DUWFnVUNkMi9DUm5ScHY2MElj?=
 =?utf-8?B?Q2lHVXJPVm81eVgzRzFydDBHRnc0SWZCcGtoUEZ1VmZUdUxYRnRmVkltRVdX?=
 =?utf-8?B?aVppV2gxVHB0SWpzNU84alQxdXM0K0VJZnBjRGtSaHArQm5LeXBwamkzMTB3?=
 =?utf-8?B?RGlwTWdscXhxMWpja1lCLzg5dk85dTRqQ1JTVFNva09Dd2pjendNVlhJZEpP?=
 =?utf-8?B?SlVvcEo3OXdvdjlMQUl6WG1RcG9laFhYaUFlaWVpTk1PYnZrQXJ4b0NxU0lO?=
 =?utf-8?B?ekIzUThRdnJpaHJkdHh4RzF4TUVMdllkK1ZaVk5zSFg0TjdNeFVCV2UvK0Fk?=
 =?utf-8?B?SUxZR3V2NFhNQWxaMldyREwveUxkZjd1a0lpMVVmbFlWTnluS0xadEFxWFFz?=
 =?utf-8?B?QTIrQUZHL1BFQTNsc2c4U0ZMNjI3UTROTzJJdkdlVlVFKzdQQXNMRElvWFBM?=
 =?utf-8?B?L0l0MWpRV1AvTGJPYkpCWXhXeGRzSmpSemxKNlhtNkV5bnZWU0lVTTZhUVh0?=
 =?utf-8?B?amY5RmpXRWNEQUhEUkNLNnMyVFpFdS9KaXNqY0tlYUovbmFJU0tNbFBDNDBX?=
 =?utf-8?B?TVpkVGNLNVpjYWZROFM5d1NiajNETFZFamZVUkF4SWl6N010UUlMSnRDQksv?=
 =?utf-8?B?RzRuVVhxN3JsK0dBd1ZPRzZnbHFjalZVUDRuYVVDVTUzUHRUTHNnZXY1S01u?=
 =?utf-8?B?OWZTZ1ArRXdKQ01BWEUyN29DcUFabWJBN3BxcmNhUkd2Y1ZyaHkvS1YyQ2tE?=
 =?utf-8?B?MjhHbWZoOFBmdTJsTTVGbUFmS0dWV01QVklLN0YrT2g2UFZBSzl0N0NOQWhN?=
 =?utf-8?B?Qlp2b3RWaGRWWW1pMHo2VC93UFo3eHYzeEpweWNRd1gxR09OWlltOU05Qzdt?=
 =?utf-8?B?R3FZMWhYNXJ2UzJ4RkdJcURjdG9TVlRVTkJZNkN0Z2NxR0ZEZ2t0TGEyckd3?=
 =?utf-8?B?VkdldVNJcndnUi81eTVSb0FqQlJqT2g5ZnVtdW5GdlpvRmV4Y1d2eWZVWlBo?=
 =?utf-8?B?dG5QNjJFQjFkT3k5eVQyNWx3Y3kzN3lhK2k5TEF0Y1JjYmlVSW45TEJnRXdj?=
 =?utf-8?B?YzhhT3daTGNFTm5mckYyWEViTHZLUGRoWGx5eFlsZTR5R09aK1VnNzQzOGpK?=
 =?utf-8?B?c1FmcjhSM2UrRWp2NmhueUlIRU8xUmptOW5UTllrVkNOZFoxY0NUbVcvOXQx?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Whge+coPue/8q9kSmKBpynppwSNvTTVT2jKbXEB064k6md/3Dsrhw1hTsUZuy54A7AtMNe/Oeg5cLmdMhyaANLx6oDx2uwXwL7VWzxPn2rQb+bIY7SpyTMEWu7EdnhoKcBp9RZmMl0JbCwgPREZfIiIDH4n90biKtVMP6m1XedIuT65r6zxTlbaPLbVBNYeSq2N4JJEr/6Yqh9n3Z6zsD9la1AgTLkdBxalpn3nMP/ZBqtMfnY3LPHhI6X1eQ31M43o6G62Lblu4JItE5JNG5jpHHPZt+Gkslr2pjSo+WFnF9CuvxNOMtgMUh/3iT+mTqJ0OSCKrVK0PWurSACIDMAImZkRehglrSaZgbcISuniehrgbl5Yt8WifoWTBb4Rap1KzUIixdOHuRABWaDTTOYlGaGD1TKbgOT2Pdgl/OnvoYljy0tUqWhp0RGNYBmfHgKwREDq3mxfphGUe0ZvnDb7YjS3QfqLVthNAKPuTKG2+w6M1wg2d5I4PET/Qeqbx52iys9xL+5JArkYJM++Nm+77qMd5bAKhHGXjY2nf+3Sy6hgZ+bFMYaAB464PP/VQaFt5l26p9LgOSdo8uuPKep++2h21UopeclWBupRn1KJXe+ZW1L5rX2KWOyhsxGGrPFfYsq4wMIMKlf2vX/twfRo3hKBOCdABiizYaXd2suOKT8bosj/znCb96rzH4B7+7wSKgidz60ciJ4PfWc0wg+p5S1qlbJ4gJ41dr7/JKV0FZ2fa7CFtDtaFkLhDjfQqF8NTg44ntw3GwUbPcAsFEVxZ0Mevwp0QNb75m6X+MBQu+0iu3dMp/2IzqtCAnRgfMcPNLUEgLihmfdnllG6cqICue4JHml1PZiLFwaUfrfwIJnIK1Qbl+h68LqQrrtVCKWCzKkdZVhIcFUWcOlflsJmSm4+CWc+bh5uw1h6qfV0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05f1d28-5d76-4b7f-287c-08db2eb0afa7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 10:47:40.1734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8zTLTN9zNFsuhz01dZWIcg8S3v7VcNbVi/bl8P5FVXHOUrJNTRROszLZV9l6kOYGobsfFgjYk8C/wOm0xoea0iH5WI7DmUItR2zP3hfX4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5900

On 25/03/2023 2:49 am, Marek Marczykowski-Górecki wrote:
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 9c82bf9b4ec2..9293009a4075 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -438,6 +438,152 @@ static const struct hvm_io_ops msixtbl_mmio_ops = {
>      .write = _msixtbl_write,
>  };
>  
> +static void __iomem *msixtbl_page_handler_get_hwaddr(
> +    const struct domain *d,
> +    uint64_t address,
> +    bool write)
> +{
> +    const struct pci_dev *pdev = NULL;
> +    const struct msixtbl_entry *entry;
> +    int adj_type;
> +
> +    rcu_read_lock(&msixtbl_rcu_lock);
> +    /*
> +     * Check if it's on the same page as the end of the MSI-X table, but
> +     * outside of the table itself.
> +     */
> +    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> +    {
> +        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable) &&
> +             address < entry->gtable )
> +        {
> +            adj_type = ADJ_IDX_FIRST;
> +            pdev = entry->pdev;
> +            break;
> +        }
> +        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable + entry->table_len) &&
> +             address >= entry->gtable + entry->table_len )
> +        {
> +            adj_type = ADJ_IDX_LAST;
> +            pdev = entry->pdev;
> +            break;
> +        }
> +    }
> +    rcu_read_unlock(&msixtbl_rcu_lock);
> +
> +    if ( !pdev )
> +        return NULL;
> +
> +    ASSERT(pdev->msix);
> +
> +    if ( !pdev->msix->adj_access_table_idx[adj_type] )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                 "Page for adjacent MSI-X table access not initialized for %pp\n",
> +                 pdev);

One minor observation.   &pdev->sbdf

Otherwise things will go wrong if sbdf ever moves from being the first
element in a pdev.

~Andrew

