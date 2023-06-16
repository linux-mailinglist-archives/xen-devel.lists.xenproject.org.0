Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23627733205
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550209.859177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Ll-0007Qz-Jy; Fri, 16 Jun 2023 13:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550209.859177; Fri, 16 Jun 2023 13:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Ll-0007OP-Gx; Fri, 16 Jun 2023 13:18:49 +0000
Received: by outflank-mailman (input) for mailman id 550209;
 Fri, 16 Jun 2023 13:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qA9Lj-0007OH-NW
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:18:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515ba184-0c48-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:18:45 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:18:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6115.namprd03.prod.outlook.com (2603:10b6:610:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 13:18:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 13:18:40 +0000
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
X-Inumbo-ID: 515ba184-0c48-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921525;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KMf5cVuF96ffd/apERITuQaD0hNdIodJm8Gckp5Z804=;
  b=f8XQKbgnvFlH9f2254ny3APNmmhUwmnmHYeTdhkgIsTUH1TiHSyMtiCk
   w169/joitmpI/3PVCgMgutNYWKa9XEaYUfNcn7Vxd+0Dk0SCkqEuoHRCr
   /6eKfFhJpzhU66EJvttA59SFxIxEWq0uXc9xdBmVLsc3mcP4Fc8ZQvctG
   w=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 112952670
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EoxT7aIjfcFYOkfCFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENShGYEz
 zcWCz2OPf/fM2rweY8gaNni808Dv5SAyd5rTABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GKkBv2
 NEWBAtXLT6qn+fp8Iqpe8Bj05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqhCd9ISuLgnhJsqEOB+Dw3DTswbFayjsG8sg2OX9cBK
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4O5IDlqYRq1xbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:o0sGIKhnMfeIbnoiS+6WhmEZenBQX0513DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVpQRvnlaKdkrNhRotKPTOW8VdAQ7sSibcKrwePJ8S6zJ8l6U
 4CSdk3NDSTNykcsS+S2mDRf7kdKZu8gcaVbIzlvhRQpHRRGsRdBnBCe2Sm+yNNJTVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9s1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUapDKh8KoOOCW/sLlaFtzesHfoWG2nYczDgNkBmpDh1L/tqq
 iOn/5vBbUw15qbRBDOnfKk4Xic7N9p0Q6o9bbQuwqeneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K1oM3R3am7a/hRrDvAnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLtU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA4cuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHk4ndJNvaCKDg4KFC6a
 gpCmkoylLaU3ied/Gz4A==
X-Talos-CUID: 9a23:LHOYSm4Zu8AsnVkRtNssxWU1O+0IfFHmljT+Cle9VlZRWoy8RgrF
X-Talos-MUID: 9a23:TB6rRwY+2bpHGuBTqS3S1BVnEuFR7q2BMEU10qUCvpeEKnkl
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="112952670"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4BAmnTQaxCB8VDX/4+HImxiqHMOTP5wjm48dBfB2gE8oauR8m51M6EMo02B3Z1N4RIU/SBY9zgFyYGgko2+ERXnuEFSXlm+gD0pgORE137JJEczaNbRlBg7vFnPGxl/Z0Ao8kdPqEKyQHL1lk5AeiauDWKHIPlNBIRijMJtOB9UKNQYZa7nil8S/cNdWtcqP8yIWXciFYsb6/KveGrK3/c+47ISiEGKrpgA8sqgZNhoytk4Ky73Hl9ZMH/VCPGP6jujHBbzaQmqAeH9ql+rBMl0AknCOnhXB4gS5BLyqXQgOH3m0OBRLfIJeKFqLfGCAtwDSYYeKzUanCiTJFzqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFYFyFViGCwaP3dT/4/Ri8jfi/Lu/yIX3HIVH9bAINI=;
 b=eLZ7wF0e+i1cUM0TZ8cCkyvTPTq9L/qWcycKmwG65pp1miTSFP2YN8ZMfwTa9ySQOS7ui/P7sr46/7qVXA47pyhk2hAX1bNEvYv6WZYJDpFw4AWrMgk1UgFg6Z+j4ZZXeH+0Q6TIncD5s6Z6Hd4j2XlcC4oWmykM+AqqNTKJ0i8fcDXrYphe+hUSMlHcGnnHjvJKsa/lMX/RK/qGB3MaOk7fDhHfEWm2zTjH1XTrR6mUEbcAwXl+8qlLQbdgilykLy9f1G8w96Nfoue/TgOVhvtkC+2uJOdC7uHBZ/r/Nzv0KWUruwyqEKE03PFmuRSF5c8LsN8d7eUT2rI+fyax2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFYFyFViGCwaP3dT/4/Ri8jfi/Lu/yIX3HIVH9bAINI=;
 b=GDRYgPCkuyrbkG3E5vWYopNC2KnQlamRl/Lnp3JqvJ6ayT9WFY+khkLaKH1xKaNIbNJDfxyV8kz8CL1wQTPcQ7016bMfm6dALWmezA4Bz/8hHAofXjOE6B5eRhrvF9xN4nfDLNx9O4+bzWz2I0hr5wwneaXHGzcU79+8TxaLvaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eeaa4784-e213-901e-f91c-1b3f2fa40d7c@citrix.com>
Date: Fri, 16 Jun 2023 14:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
 <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
 <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
 <35ac1ede-73ed-c748-9eae-06b156145274@suse.com>
 <50fe5a44-2e26-461b-1676-abae665816e6@citrix.com>
 <39f2eed7-4a28-5c98-6e10-2171d630d198@suse.com>
In-Reply-To: <39f2eed7-4a28-5c98-6e10-2171d630d198@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: a36753d3-7dfc-4288-9374-08db6e6c3322
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HSiqcHvahL/mONSJZ/UdURrOjz2HOoetaGgucLgk8qY23dsijNjXq/70+2fiwLAq9/sH1jZJCfBcOR7Fo4+rKJDCpF2FjYqYd09cfBoiouCvwEC4kpAqrUdwnsRdUmDYHeeRFS30oCPfdGjpo4t/UudwPArYhFgkQ70tH4xnyFZW3mRWUonFQXW/OoVJi9j9fWpWXWvgFr4AhQhS/1SZoI6KWRBBmya1L3dA7iwkq01/ylLEPKDovVZs2ObWo1YQSasIpXiFaoSQr6nE6HsqHtK31CX5Qpmn6hJ6qFJBP0rUOCEeEoYK9v9PTr8BPnZPBMHAC0uxqYxctlza6v/nEj79oHjXr00307RQLHWw/XO+AABEg/gAuoFszCboBGTrNkNkDWI55hGHjVJPVoDRAUm35lv/4REuUAptYqgMIrXJmzzPAZgrbq29TTZ6IvoZN4kWM60Tj4uOEo2w4dhlYVpRMvk+HkxJnWU6R/r5oZMuKnnLaN0xJUXJRPCxJAK5jVJLlLRkt+3Sp1t7vKtB0Yg1MaEwMpTYIEL50/fHGY7X0X4S/CRdDDy0s6oQwNY8eZC4kt/AOG+ft89qUOWwF/3u1xFKXWiy9Imous9OKx5xZ1Y2Wmd7ZmJuUEzKu9jyA/IzPA1yjbN5dyGk8aO26g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(31696002)(4326008)(86362001)(2906002)(316002)(66476007)(6916009)(66556008)(66946007)(41300700001)(5660300002)(31686004)(8676002)(8936002)(54906003)(38100700002)(508600001)(6486002)(6666004)(82960400001)(83380400001)(186003)(6506007)(53546011)(26005)(36756003)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3JObzNpUHZJanFzSkhkUVYzQy8yajUxZXVEcGN0dHJJRjRaNmJUY1pBbkpR?=
 =?utf-8?B?WVpzV2c3azFuYUpOOFNsVmowRm1WRzVOUzdPTU9QUjRmOXd0MmJWOVdJNUc5?=
 =?utf-8?B?UlhjZUtGS2l1VENzNVh4WGsyUHBMdktEUVdJOWcrUjN0bFpwYWpZUjl2T1J4?=
 =?utf-8?B?WVkxakdPL2w1QWRUT2lUVml1NG9TZzBJemRyZVk5OER0ZXdKUHRYdFd2aXdr?=
 =?utf-8?B?R2NkL3hvSWM3SGpzNlU2RStZS3RJbFJRMVczTEhnaWZYdjU3azVsT2IrYXAw?=
 =?utf-8?B?eFBkR0o1dCtSZFZMTEZneTVsMXgyWi9SZWJYRXB1YkFIZ3JNdTJyYitsSDRH?=
 =?utf-8?B?Q0J0MHNyQUgyMVJOK2lKWnpkWkVDbVRYZUVjMHh5Yk9yaTFCMGdQR2g4UEtx?=
 =?utf-8?B?UjVmdkhLRm5sTmpBZVV1Kys4b1pzNmhvWFNNM0ZZcGZibnordUhWRWo0MUVK?=
 =?utf-8?B?RUJiYU5EVDgwL0JqbTEzQUJTeElsQ1l1R2J3cm1nREY1UVlVTEREbWhiTDlG?=
 =?utf-8?B?czdCOXp4Sy9nSVlJdDlrRThzUVdWSGxaRXZHSlVzSEROU0owaUtUY1VVU04z?=
 =?utf-8?B?RTlwOXBjNUlZNmgvT0VKbnpFMzZHZllydlZVa3AwdnpBNFZKWlV4VkhHMURM?=
 =?utf-8?B?TjNHVVZKWlBlUDlWMWY4cSt6OUR5eVhEUEVSaGJ4RzVjQTlGSWI2VE5XTTNz?=
 =?utf-8?B?TU9DOVY5ZnpVSXd3bW9RTGdLNXYzOVd1WG1WQUVSK2wxcHhrVjllN00xQVJC?=
 =?utf-8?B?SHBNOXZCTUdNSktVOGpka3pSeFpqZmhXNzJyYWkxdnh5YWw0UzBmLzNJejRt?=
 =?utf-8?B?aURWY2ROOGxEcjIrRmNybkpIMGZLeFp1U3JZaWxOd2NuY0VDa1Rsc1pFRkgx?=
 =?utf-8?B?RHZ6Y1J5TkwrNndrNjFRMmJObmU0ZlcwZ2drdUFlcWdGMVlBT0RxbU5EM2Yx?=
 =?utf-8?B?d3JESm13SWhNVlpDcnBXMUsrNnlkT0pqeXlIUlJPaEkyaEU0cnhXbHlna0dj?=
 =?utf-8?B?elJFeW9KTHdxRUpJUHNQS2lRdnQ0VTR0SzdIRlgrczk5MnNoMkcveWh2ZXh1?=
 =?utf-8?B?ellrL056N3Y5ZzRmbVBEeTgyTjM1ejlnWjNqSi9GeEZpcTRJSy9ZdVFpQkc5?=
 =?utf-8?B?em9hUXhPbUFqWlRBK09rMWFDYnE3T2xYRjVIbUFTb3lRN04vRUM2QVNhN2hW?=
 =?utf-8?B?SjNCTityd1Bzei80dzZLWUxQT0theHpuMW5kZGNRUWJzaWM0N1k2ZHlPWXRi?=
 =?utf-8?B?VXMvQVlYbVFuNUxxM0xBeFAydHAyN3dLRllsVmtXS1pxa0FOcUxGMGJEVDA1?=
 =?utf-8?B?SjVNd3ZiYTBpUjdCL05oQVJKbkFBU2lObktlc1JtdnJMYy91WDl0bDhQbUFI?=
 =?utf-8?B?SkZKdU04WFRScGlvdFVFbU1ENW1Hd3BLK2NncmNCZHJtZzQyOHlLQlI0MmEy?=
 =?utf-8?B?aW9HbnhxMjdWRWxYRTRmNG5QSHo3VkpuR3YvVjlaM2xaS1duVisyQUIyYmVo?=
 =?utf-8?B?S21TTUx4ZG5CZmNMODd0eE5oUERyN3hIc2dZU1ZocHBhMk02aFp4WmRoZmRh?=
 =?utf-8?B?MTZHblQ0czVFUHgwbVhGNGFYMndUc3VxbHV4NUV0S01ZT3kxNGhkSkVSejl3?=
 =?utf-8?B?amhlb1pWWVZydi9kSjZkQ2pHemJNTDJYbzlxdktwUDdxR3NkSExFSjdyRlpR?=
 =?utf-8?B?cm9XSGJFOHhUbHMxakRDSmFJb0dnSEVIY1ZnWUpUSDN1djVoNmJDQ3VvT0Fs?=
 =?utf-8?B?T1M0UU1MekhqNzdraTNRQWJYdzM0YmgxeFVCc21ROU9hTzBqcnFJOE14dEJR?=
 =?utf-8?B?MS9pb1hBREJqR1AzbkZibC9ySStmNWpXRTZrZHk2WFl3SGtJMzVGbEhrZWFx?=
 =?utf-8?B?MFR3WjNielNZa01nMGh3VDdCUkNyOEJEa1F3QXIrVDRCYlVVOWc1OFJMTnJN?=
 =?utf-8?B?NkZpMzRsRmdVTEN0SE1YeVpBMWNOL1cwZGduMzN2OWtKcFVMelorZnBGMHZn?=
 =?utf-8?B?UUZkN1pLM1MrVlNSdkpRYWVseGFxVUZZcjRsVy9zVHd2QXNRNkZQelNUVzlC?=
 =?utf-8?B?ZjRYVEJWK0hkMXhGSVByWTI1MUZqUlo2YmtIdU00NnA5REcvLzZrNFpNUlFr?=
 =?utf-8?B?WXB4WnRDNEEycUNKc3dvWDVYdmpRTWluSll2dEVTQWZJTTEyanExbXBLQmoy?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ntzo3YixxAyKRli/Moza63rmfctumCqV5+HdvgSsEviikMMvpivvbkUgxj95uwqXz62X4v1XYrAkTjUk6kKrFMmSelzMyzRiA2ksDeZm+l829rNDf1CVaoly7JA1RIlSDS4YwtXjVN5HyxDC6LkpSw+4iRDI65MYV+L/S34Vk6UjR09CXhzIqEELlKrDY+gCUWkBBARgvNNDX2srCZGuks82K4+N+UKm6YQXKanKmDxh7btRFdFA5Q5T+16A1QzXeeYcCcz3FxYjhziXYY2Xsk3tyrl/46gQotuNZaXSZYb77YReQRN122hbul1MLZXXoTofJE7e/AUIa7uYwxzAUaVeJDahzg0SXYJ/ez552FwngIu0xK8uVwCpImYI+PzzLvYcN004uv2fezrVLf7mxGapjRE+Qt1k+tRG0qL3+Kzj+J62TMEciHMlPvnfAU2q3f+5kzpd8wftn0TQoobIdJyFrk9NACnwPEoYV3NPfbdQrkVT2RL65ZU2oqblNEJTuKEXSDU7cabvssAePyuWCzfrVR/sVakfqwWvj0xD4ECcQqSOMBKMhfjldj/J9H7J2WcKye1SMqR9tZgUvhRYCxtYxNTJcWlaMwhr7tbiiBOQLB4WCcMVPzbc8igaMAIt0xX5UtHSfbXxLubWdWaRbjFUv4RjWf5528Lam/U1T3JWdA27crbTGM8vCk8G5pzZwPfqU42J5a1zg5eieN3ZpxEjymKC4DVAgpBQrT7giBDDPbZatwdsPOEHf2gWbcAKS0QT0Y5R0K/scZVmpC1eqpxmfkjojqiKC8snVDrGHDbnvGB+mdA1MyRxCo0HJ+HR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36753d3-7dfc-4288-9374-08db6e6c3322
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:18:39.9769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wqD8Dg//NQGNhY2hBE6j87ewpxGitS8tm6eYk+E+1TSNezoGxsMCCeWKz6LilVkqu33AVq4dZorjPqh6py2qakEzNieEZl2nbkr336sRr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6115

On 16/06/2023 1:12 pm, Jan Beulich wrote:
> On 15.06.2023 20:17, Andrew Cooper wrote:
>> On 15/06/2023 1:13 pm, Jan Beulich wrote:
>>> On 15.06.2023 12:41, Andrew Cooper wrote:
>>>> On 15/06/2023 9:30 am, Jan Beulich wrote:
>>>>> On 14.06.2023 20:12, Andrew Cooper wrote:
>>>>>> On 13/06/2023 10:59 am, Jan Beulich wrote:
>>>>>>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>>>>>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>>>>>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>>>>>>> not safe".
>>>>>>>>
>>>>>>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>>>>>>> statement that IBRS is implemented in hardware (as opposed to the form
>>>>>>>> retrofitted to existing CPUs in microcode).
>>>>>>>>
>>>>>>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>>>>>>> property that predictions are tagged with the mode in which they were learnt.
>>>>>>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>>>>>>> alternative predictors but restricted to the current prediction mode".  As
>>>>>>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>>>>>>
>>>>>>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>>>>>
>>>>>>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>>>>>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>>>>>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>>>>>>> this dependency to simplify the max derivation logic.
>>>>>>>>
>>>>>>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>>>>>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>>>>>>> "somewhere you might run, Retpoline isn't safe".
>>>>>>>>
>>>>>>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>>>>>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>>>>>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>>>>>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>>>>>>
>>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>> ---
>>>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>> CC: Wei Liu <wl@xen.org>
>>>>>>>>
>>>>>>>> v3:
>>>>>>>>  * Minor commit message adjustment.
>>>>>>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>>>>>>> With this dropped, with the title not saying "max/default", and with
>>>>>>> the description also not mentioning "live" policies at all, I don't
>>>>>>> think this patch is self-consistent (meaning in particular: leaving
>>>>>>> aside the fact that there's no way right now to requests e.g. both
>>>>>>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>>>>>>
>>>>>>> As you may imagine I'm also curious why you decided to drop this.
>>>>>> Because when I tried doing levelling in Xapi, I remembered why I did it
>>>>>> the way I did in v1, and why the v2 way was wrong.
>>>>>>
>>>>>> Xen cannot safely edit what the toolstack provides, so must not. 
>>>>> And this is the part I don't understand: Why can't we correct the
>>>>> (EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
>>>>> as long as ...
>>>>>
>>>>>> Instead, failing the set_policy() call is an option, and is what we want
>>>>>> to do longterm,
>>>>> ... we aren't there.
>>>>>
>>>>>> but also happens to be wrong too in this case. An admin
>>>>>> may know that a VM isn't using retpoline, and may need to migrate it
>>>>>> anyway for a number of reasons, so any safety checks need to be in the
>>>>>> toolstack, and need to be overrideable with something like --force.
>>>>> Possibly leading to an inconsistent policy exposed to a guest? I
>>>>> guess this may be the only option when we can't really resolve an
>>>>> ambiguity, but that isn't the case here, is it?
>>>> Wrong.  Xen does not have any knowledge of other hosts the VM might
>>>> migrate to.
>>>>
>>>> So while Xen can spot problem combinations *on this host*, which way to
>>>> correct the problem combination depends on where the VM might migrate to.
>>> I actually view this as two different levels: With a flawed policy, the
>>> guest is liable to not work correctly at all. No point thinking about
>>> it being able to migrate. With a fixed up policy it may fail to migrate,
>>> but it'll at least work otherwise.
>> If you get RSBA and/or RRSBA wrong, nothing is going to malfunction in
>> the guest, even if you migrate it.
>>
>> The consequence of getting RSBA and/or RRSBA wrong is the guest *might*
>> think retpoline is safe to use, and *might* end up vulnerable to
>> speculative attacks on this or other hardware.
> Isn't that some sort of "malfunction"?

Perhaps, there's a difference between "it will likely crash hard" and
"you won't notice the difference".

>
>> And the admin might know that they overrode the default settings and
>> forced the use of some other protection mechanism, so the guest is in
>> fact safe despite having wrong RSBA/RRSBA settings.
> But then the guest would also be safe with adjusted settings, wouldn't it?

It doesn't mean the guest is going to tolerate having features change
underfoot.

>
>> I don't know how to put it any more plainly.  Xen *does not* have the
>> information necessary to make a safety judgement in this matter.  Only
>> the toolstack (as a proxy for the admin) has the necessary information.
> I'm not looking at it as Xen making things safe by adjusting bogus
> settings. I'm merely looking at it as not letting a guest run that way.
> For the safety aspect I agree it needs a wider view than Xen has.
>
> Anyway, I don't think either of us is going to convince the other of
> there being only one way of looking at things vs there being at least
> two possible ways, so in order to allow things to progress
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thankyou.

To be clear, we are planning to put checks in place.  We definitely
don't want the admin to end up in this corner case accidentally.

~Andrew

