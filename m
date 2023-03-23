Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065296C702F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 19:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514044.795964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPft-0003dU-Tk; Thu, 23 Mar 2023 18:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514044.795964; Thu, 23 Mar 2023 18:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPft-0003aq-Pd; Thu, 23 Mar 2023 18:28:33 +0000
Received: by outflank-mailman (input) for mailman id 514044;
 Thu, 23 Mar 2023 18:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfPfr-0003ak-S9
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 18:28:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e403fc-c9a8-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 19:28:29 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 14:28:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5858.namprd03.prod.outlook.com (2603:10b6:303:9d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:28:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:28:18 +0000
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
X-Inumbo-ID: 80e403fc-c9a8-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679596109;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zdc3FH08tjDh2mqq1+ESQmm0y22mAPxOFGlevcVRR+I=;
  b=anHslubXQhfZPU9IC3MNg9OPHWXxqfdFp/DIMqPtcHvgfWUscnth0At/
   iTEGFYXbrN2r9YkQuF6zgFU4ffTnqodTHq2hg+AfDZZWNbp9Q2lnBRYRf
   ROxrmeF6rNf3eJjvSq4gJx0QmscfJaZjCbLcD0/gukjThF9dW5gLbhoD3
   E=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 104493177
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OfmTZKLOuklYmaYbFE+R4ZQlxSXFcZb7ZxGr2PjKsXjdYENS1TUHy
 2QcXGyDMqzfazD2KYsia9zn/UNU6J6Ay95kTFRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5qLlty5
 ds6FwstVTTAv8O4w5njEe5F05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunBNNJTeLnnhJsqHuhxG06VFoHbwWAi9K/oReUdY8YF
 nVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImHKvriNTwQGn02
 2rT9Hh4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:KUxqgKF3JQ9QHgL0pLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG88566faKskdyZJhNo7+90cq7LU80l6QFgrX5VI3KNDUO01HIEGgN1+XfKjTbakjDytI=
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="104493177"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9w6IZuFTQCOU+rSpvYxkUuBCCJyAjWgacNju+mQA0n6XtNMAqXRD6eXLI20/T2JNmBQ0H8lU12ehhqozUS/26jpDqKEU6wTAApzo3ggkrtCpxusor6xzZS6or4+ql4fwcGOOFw/i9EufFICoq3pSR9b+LLdN+QTKoGhHx1I3fBeh/ffmY0Enc6H7p6rUncAficREEvfHaKNJHD+/7c0IdWi+Sr+r31JjN6fEdbN7jCwdB5DozUn/Nmz2ZxupgdU2wLOQ3+YeKphPBbm5kqnUzwLUDGqom9D6gWgNvJQJF1xcb3ZkFUHpvQroLK6Boe791KFGTCblKu7sORKvKnL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WGZH1vW4lzrH+1zyZw9Ab0ewh+SjZa1gRO+RBef6Iw=;
 b=jJZjIhsysEkG1+SSepDsGeQccw0Wd4iytjtmCKs1a+62+uoCGBt8Kj1zGSej1ijNF4b9qd/4OEl/DuqVW+f0LtgxPsxPxsCCXduj+obc023AZj1V9VdVstf+G4bEWHq+9LJPVEQ0k1NK4XDEwTppmRogYFXXZmdkgm0jM1qDQwWmeWSaNHE3E+XqKBAsktsZMSKkNqybBOfRHT4+pTNE0lGhXdb+wcz13RxvBUSuLfw6xjzLv0WJ3PPwIYDgSd2+0p7qrSbX+hCgokjXjQk3e6YPDT0IdTzs8lAgoQENAbSTWjpeM9+3b7UObxhQxIpmQlRJBOsezxULrXwVGghqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WGZH1vW4lzrH+1zyZw9Ab0ewh+SjZa1gRO+RBef6Iw=;
 b=TWwqmX3P7zpkfxcLobEXbFvxz/9+GcjaSKAuogeVqE26famveXq6+RYyaxnWcEO1sOaDxQsdfKVUhm8DFbs68I4T92Ni4s3vxYjkpnOu3OMFg/VRwXcVMEmDAZhYNM+Xn5tLl0zyuBloetQlcZVmrfXkKnLH9EQOvjY7jQ9CZz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <65662ae6-8a86-ddba-a3e8-57ee557f5b80@citrix.com>
Date: Thu, 23 Mar 2023 18:28:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 12/16] x86/shadow: make monitor table create/destroy more
 consistent
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <d6ef377e-731e-faa4-aa43-ef40ea34be07@suse.com>
In-Reply-To: <d6ef377e-731e-faa4-aa43-ef40ea34be07@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: c0211866-82fe-49ab-b33f-08db2bcc5fc5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6VLZ80ZMCAQpjEFN2a4C0m3SSbqV+dNR5xog6m7h5EnMYk3Y32vKgzdrF1qJsonZZw/W1jhvWuojrAGGDElfAASzj98cTybIiCJlxzWhjpXqXnb70o+HHjav0ysW5myksFr3HomDQyVlGsME0qLohKjOAoq+WFrAooW+AD838F3nyM1ZBVBj4wZEfMELl/fGZGRRD5HzqbwnwA6VZgL7hOZQlMqJxwwyYGkwqCULPwsCVAMXxvnUd1OoKLkjq7Q6xsa9vAiRcXM5tzFQ9fYWnxvfsnl4GF0FH8z5ietr/TfX/A+LH5tLrUzWfY2nFmSARycjcmV+DELizodGfv9KKQuB8t3OicPESudJTFFHwEYE+AfNEvCLgt67tLIYjHaTyataVKWA4NExFYJK8GK3T5sF/I/2/YoHIqut9a4wADSoxt2l8nc8/PZ6YhIgzGoIlDxzMnvGby9jXq5KNZID276dsAwJ4tigD3fTbbvs/yKEaV+vxusq69y9mQmye1QKE/+cKRHe2TS8SdamCa+xgEhGFrH/JaY6tDQUha1fkXlrpYY2IUzdFvLSE7yVDrPsV90b9pHc+/LWoUfgBReqSshLJ3Xurvj0Bz3GAc4HtyNAXTFH2V/X8Q1CwBr2ZuWMd5XHoImMrcMvEazL4x5GT58m+BaELlVdqtvsxs7lB91T1GrICzLAq3x0IPzAngA3C1KtoEoJU20mWZ+H2GIlEOzOhk9STg78w/T5Lql7kE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199018)(31686004)(38100700002)(2906002)(66899018)(478600001)(83380400001)(6486002)(186003)(2616005)(31696002)(86362001)(36756003)(110136005)(316002)(66946007)(54906003)(8676002)(66556008)(4326008)(66476007)(8936002)(26005)(6666004)(6512007)(6506007)(53546011)(5660300002)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lyS0N5SVRjcndrSjRDY0h4UTJNMUYweTkvYTZTeVl0R24wNVJwWWI4cUMx?=
 =?utf-8?B?ZUZraWp3S0ZtNHVhQlQ1ZVNBM3hucmcvOEM1U3FJVHhlQXdBb0lRbW5mcWd5?=
 =?utf-8?B?Zzk2SEt3dDNDMTFJMTA4WGNIREdqTzhlM3paRy82eEdVczJvdEg0ZjJNVlJP?=
 =?utf-8?B?Rm03R0IvVEpicmZ5amhaWXFVL3M4R1hRb0tNd0V5clhyRWFzTmxEVWlPQUda?=
 =?utf-8?B?U0ZOWGluVW5KSWM0MFhtNzd0dEZhYjI5Tk1OZ21zdWhkVW5pcEdvYms3dGds?=
 =?utf-8?B?NG5RUzRUdzRHN2RkUkRxU0x1N1d1SDdSVjVMT0Q1aGNyWDN1V1BWSis2bi90?=
 =?utf-8?B?RXRRK2RLaVNLNU1RYWx1WkRxQVpIa1pSa0ZFOTZDMzU4TWRsazM5azdVUzBr?=
 =?utf-8?B?bGNRSlR1a3dZbkFISzl3bDRkYkhkaWVZNUdWaEpWMTU2UlRGdDlmWEIyR3Yy?=
 =?utf-8?B?WVN3UzV6bVg1c1RrdVZyMGhuUW9hNnpiRkFJR2dXRlNGTU50S0UxVlg0VER0?=
 =?utf-8?B?S1BqRzdmZmNkTTdyVjhCSmMyeXV1Q2M3MWhzMGxzV3RWQTJIbGFhWkdNS2R4?=
 =?utf-8?B?cWo1Ry8rajE3RC9jazJyM3c4Q3dUUXdLaHBKUWR3bUExZmZTUVc2YUNzQzFW?=
 =?utf-8?B?WHlvVGkyeGZuekZFeG56eGdISEZDcGN1UmQzL0FxUkZqVXdZZ1FyK0NXWmVa?=
 =?utf-8?B?ZUYxTHBHMmxUR1VPS3IycWRQdmlMbzVvSmsyM2x2eVdwbE1kaDNPZWhqSlYx?=
 =?utf-8?B?elA4U2xIYThvbTlUUUZFUkVTVE9BQldHeXlWOTRYZ3lHMkg0K20yWVJoM2Qw?=
 =?utf-8?B?VjVLYVVaZXBpU0RCV0UyaXZSbVBjNlZrSjZQbHB0RkUxZDhkQmJ5WXZQWGxq?=
 =?utf-8?B?cm5xWFBNZU41WG5NYkYrbzFNcVVsWDJ2MzVsUk1weGQzaW53dTUyeUlJUTU2?=
 =?utf-8?B?ajI2dXFCTVFDdHdUb1RtN2NRZEVGZmp4VE5sU05PdjE2NWN5ZGd4SGJWK0lu?=
 =?utf-8?B?U1ErZFlEYmRSQWpxbDJvQTJjMDBoejlkTTcyRHdPMXBydFMwQjAzaWlyL1lG?=
 =?utf-8?B?NXgxWkhEempqd3REbHlQOXpGbzFGK2ZRNHNKUDRwV3RLcUsxTXJTendKNFNv?=
 =?utf-8?B?dmZ2VzZUNXdxWGd1NDJFRGp6a3JJWnlHSWF1eEIxNlI2VmpZS3J5bENEaDd4?=
 =?utf-8?B?cTkvVTN2dEhNNnNVM2ZVQWlmYjJ3Q2Fha2RMMS9qK3FBRFRMdzlRaldUaVpk?=
 =?utf-8?B?TzgrWDFqUnJNRDkweEhGZ3NnOHovNG5SeW9MR3hJVkVJTmpEV2VuRXpmQXB0?=
 =?utf-8?B?Z2d3czVoWUpKbFZGK0hGSUVsaEVhTzhsRnN0blRGc3YySEFEYmJncUZQc3hF?=
 =?utf-8?B?VlVaeTN3dXRjVUg1dmZtYmpkUlJNQ0tQekE5MFpDTEdtdHpTMVNWOUhIV0ls?=
 =?utf-8?B?SnhBdUg5QTFaLzNtN0RhRlA1U0NHYkxQeHV5QW9PeDd6WjNra3pUN0JrYjJV?=
 =?utf-8?B?dkR1NVlmNTN1RExiaXdzcjNnZTM1MWtUVUpHQlFTSkl0MVErMkNoTzZDL09E?=
 =?utf-8?B?bTRtY1N0RmtFVGhVWnAzaGxKdFNhaC9GSVZ3QjZrQUJhazZEbzkvUERDSFdM?=
 =?utf-8?B?Z3VDZE8wTzk1SHlTVVpqQ0JZYlVNMHBXeVc4Q1dEb25UMEF6aWhYblorWUlU?=
 =?utf-8?B?RVZHenZMZHdFR2lXMFR4RFlIWFFMcCsxMXJhTDBWVHRpQmRCNVVCa2lXSmJz?=
 =?utf-8?B?V2IyOUEzMlVudStrYlJ0eG1iVTRCcFAzcFQ3bFpyRXBtbEZyQTZVRnNpWEF6?=
 =?utf-8?B?YnRpbU50OW51R1pTWjkrRXVqTTQvanV6d2d1blNhZlRzK3N5ZTNCUmgyR3Fn?=
 =?utf-8?B?dVJsbDNVbTV3YXVLVlp5ZXlqalVKN1k3L0o5Ly9RcmtUVHdjajZ6bHVtdlNp?=
 =?utf-8?B?clJhN2NGcVpEdWNxeFRUYWoxS0gxcXpab0IvQ1QybFFQb3AwTG9KUFhMSnls?=
 =?utf-8?B?L21XTng4bjlYdFZrd3h1VHAxS0pJR05oTFFsUlQ2d29QUFBsVDk2NXVhcE1Y?=
 =?utf-8?B?YTBiVVQvcDhjVXR0SnJsTklZb3FQdGRReVQvRWV2b1RUWjllbG9KOUdjNHN0?=
 =?utf-8?B?ZTNLb0FmRFp3aFF0Z3dOL1JuTUVTRFdHWm5pRjJiTGhWZFJQMzR1QUN4anNx?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	el1y1CD2qiERNyVV+i8Pw6U+0cyiJUt8tjcLBjOmiZOTlil7WWBMXquSPcTmEvbyPdE2Hr7l1XiwUzoEri6GREUUAsnhCSa+0EOVGQbXnxNCxrNOYm16kNQwJcLcdndf8RnD3HpopLavJyM4AxcZ8Z6jn/nJFgTLRp72haJlWMT7bUQAy7fazfOZFD7eFv5Dznu2FK5cZZ2fhchQrnx6UNaUWEdiDq1qcfSREbwgdh0giD/0rrOhIjHi7D7nbpwWEcC3AzU6jqr1CnkqRs7Lud0g1P8dYM68mHFgA8DTcTut0Eq9/gOboHs1TFcMaHuiNUrmnwP/s+Rvw+04fQEiYdmjMmay9/CoCEeg0ioQL8CDQRo2qobCl2lyT9iRC2zNVakseSUIwcgfdWhCbOS9yO7Yl8tNqU0UDNbsgX0r832rjQl+f2QP2RAbcTJDcGOPPfHCoemnTSrtcUOfKV0LmGaUifiRQkDse7F1HJHGMxKn4gTs9m3/jCNvQoqxqH8PXkOQdAXiyu76ol/utcO65C+Bgu96Arpas1bMXQm89wokxEo7QDA4dZXarOkz8VaVM37kMPdFIEMUiX5m8Lfl6jDU8+FsgiPZbqj7e/BMfEij/SlUUcii++F6Uy3k4gAnnWfVHOLHzfKPJYFonf9REPp+xPBrA8aATEfcv5cb8vLt7GnvPh5rwJFQLMxy7EFYUufJqkighCVC/EgFRjmVi3QkXo4+XPbYN+fBqYK9S0mrk38ZvivdeKOSHTv7jKCW73DzZFBAm8d0ngH8DKOGN5s/tnSW97RGbPDJVy+I/T+QW7SaWsy/XTjSUcwEzfCm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0211866-82fe-49ab-b33f-08db2bcc5fc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:28:18.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToxUtNgV1DJaTvWIvRzfLTuSJwCnH/HiM5x0ytqcpb4GueRI+p0Rfg0rUiqZKKawhU6b8p1U7onpWmqi+ppLq6qPb8olBMZESpcZVsHvVfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5858

