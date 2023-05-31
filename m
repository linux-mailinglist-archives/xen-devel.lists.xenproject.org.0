Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9ED717FD9
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 14:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541751.844814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Kr1-0005r0-0u; Wed, 31 May 2023 12:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541751.844814; Wed, 31 May 2023 12:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Kr0-0005or-UM; Wed, 31 May 2023 12:23:02 +0000
Received: by outflank-mailman (input) for mailman id 541751;
 Wed, 31 May 2023 12:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sC/f=BU=citrix.com=prvs=508b7ea43=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4Kqy-0005ol-L0
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 12:23:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ae5ad2-ffad-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 14:22:59 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 08:22:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6092.namprd03.prod.outlook.com (2603:10b6:408:11d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 12:22:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 12:22:48 +0000
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
X-Inumbo-ID: e0ae5ad2-ffad-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685535779;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3oN8eKsUv8TWadx+qFeAxeLJMVAsVB8AkMJRgyT8Lsw=;
  b=Rer9IgQQXseRJP3eFdhLw5HVulgulks3IYNgiVpryCkKNMF6vRxXIniO
   uN50qvEpeOCDa7rheCit1teADfWmzTypZsZBdE54E67MLWeC83UUTbtkk
   5YXKKnUpcVTjzBxMAe95u1hL7t4erZAa28tRpyUItfh1ApVEnkWnfstHx
   w=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 113551806
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g1Wxq6zGnQBLlV+caB16t+cIxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 2AcCziDbvqPY2emfNt0Oojkp00PsZ/SyoVmGwVsqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjPqkT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWdCx
 /IdETkcVzmg3OHtnPGqG/le38t2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdlPSeTorqACbFu7m2Y4JA8bbAuH/OC/yXSOZ/sGI
 FU95X97xUQ13AnxJjXnZDW/u2WYswUAHtNcFuw8wBGAzLLO5ASUDXRCSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJuuPC4awh9zxXD31n
 TaDqXFkg61J1JFUkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:9/C3U6N3LeqqW8BcT0v155DYdb4zR+YMi2TDj3oBMSC8cqSj9v
 xG785rlyMc6QxhHU3I9urwXJVp3xvnhPtICOUqUotKGTOWwVdAT7sSmrcKoQeQfBEWn9Q1vc
 wMH5SWSueAa2SS5vyb3ODMKadD/DDxytHKuQ6x9RlQpawAUctdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7uHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+81TiyWsnFM73a4m1ecJ+eEzSPBkTfJlZQkEvzzYLriJnYfy8gzd7tvfqWrC2+
 O82CvId/4DkU84+QqO0FjQM92K6kdv15al8y7vvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjeskMfrsplWM2zHzbWAYqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUcqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki92qIfII9Fmt1CVKZ4s6fawq
 6xLW+wnVRCB37TNQ==
X-Talos-CUID: 9a23:wOQ3mm/6wQfdmF87uFCVv0gYKM4gS3TM9V7zeEzjVSV4Ga2nEFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3As/muMQ8LZ01AZk67q3QPTuiQf5piyIi8BXldrcg?=
 =?us-ascii?q?fvYq+BRBZYjyEpSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="113551806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD8QN1adqklqzZg7yiGzTZCSGHdMSnWfpMFh/YbM5FfMpVjDeZ8mdI0sIZjn4ntpL6JrFfwt+vfqvy42mlIszjiSkMSBob8CAxssAhWmr9rU6M9Ed7ZEuwr44fmUVXkn/h3XLmdgBAfAadgmdgOwnhNPzXCSzxfr4xcqCiFBV7u40nps0LT/pRSXp7m8Kn4MUxZbTCOuiCN0hK/DHpVO0+BkcL3gga4/rzh5s7PG5dDqJ9hGAMPAD/2yKd94vI2679+7SyZOKysXMHBjxKb7I6O8xJe8FSPF6zkpYPQfr7LxkXu8F4wIBsqEzHOOXjVHPSYAtmGs3wvBMRcptMKIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjGU/eG2hZQz1UJfukO3WcbkhsrtZoh6xYPE0qbvEKk=;
 b=S0MYQU9UXj6NGohUqf5eug9Fq80/6whLnjP9bPD8TxT0/CT6iuOOskHmwR56NW9V+hmJ+42ZlgeJR9tE6eJcyxhQWj5nn/5brqCWLqRvj7KyoCoTQ9yRcF+o/ITwpqX/WmZd3KiDmI4ENnF0vJXdmQf9JO7tgG8mWP0hcID4BYRAB+KdtHbPo6zLyClfrXuYvKTJAZ+l4gMeB9h4aDLMLvLy1i+h2L3BrcJgP4wLB7KKsacdxI96gdn/G9oLWsBGcJ/ieaQpfAsl5PttZGrwb41LumxlcbdbvQ0Xe18ZbsJQj01LkGh6uG+21xliyvCkvtIrdNmAFWkc+2GfmxUXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjGU/eG2hZQz1UJfukO3WcbkhsrtZoh6xYPE0qbvEKk=;
 b=Xt0i0bWQ3WpCL4KO6xDk+SVgMZtHJ6Dey7sXXlmBhTn/L7XEmUIquXqumQ87QJzdU9+CMKhbBrKm0rQV+SERFqd1n0I9wWylIO5CsbE6UJ/CIxJ3DCBXLkLxmfbro9p36GL8IqXhC5J73A1+5gh6Vuoo4HFSwCqclHp9AE7xnEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9417407-453f-d13d-6bd6-debe1fd3a9ac@citrix.com>
Date: Wed, 31 May 2023 13:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [xen-unstable-smoke test] 181031: regressions - trouble:
 blocked/fail
Content-Language: en-GB
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-181031-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <osstest-181031-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0650.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3768a3-cea1-4263-1e44-08db61d1be70
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCNNHZ7/A1qVdVa1ZzmFB02DHyslN/8cjun8PVAdDW3LRaBuzSS8tf9rfhKCf6NUCZ78jsL3qutdqfZ5Nm7FfZ5LrsCvyoPNyirYlBonOHvdQy/dzcdcICEKpKbnfB+Dwo3sbjpOffjR8+Uliny4XO+52W6pcEWS9agmiAdwJrlLlT4VzzUkCOyJlGz+5N03GSIpT32amyxTwlvTL040TGBATGEs2pkqQ+Iuohd01hz28hHEPR/nQyZuLNjCgRgN3OkJOv/KFtM1bz0fxjmc+GaWyYIO6zACwOaekI6lnqx3gouW3HBNl/B1RTdHvWLWP1Rwf7hfkNQMfJrNdosSDJWoxxLjGdPWHktbpZAeuYHiOA0XJ6Ra8DT96UwroEYx4ihbu033+otKu6Rk3a57g+57jNk1WPa1SIS79PC1+xwODfwUJoExPIDNud0+X2FCXRBACtgILu5N+ivuI5AXzMUeXspIfQizf4A49pGAqAG7xmERwDfQhbxAfqg5BvNiJ2jDbxk0YtrQIu0x247qzwxTbF/AQaJ3/tUXcRdqujicIjCw1KVP5eWdACRFsiwW2GBWeyZZ5084KZiaHoeSJ0NR2z+is+7jXhACy/CLJGFwQNBJWKLBi+Do4xT35x5iAdgo1JlOQ3l9zQfxOJoaPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(82960400001)(38100700002)(86362001)(36756003)(31696002)(31686004)(8936002)(8676002)(41300700001)(966005)(5660300002)(26005)(6506007)(6512007)(53546011)(4744005)(2906002)(186003)(2616005)(83380400001)(6666004)(316002)(66556008)(66476007)(66946007)(6486002)(110136005)(478600001)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anBhQlptOUY5alhsbGFMeXBVMkM2TktObTRIdE01a0RuejZxNnhZTHJqTFRR?=
 =?utf-8?B?MGZ4bk1LZEUxM0Z1aHJ0MjFwRXVkYlZRWDR0RkdLbkthSlRDY0VYVWZzWHl1?=
 =?utf-8?B?UHBsVm1UV0FvRUxESFJvb0RxWHBZaG1RenkwZ3NOOGxVMVlOK2NqcU1QRkcv?=
 =?utf-8?B?VmZRdG1FWU4yc0F1NWpYOE1RM2twZ3ZSdkdRSmtlRitXUjF5cmVGTEpkcitn?=
 =?utf-8?B?N2lnTGVVTHRYVWFSS2F5bktIUjhVK2lmd2hSak5rMDltZm93K2NsZklTZEdS?=
 =?utf-8?B?eHJHeGZOcXY1Sjd0bUpOZUljU0VpNHplbmJMcm5LZWltUzZyTzVMQkJxa2F3?=
 =?utf-8?B?eEhUZ09xTTJGRG5wem82cnp2YjlxbFMxNWdyM2JRUGdDNUhsOTU3dVJ3Y2x6?=
 =?utf-8?B?RExUVUxpWGU2QTJtVEUzSGZjTEovRStOa1RvZnlua2NXQ3hndDlDMUhqR3RH?=
 =?utf-8?B?aHdiRDUyTWZSc091MTRSK3RzTmRPdjZUcDhHTEhtNWpCUW5hRXNHU2FnaDRV?=
 =?utf-8?B?bW5URTFlTWpIMSszRFhNMFhUQzdTM2hRNU55b3RjY0hUWThmTWQwaFZWYi9Y?=
 =?utf-8?B?MUxtNGpsRlo5NEpML2JZOVZwVFp1bGJTZHJtV0x5a2s5WThDaTE1ZzRLMGdF?=
 =?utf-8?B?ZS80YXNDcnpNRmx0MmxCYmk5aGIxTk43bFRWUDg5WEN0Ym9EMHJIK1czSDBS?=
 =?utf-8?B?VWNMYVg0U2l0WE5YWUsyYkRxbTJ6SHEyMTduRXN2M0N6UndZZEZNQkc0Y3A0?=
 =?utf-8?B?MEhPWnFzZ1gxNnlIU0c3dWFLUFdhSjhNTDNwazRjWmFPSFNzUnplY1JwbVFi?=
 =?utf-8?B?RSt4MTlGMmdPazJXMjluRDdHRkNlQVdBTGQrN3FxbkZxeVFoclFIeWovaUVw?=
 =?utf-8?B?NEZwVnpGcFpneEVvYzdNdE93Q2puYmFURllORUplN2tzckNWUUFlalpBNGpI?=
 =?utf-8?B?MUVOVElQTmpIODN1bjdVeFFrSFliYWxOY0Z0ck5ERStFMlRiZlluaHFjc1Rr?=
 =?utf-8?B?dU1KZGJNN1B0V1JqelNhbVkrUjZyc0IrWVhOd1NVVzJHQkZxQmZCTWtKc1pv?=
 =?utf-8?B?S21yUWQ2QUxGdm5rd1R2a3ViRXF6T1lIYUZmV1hnR29JaFBRdWY1QnZuQXlh?=
 =?utf-8?B?TENwd1RYZmp3U0xJRWVXSXhRNGZaZ3FsUmIvbGdOOXlGQVpPdFZuNWhqZVM2?=
 =?utf-8?B?UTcveFBjMmtsUlBsV0I0MHJJOStlUHVZYlZjY2lTOCtpV1B6K1VzMXdVQWQ5?=
 =?utf-8?B?a3RaZjNTbitvSmZQakp3MGNJRUI5Zzk5czlDVnNSUnkrK3NVa2xMUnBpbkRj?=
 =?utf-8?B?L1l0eDBQVnhQcHFHaDZHanJBelhZdUhYZ3hCUEU2d3FzR0ZvN0JnMlN2VG15?=
 =?utf-8?B?eHEvYVJjU242d3pYMEViR2diSWJVYTdYakQyWFpCMDE2WEpzVSt0MFMxRWV5?=
 =?utf-8?B?NGRrVTVKZHZ3VzVaaHgrcTM1b2VlYkJJV0RSeXpkeFpLcW5IQThaYkpQQ1RI?=
 =?utf-8?B?MjRUK3JNbmpFMnAyOVhlaXJzNkd3K2sxZytNYmJlNmZtWkJjelFrcEF0RW9L?=
 =?utf-8?B?RlBBRVFCRzNMYjhXVjUzdWRIUTQ4SEl2VkdzdTQxeUdkQ0JWNFVqeWg5czVa?=
 =?utf-8?B?WlBTdE5mQTdaay9UTHJwbGMrNEYydFFHb3o1LzM1dEl2WVYvOTd5U2QzdVNm?=
 =?utf-8?B?aFFwSWFVbmNNaXk3N3ExTmtJbnROT0ZsaXppSU1SNGxBK2lWcFJBZFdaL29U?=
 =?utf-8?B?THRsY0NuSTNnM1A0RFBkYks0YzE0dHFianNHK29DdVdqbFpHUTNDa3ZSSmVn?=
 =?utf-8?B?Q1lCcWZzT3RlWEtGenB6WnYzSC85dWN5NVc2cFQxRis2UVhFMWpvbmJaQTg3?=
 =?utf-8?B?STFyem80YTV4VFMyZmR4UWZ3VDgvNlNFcWh3Zkd1TWZKN0VPM3h0ZktBN1ZO?=
 =?utf-8?B?MXBvZ1ZneUU3N0IrZ2E3eEdHaEkyaUZmVm96UnAyNGxjNG90Z3VZMmFnM0RO?=
 =?utf-8?B?VTFzR3NNWXY5ZWtUalNEOFhiaktBWWJQSjh4QmNNMGhxS0V0VTRjVVRKQmUv?=
 =?utf-8?B?eXF1a2dCdEFjR0M0SUthMUZhZWV5TVpCMU8yYm45VDlrdmtqbXdqWVRHRVFH?=
 =?utf-8?B?MXQwTWVOMVNqWFBKcWt6STRIZld1b3lPb29ZRThqT0RkK2MwZTVvZVYwUmlW?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DgXM8Zy/2wesvfOBCkXg1DWpzcMkXxBHjEOjju3gELpmFJC4ju1r2+cttk2X9xsuaUMpacpwtxFpxxMCFSQTPs9wBMSACL7DYDTL1bxVoJ8bDn/pqiZzKT9nurwF/+iagJi/2Y7yssxqqN7ZzEbjSmlCopd5MA7jU3VW3gXkN8+P9U5fDegQKc1g5SpfmLseBHUw3tRKmNpGB/GhZw+RORnZYh8itFIZcfVaqQpASFIgZAQSxsxXDz4UFKBlSGv8vSN9kJtWuB5rlXQ3ahwtcMmH3olmDCSpzujVc8zYyxB9pvuaf2EmJIuqj0laNwCSz7Vm97fAaHHTr/kXlAxRdcQ0HPn5zqqf01YVXfOUzStnfdbL/3BHqYSwl6Hywp1UcvK+UKyId7l8MrQkJy1AqrSzwcqJ0Y9gk83qOUgWTteypH4SE2k9e5q0k1nGvWbiRL+DSsxnNnHvyUpKFZdCtfptHS/6J242umxoVMWjyTrjdGsMPyndXEWFw4bU0brxaf+uGHYmpnN8sIJF89PAsx5Ixsd58rZ3KZ9Qdm+EDbqgyF6IQ+wAvc/CFZlmyvYT9B4NeF1PY3+DOwJHRT1fU2rqoqdkPRBhTzYDEZRjeGViBKCikXn8LFyBWJ9VMHrtIYptWWPO4MgmDsjWDkFiCMso9wu/rzPY7OgkKbGd9caxTtXn4hC5SvDsTNOQrrkUonHZiXtv3T+m4K9vgKy4vcBV0FzT/Xtff1q/7rRO7YBkdOOlm8xy1DPamnNtlf70FyBCmnrvdvzPq8s+Onssa6kqXWXcmsss6UcDphgoBXrywM2+mgHuo9hTkOzlmBvB79PzLlriTDfSvDn3wQNoWg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3768a3-cea1-4263-1e44-08db61d1be70
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 12:22:47.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBvy2c8XYuxd3IJ/wAB7jUPb1I+/WmjRZm1/ytdHFdUbuiOJwChrtr30VbINKzL0O5oUuRgucMPNyMBr35q1HdIOMpJHvm7zB/cr9aAAbt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6092

On 31/05/2023 1:17 pm, osstest service owner wrote:
> flight 181031 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/181031/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 181018
>  build-arm64-xsm               6 xen-build                fail REGR. vs. 181018
>  build-armhf                   6 xen-build                fail REGR. vs. 181018

Real failure, caused by the vPCI change.

http://logs.test-lab.xenproject.org/osstest/logs/181031/build-arm64-xsm/6.ts-xen-build.log

The userspace test needs is_hardware_domain().

~Andrew

