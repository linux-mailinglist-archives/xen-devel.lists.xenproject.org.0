Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D272011B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543101.847746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53X0-0003Qo-Rr; Fri, 02 Jun 2023 12:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543101.847746; Fri, 02 Jun 2023 12:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53X0-0003NT-OQ; Fri, 02 Jun 2023 12:05:22 +0000
Received: by outflank-mailman (input) for mailman id 543101;
 Fri, 02 Jun 2023 12:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q53Wz-0003NN-0m
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:05:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bccabee3-013d-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 14:05:18 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 08:05:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6392.namprd03.prod.outlook.com (2603:10b6:a03:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 12:05:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 12:05:12 +0000
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
X-Inumbo-ID: bccabee3-013d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685707518;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jj9rb6+/L5r6/dNVZL5zGq7b9WCBG6unxpdPWhg1GxU=;
  b=LqNLbPuwgJXhOoMjfHvAKbXMCFGhqTUwLi03Hcb4Ulgt3Xb+Tdtd4DX0
   tFg3gHmKbagaeWTo777KI+egBAe0XsguBOt42Tlxpe1F8bAK4ymXoXSuW
   ukHG0+7PTSLZXewkj48/87S9c3ToCV+MKPywTvk5KE7440T+ravprwRXH
   A=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 111769551
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/pdS067UV1esl+JMbqKX6wxRtPjGchMFZxGqfqrLsTDasY5as4F+v
 mFOXTjQb6nZYGv3eIwka43n8k5Tu8PWzIdhTQJrqHxjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 tgJEBNScjS6lsnnnbWJTc1xpMQ5BZy+VG8fkikIITDxK98DGcyGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0ooj+OF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLTeLmp6M32TV/wERQCgRNFl3jm8O80HCmQvVGL
 09E9iox+P1aGEuDC4OVsweDiHeAsxwVXdZKFKsk4QWJx6jTyw2dAXUICDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LD6qdntDzXzbqz
 Fi3QDMWgrwSiYsOyP+99FWf3za0/MGWFUgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:akYXw67cKMJh6z8YMAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:6sj6mWHxppfYqJgsqmJY0F8sOZ85VkTM5yaNJH2/LXtLSKe8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AZqaHFA8UjGvdIW3QKgp0/1yQf4Rq+v/tDhg3q5B?=
 =?us-ascii?q?chdGdEjV0OGeRjCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,212,1681185600"; 
   d="scan'208";a="111769551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXe+IfKVe41ZZBX7PLUcMNGny3slxOfUR1xYtGkaaHxZFK+JKzelk84aJwAGxUj4bGyFW7+eSfL4sp9sUXT+SmBuO2XuxedYWDplPCR09KYaowt0WN6fDMQM5q1RzZ37jEGw1/SAquDFtZxRm+clfGc+x5KRY/hpitvc6E8lD52+hEWvIxhhGf9woSSb0fXPvtzJzLUDH6qun4MspFXXSFKCrkVPyMAA4WgUII7rzHpk8DkKfK39YgiXNtu7nAVvPrmvnY2+e+PylpsLUxG1PVhXNphOorMsOGshjvtJj26i/CJDAbCaKkJ4LunPo9tvKOnWKB+BEPrkGYuEHtIMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DglTLmptBa2u8gwTawjsj4jHugysRSZelzptKC/fCvM=;
 b=CMk3i2HyHeqXLapJTX7rSJHzOZ+7lTDmwQyXXeMkcfVRCFHC8E1LTdEBnK+/KIXvhRuST4z+BdhNraeBI5F0W4kTp16b0MR6njSH8hbubGrSYFXsatt8lFNv577H1D+mL13CTX8xP4IiHrfhgFMQ0s/FUY1Q7GGc0L8DIBLAdvlF06S69s85lqqJZ2e6/RoIR+2LhZgAG7sD1rzqTpmlMQpQzjRiOS0LyAw1eLqYLIH2KnPM0Xuz6qeykEXYShj84JBDedgbREh4/bAdck0Iemyymvmh0RYh5yOzFKnbgW9cfth8Wu1jS4SGedTiAJisiOCx7Dt+Tw7hUJFlY3VdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DglTLmptBa2u8gwTawjsj4jHugysRSZelzptKC/fCvM=;
 b=NfcXAeYMJELiKToNJyyu1SdngXx9hnhnan3W2AexaGqNuMqBBrUStkuKd8HHCSPMwCreHK8KFsclSDZ9VI+Mqx+AjwIoOKRh+XxJZ5DL6ISx1WN16yQm6SQUI0LeLQ360wrX1Za1qeS6RN9PTf8wrUlK9xV+fYA/AgCZDNuzUkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5cf73b1-4ea6-bbe1-5935-eae6831747fe@citrix.com>
Date: Fri, 2 Jun 2023 13:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f527aa-c9c0-424e-95e1-08db63619e53
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g2mNNcP7N2LlLvV72tgSTgXIXH9b4hwlAwvjWnUFBoSXvwKRLdGVBmWRVyzSzhRArb5WdvSEtJKezESnMq9DnRlOG+EKVJs31camEHkx22XpyOu3NACwGwd1VGXa43Vv8NIWNg0OUiz0VxUUAa1m1ayS8vjqRAxgzHBjfSVbfEJC7lwWry+ZTsgUV0l6CbcgIwEDBAmJZm+8GBic7+3z1jUaXa+g38CKKmau109N+oNTJWLmhItgMtpR8djDvR/ZE+P10PlQT7xbCwibaH4Z6cgJ8amMeDlgfPu28bXkqp7z5wp50klXVKjMZOBXThgTHqbYXOZxI0pyqCNvWlogqGqPQlP6hBu5otWWWfNDs9SjNzawd/9rK5wLE0LNE8HEGDfe9Lth1S4LwIdwF2kui7fKBtRgSStdw/Lgreyb2z1LxgQGO068gZqu8tyG1O64JPZSQIMdOH27LxhizZoZVRTgnEMzCgOCNIeunkKc1xK963Tktkdht7KsIeqEGrazIzsP++7bIXiHzg5dLn7uR8A/vzvV58R2aNw6tTQ938CQwCfFjMOOKq0wkVHi61cRTr+NVkAp3NlRmVjV0z7yY+X+v5MRsKwX7zW4bnilnToVm8NDxngEf4e7nAtMh+BkHq7kNyBfuMkLyHRIYNBNdBmqEGU6JXmMRZLUtIBVW0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(110136005)(54906003)(26005)(6506007)(83380400001)(2616005)(316002)(66946007)(2906002)(31696002)(82960400001)(478600001)(4326008)(31686004)(66556008)(6512007)(66476007)(86362001)(186003)(6666004)(41300700001)(5660300002)(6486002)(38100700002)(8676002)(36756003)(53546011)(8936002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9JZjVBTUpNMWZ0em83ZlhLR2ZJME0ydDk5ZGVRWWVqWGlWdlFXZnhMVC93?=
 =?utf-8?B?YVRBaGVyd2VrN1RNRDVSZ2c4b3JjTEZISFNjL2JHVlE0ZThYVlV2c2FxVGNS?=
 =?utf-8?B?Ty9GbXVkYlFYYm0vOFlJNXdZMGxvRHRuU1FIbnZOTStuYzI5c1k4Q3ZNSHVJ?=
 =?utf-8?B?RmNlRXdCQWJRS2l1Y0dzZGo0bit6ODRlZExXV1N4VVNnRENUakFSRFI3dWpm?=
 =?utf-8?B?dHR5WjArRkExOVhvUGVpU1E2MmRJMmNlcFRPdHVKeTFnK0JCS3hnTEJVc0tI?=
 =?utf-8?B?WHdNQnRQU291QmJ0WE8reWE3emtNUkxBQkU4Zkh2cUVLZXdZaGhJVmFwWnVh?=
 =?utf-8?B?OXRUbjdHWmEzTWRCSUhaM25jS3laakpHbGs0UW9lQUJPY2dZeXl6bDhldWVu?=
 =?utf-8?B?UGJqdGxNa05HNFhucFlIaE51NmorcmNvK0VpcGNTOXpVMDhHZGYvem8yb1Zz?=
 =?utf-8?B?alZRS1BkQ0NhVDcwNHdQTVR4Ly9SZTVjbzIrZmIwZjRxZnBVdHpXWms0UkRO?=
 =?utf-8?B?NjBNM25YeDdnR1p3eFhXVUJMTHRncW5OOUZtY2ZLVks3b3lvVHZtOUx6SUZy?=
 =?utf-8?B?cTNId2hTRmJsYUxhVEF2RnBtd29GN0IxNFpPN1ZtMHdLMlZualc5MG0xcVZm?=
 =?utf-8?B?QlBXUlZydkg2ZVFBVm5GSlJtOWZOZ0RSd2FVRVpaS2JCUU1OWE5oeWdSR3F2?=
 =?utf-8?B?S0RsS2l0ZlZiVEJmd0c2bjZJOWgvbHBkNXdaMDQzNE9qb29kWTBIL3E1V1B0?=
 =?utf-8?B?ZExoTk9mVGFkREhsSXpyMW8wNStjTlN1UVdqOFNWK25Zck5keERTOHZpejAr?=
 =?utf-8?B?Zk15aDNYMSs1RDkvSXVHSUZzRXcxd0wyWmNCUjVJL2lBQ08ybzhFQUJUWVFN?=
 =?utf-8?B?VGpuZ0cyMENMOWJqK1ZwUktWVWZ2SVc5c01JT3lvYTd2WFQzSWpWQ2ZIYkF2?=
 =?utf-8?B?aFlnZThRVTdPUE85enM0bHBMWjV3SU1ndzQ2VjZOYWhHcEt1OGZhM0ZjK2JX?=
 =?utf-8?B?WUFVR3E4WjltZzNyazNjS3crVGM0aHhWVVBDSHRJK2NMZHZrRE94NFAyTmx6?=
 =?utf-8?B?UXFwRXkxREZpTmhvcWNUcTNVdFFtWDF3YlRFR2pjZjJBWjd0b0Mwc2JpYWhS?=
 =?utf-8?B?UGZPTkE4RVB6U1kzK3Fkc2VyMkFzNE4xZ0hhREh2SUQ1b1E5MzF4WTNTL1B4?=
 =?utf-8?B?blliakh1Y0xDZWN1dzl4d1FqN0laQ1o3ajJ6MzY5aFBaOTFQeW9iRnJkN3p4?=
 =?utf-8?B?TitWakNlRkxISXNacVJtdXAydUZCYmJrUUpKN1VvOVk1alRGMHNtUEJUanVt?=
 =?utf-8?B?aGk3cW5id3JoNkdEZkVQTzRVSmJPVTJJRXM3R0Q3a2xyL0hJMERLK29rUXNq?=
 =?utf-8?B?Q3RkR08zT0FFdEhpMlVrazZSaVF5NTQ0TlgrMjNuV3ZKZ3pXOWtpTjMxajdv?=
 =?utf-8?B?V0ZIRWNUOFZ6VVA0eXNnNzh4VDVBWFBuenZMcHkvOUtMYzM3TXJHaW1iN25N?=
 =?utf-8?B?eWx6SFVweGlSRldDQ2FoT2FnWStTUkgvMnM5TDkxb3duaUVUVHIxNjZ5Um9i?=
 =?utf-8?B?UzRXZFpoNy9CWTFyVHo3M3BtKyt6eTBaNmcrcjVlWWtQeU5Hc00xa2I3NDVP?=
 =?utf-8?B?MG45NTQ5SDhjdHFFOUNhYlEzVGxtdTF3a0RlVWF1Ny8wLzBBSldFSUh6cDZy?=
 =?utf-8?B?WXExZmsyZUg4OEhqL1JtcUFNUWVoQ0RWbmtYeGVkbFdrREMyb1huSkMxYXJs?=
 =?utf-8?B?a2V6Q2dWR1dEVkI3T0tHcmRFRTB1Zk1Kb2xXUUdNVHhpYU1IN0RpU1BlWFpP?=
 =?utf-8?B?ZVR4dng3b2dHcWpuNDQrOEZsWFNYQTQ4MXA1NTB2dXpqalRXdEFKWDBjdno2?=
 =?utf-8?B?WmdSQ2RiTkRxQ2R0cTZ2cEJ5NHhKS002bzlVR1l0ZUZnei82VndWczBYY2Fw?=
 =?utf-8?B?YzBSYytiNFVXNzBzVENKY2hsQjg3ZEFyU0xCNkVJZzZzR2h6dDZMQTlTeU5B?=
 =?utf-8?B?dDlkUzVNcUFzS2IyYzBxWWJmWCsrdjNXa0FhZUNnNE8wZWZGdnFpd2xoTnNl?=
 =?utf-8?B?azd2NGJIMUxvN2RBWjdzUjN1R24wNWd0dEE3bkhVMzNoclQ0RGVZdEwwU01l?=
 =?utf-8?B?Z2VOTlBxeXQxZjhzQXBMcFRVdU55aTdyMlJXRTBlaitqbEdxa1pzZ1Y3WUg0?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A860rJqSM/UZGMQAP/uxTv37p5pGCWqraOO+2nchUgyB03NJli9LBFzbFmaqU6DVK77RJx5j78bs40VFAsPfPqqz7PhTDQac7U+OEy5XcKksiLWYWP3uyolfTK8r2AoZK0+kGVkeTLxsinMAHWV8CVWqJYzdlwUlIFOo93v7cbhTUDbSiHgGh+lKyl0wk4Cs13UmQUIL88JFrLoWWx5k8JugRgpEOT2Oj9o/UALIDbgSsBSvii65orOcAOM2x4iscTcOABG/CGj+/RllJinAGUvVPfeNjwfb2pMkQWD9tG6j3Nyi1TxQjMiru6BsHDk1zb2CWw7axMLDfz6O17Ld3lFjlYJh64bVzMCJ/hFr3bnohM/DSZDRBrdOnRvWwct5IOW5uOo/6X5kooZ94uDbgdQyiR23E9+FVPr5nQHaYgOURHkFCJ00FYkr3sh3nH8dFn6QKa1Rc5IjeHNqplz2iRuTkU1Lkz7n+5f7tV3TFYvH+q1VoPpoJdWCDEQib1dZQd9RmGbqpeYvmvycV55Y4Y/IiGV/8+lxqJQaJMpSQCtu2g39nQ6hWxkPulwyvtnS7wgviLb4SHv+o5pIf5TnLRvX0BXbPWSNo2C2d3xavEsY2PmnZMbpvDP53Bom6f4YzRdEp1nb563l1ylqffWjKz+/lkrZW41Pwtc1JamxD2v8Ghr/yA/j9b4Iv67ng776kPMk7nR0O/eawlUT2KvDf5sJvb8OEEL9Q7BYumTXnhBZl6dpbOVCKi7/xOocoDCbXqvUFe5Rp0g4Dn+AwC2kyqM/gFTFwb4CNBFc8UcE5u2MHPT/eCbwhdIL9KfvOowC4ulhDjVE9kYUAfTz6wJYStY9euW/+tMx0G45KJ5YTUw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f527aa-c9c0-424e-95e1-08db63619e53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:05:12.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0RukbfD7Q5UbKHwk9aD883LS6qCvq0uIcM5Z2PVjLd3/x8nOhTQBICz1iWFMONUSTYFFeu8z1heQmgWkkuZ3q1vHysa3eqvrsdiV9WRtm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6392

On 01/06/2023 6:43 pm, Alejandro Vallejo wrote:
> This allows replacing many instances of runtime checks with folded
> constants. The patch asserts support for the NX bit in PTEs at boot time
> and if so short-circuits cpu_has_nx to 1. This has several knock-on effects
> that improve codegen:
>   * _PAGE_NX matches _PAGE_NX_BIT, optimising the macro to a constant.
>   * Many PAGE_HYPERVISOR_X are also folded into constants
>   * A few if ( cpu_has_nx ) statements are optimised out
>
> We save 2.5KiB off the text section and remove the runtime dependency for
> applying NX, which hardens our security posture. The config option defaults
> to OFF for compatibility with previous behaviour.

While this is all true, I'd say it's not emphasising the correct point.

Right now, any attacker with a partial write primitive who can clear the
NX feature bit in boot_cpu_info will cause Xen to unintentionally write
insecure PTEs.  (Or for that matter, a memory corruption bug in Xen.)

NX exists on all 64bit CPUs other than early Pentium 4's, and people who
don't care about those CPUs can meaningfully improve their security
defence-in-depth by enabling this option.

The fact we also save 2.5k of code is a nice bonus, but not relevant. 
People aren't going to turn this option on to save code - they're going
to turn it on for the extra security.  It's fine to mention, but the
code gen improvements should be one sentence max, not the majority of
the commit message.

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/Kconfig                  | 10 ++++++++++
>  xen/arch/x86/boot/head.S              | 19 ++++++++++++++++---
>  xen/arch/x86/boot/trampoline.S        |  3 ++-
>  xen/arch/x86/efi/efi-boot.h           |  9 +++++++++
>  xen/arch/x86/include/asm/cpufeature.h |  3 ++-
>  5 files changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 406445a358..0983915372 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -307,6 +307,16 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
>  
> +config REQUIRE_NX_BIT
> +	def_bool n
> +	prompt "Require NX bit support"
> +	---help---
> +	  Makes Xen require NX bit support on page table entries. This
> +	  allows the resulting code to have folded constants where
> +	  otherwise branches are required, yielding a smaller binary as a
> +	  result. Requiring NX trades compatibility with older CPUs for
> +	  improvements in speed and code size.

The intended audience here is different.  x86 developers will know what
this means from the name alone, and won't read the help.  It's distro
packagers and end users who need to be able to read this and decide
whether to turn it on or not.  Therefore, it needs to read something
more like this:

No-eXecute (also called XD "eXecute Disable" and DEP "Data Execution
Prevention") is a security feature designed originally to combat buffer
overflow attacks by marking regions of memory which the CPU must not
interpret as instructions.

The NX feature exists in almost 64bit capable CPUs, except XXX [TBC - we
might be extremely lucky here.  Questions pending with people].

Enabling this option will improve Xen's security by removing cases where
Xen could be tricked into thinking that the feature was unavailable. 
However, if enabled, Xen will no longer boot on any CPU which is lacking
NX support.

> +
>  endmenu
>  
>  source "common/Kconfig"
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 09bebf8635..8414266281 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -123,6 +123,7 @@ multiboot2_header:
>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> +.Lno_nx_bit_msg: .asciz "ERR: Not an NX-bit capable CPU!"
>  
>          .section .init.data, "aw", @progbits
>          .align 4
> @@ -151,6 +152,11 @@ not_multiboot:
>  .Lnot_aligned:
>          add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
>          jmp     .Lget_vtb
> +#if IS_ENABLED(CONFIG_REQUIRE_NX_BIT)

This doesn't need to be IS_ENABLED().  #if will DTRT for a non-existent
symbol by considering such to be 0.

IS_ENABLED() is only required for cases where you need an explicit 0 or
1 at the end, which is typically only in real C code, and for
initialising of constants.

> +no_nx_bit:
> +        add     $sym_offs(.Lno_nx_bit_msg),%esi   # Error message

The "# Error message" is useless as a comment.  Don't propagate it from
the other bad examples.

(I already had some cleanup planned here from Roger's patch adding
not_aligned.)

~Andrew