On 22/03/2023 9:35 am, Jan Beulich wrote:
> While benign at present, it is still a little fragile to operate on a
> wrong "old_mode" value in sh_update_paging_modes(). This can happen when
> no monitor table was present initially - we'd create one for the new
> mode without updating old_mode. Correct this two ways, each of which

I think you mean "Correct this in two ways" ?

> would be sufficient on its own: Once by adding "else" to the second of
> the involved if()s in the function, and then by setting the correct
> initial mode for HVM domains in shadow_vcpu_init().
>
> Further use the same predicate (paging_mode_external()) consistently
> when dealing with shadow mode init/update/cleanup, rather than a mix of
> is_hvm_vcpu() (init), is_hvm_domain() (update), and
> paging_mode_external() (cleanup).
>
> Finally drop a redundant is_hvm_domain() from inside the bigger if()
> (which is being converted to paging_mode_external()) in
> sh_update_paging_modes().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -129,8 +129,8 @@ void shadow_vcpu_init(struct vcpu *v)
>      }
>  #endif
>  
> -    v->arch.paging.mode = is_hvm_vcpu(v) ?
> -                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
> +    v->arch.paging.mode = paging_mode_external(v->domain) ?
> +                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 2) :
>                            &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);

As you're changing this, reposition the ? and : to the start of the
following lines?

But, is 2-level mode actually right?  It's better than 3 certainly, and
is what sh_update_paging_modes() selects, but isn't that only right for
the IDENT_PT case?

~Andrew

