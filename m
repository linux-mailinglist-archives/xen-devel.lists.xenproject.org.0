Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E371681A201
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658134.1027188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyJP-0004Hf-Du; Wed, 20 Dec 2023 15:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658134.1027188; Wed, 20 Dec 2023 15:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyJP-0004Et-AL; Wed, 20 Dec 2023 15:16:43 +0000
Received: by outflank-mailman (input) for mailman id 658134;
 Wed, 20 Dec 2023 15:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRba=H7=oracle.com=steven.sistare@srs-se1.protection.inumbo.net>)
 id 1rFyJN-0004En-Lp
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 15:16:41 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5b695b2-9f4a-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 16:16:40 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BKDxBqS032707; Wed, 20 Dec 2023 15:15:53 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v12p48s8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Dec 2023 15:15:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3BKEWpX8022325; Wed, 20 Dec 2023 15:15:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3v12b8wnp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Dec 2023 15:15:51 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by PH7PR10MB5830.namprd10.prod.outlook.com (2603:10b6:510:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 15:15:48 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::d609:b162:ba7c:4e96]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::d609:b162:ba7c:4e96%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 15:15:48 +0000
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
X-Inumbo-ID: c5b695b2-9f4a-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=rO0bjcNUvu0X4fhCXYG3Kn4mXdmlpL3Fu9nqhDgTOR4=;
 b=ktFn9fgv0JDP6L7z5rIra75uQl+choMYVlwjgWSIPP9Ibeh1BXZ0jZlwc4B2AB1QAdmr
 WAEcnDKE75juyhFa8YAlI01nirSqYU938WqAzuItbnzORpjqmFEa9flYTAIgxAtkuqlH
 S6fNM9F4xBl4TIsjWDn9hRve0lHZDb/RFpciIO2irpsaA85x4vr7TQQDb1pf/fmoHKTO
 iHLE8hp6xonoXcupZaOnUkox/Wgx8pL99P+FbxZIqCnkcuvFEyAfzT1IR5+O6qheVy3H
 ZB3ZxHXQviKd0dt6hLNIKPSEk8HIlvi/8rduyXBKGd1OyR9SCp7v+C9jqflWfyaD+XwW uw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNQidqn76BTAN6Y2VRxc+Er8eiORIf8p1P6wQyIhLa1mGTpmMnd4ZcLLEIxh5NRQ2LsGFJLrHTteM0p3sXU5IxJAr4MdIQU3F0h6SEndY1yQ2QUBJ+8CVACfGFjPbFfpxF+TyjS7VZoefxvy2VZgDntSB0TAwlY5vuHfoYXnEawkQ2B/zQvFNNlMySgWLTHEJo+SsyJPx+C1My1kTkXEy30+iBs9YekYyj3czQTBOZUc6f7FWGfbmxMWNMycmRka2ZRe/mqlbs1SosiP8yj+lVJhuRrqEvAATAXeIP2P+MM5TWDfv3akkB1hptiodb6N/NNVlx2Bbp7SNGz+tL6vDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO0bjcNUvu0X4fhCXYG3Kn4mXdmlpL3Fu9nqhDgTOR4=;
 b=Qaa7JA6GQsjW9naQp5Rk+LuOFn7qdfqNBAT0v6xmcbUZ/jWzhFE3k5/k4POkhdEV0NSNWVi6S+by1q0duIz9PMTb16I2X/hl8vYpOSUeS+BhbxOqCCjeOYNnItc7wwDUaU1R00ny56+iNkKBw9YPgwwMgypNDIuK3H+o2Rusjnnx+MmYF4HTww6bQofMSn6nPoCnmkh1Puo6d8x6EQZ2cs/nXHgSC7anHDwXPFks71FIAc5X31odaAucGALuLIY8sBf2U7zIGIz2L3CoHi1qRSKl1vkp+6xoQEIhVfVMX6uw42JVEmsTDa5NgcKTvxGq8EY1u7TJcDqkdtaVgvHhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO0bjcNUvu0X4fhCXYG3Kn4mXdmlpL3Fu9nqhDgTOR4=;
 b=TZfk/5SiQv/moAQz8XcBhLBNSX0+QbyFwX72GfroT1sXLMKO8j3xWk7Vd2XD1Lr9UERi6EwcALngxpeb9e5Bh5uggOP1giyBGelvLrgqUZDie1Vzq7y8qJKYm5tc2CIm1WFMZc8w0wHTgMcyCSmfrmgMgNU7X5l0PvsfFUdfqRs=
Message-ID: <f4497a5a-cb84-4c0a-8e45-567d53f45fe1@oracle.com>
Date: Wed, 20 Dec 2023 10:15:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 00/12] fix migration of suspended runstate
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Fabiano Rosas <farosas@suse.de>, Leonardo Bras <leobras@redhat.com>,
        qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Gerd Hoffmann
 <kraxel@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Laurent Vivier <lvivier@redhat.com>, xen-devel@lists.xenproject.org
References: <1702481421-375368-1-git-send-email-steven.sistare@oracle.com>
 <a9ddc1b2-d4fc-44de-857b-2aeb35fa0925@oracle.com> <ZX_VS_KDsoiL9T2X@x1n>
 <04583cf1-8172-49be-81b0-adb88d6f9808@perard>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <04583cf1-8172-49be-81b0-adb88d6f9808@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|PH7PR10MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dee6d6-1b70-49c2-c06c-08dc016e8bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hr85CEYbfGHxclv/2G7XR/SHodh1AYwGZB5Ry9j8RmheauaNdpfFc8puPVqnDNgUekpKNjl3zI3eaayJoBiJEgFSArH74RlxomOf8n1syDPdWQftg9lzbvffiGVOBOAmSgzRX/busY9V86XCO8bM0f5JLCp7EgrBsxNRkZgi7QJXJLvx0N4ckWe3NfQy9tCkXEurcSh4SvgXFV155XOOjr13KM9kSZoRHBb+0mJiMSMYaaJXd99yJk0AW54gJORrvlc/HBP0USo9yq7h+oue2mNeE4ONURkjz1Jy0WooAoKcEDLUo5jKp9QWpEthobyx3JZrpT4Jsx9EsSGW7r3bHbRC8jVmHOunAsQ7FhldQ3g3CFQbhDBCo+0bZ9GdPhhp2JsOzIxVDSukdxZ/3pVSSpV6/mM2UnYr71urNUv3b6bEa+MEqm6XBHSIcNB0YmX2ruqS32jxh4Qhw8WKm3kxoJI869zd/rxHI98i8wHgOohk9MYx+DUC2QZ3CU60vkbyqUT88A3e1idMyAugUZEYvTbGnaRGum+/I0QLBO/fEmdHcieCoMSkuiKGbWbW4kYDeH6G12qnq9ZVe7Wn1jlSvKWhFcVRsgjUbrRxP+GALo6ULQ7eFpUdi0AwL+Pf3AR+o5vVxfOdmrSc7Mu4ih2gXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4684.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(5660300002)(4326008)(8936002)(66946007)(44832011)(2906002)(7416002)(478600001)(86362001)(38100700002)(6486002)(36756003)(2616005)(41300700001)(53546011)(36916002)(26005)(6512007)(6506007)(6666004)(66556008)(316002)(66476007)(54906003)(31696002)(4744005)(110136005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2JiVXlPT2E0TUNwWnZlYWVWN2RYUFFIKytUdUFBR0lHNElNcUdSV21mckd3?=
 =?utf-8?B?dlcwL29oYStRYnhWVVh5RDJrdG9XYVY5cU5aSFJJWFJ6aHNiY1c4NUxHR0dC?=
 =?utf-8?B?MkxwYW14eDVVcTI4a3M3T00zVkt4NmJTZXkrWUd2TFlFSmJMYTBuRUU2REZR?=
 =?utf-8?B?bTlDa3FBbjc2TlJzM0Rnb2lINXg5S3dqK3h2blZhTjhvNXI4bllGb3ZPYXlL?=
 =?utf-8?B?U3ZibUN3dU00UFhQOFIyLzZ4MGlrMllrdWh2bStGdlVoYUV5dmorejlPdTA5?=
 =?utf-8?B?bnRtTTNzcXlhQzltbnlhZlZFS2RnWGhocDIybVB4Z1pVRml0T2FtdURHN1Ry?=
 =?utf-8?B?Z28yT0EzcVVEMnM5UUNZZnZoUXBpM25FOVgvaStSNkkzc2Y5SGpBTmJCYUZP?=
 =?utf-8?B?OVphYUExRkFVZUtMWTRXS2JmSnRqSXJKS3lUbUM0NUgwN1VMY2xseEVUVlcr?=
 =?utf-8?B?YW9IM2tjZ2RYMW5sSDIzQ24zdUZ5RzUxUCs0SUM1ei91aUpOZ2pTVEI0R0RG?=
 =?utf-8?B?NS9qcUxEZDJGcTNUaHUyMWVaUkV4OC9VdWZZaWVpaEdmejNhUjFwVkZwQWJE?=
 =?utf-8?B?YkxnRXJBVUttdWhUWXJlRUlITDA4aE1DOEROZUkzNmcvWFNWYUxYSEhUUTQz?=
 =?utf-8?B?TlhlZnlEYlY2c0MvcVBtR1l2K0FOS1E0YmRPZ2JaNE1tMlpCZ0tCdUF2WkRl?=
 =?utf-8?B?ZVpTZVhOY0JleUtIQW0yL1hBK2FvdDdRWTB4aVlxODhuY1pOaDYzQ1FRL0lH?=
 =?utf-8?B?N083cjBSbFc5NjJDRGU3TXNlUkxTSWxRdHJ3TXB5MXBuMllLeG50WTBxdkJC?=
 =?utf-8?B?RzNqVnVMNVB0UHlacXZuOHBLcjJpbUJ3ZGRxWW1Ubk9JdzFrMkEyUU10V3lN?=
 =?utf-8?B?Yzh6RkdvSkFpd1Q3djZ6enpJd3ZxY2I2RTFYdXVpd0hlTDBJZHhWbUg4ZFlV?=
 =?utf-8?B?Y29UaWk3VVkwUlJUWUJMSVBvRXJ1clh1MTEwQ3FJUHJXTGJTbVhGeGRnSCtx?=
 =?utf-8?B?VkhWeDVuYmo1MnIvRm04SmtIVk90NktrQnk4dTQwT2piVThFaTdWbkxkbnlO?=
 =?utf-8?B?c1hSOUlNTkM4TG4rN3NOMnJvUUJxUHJCejNVMmsxb1hVWHJKZ3RrNHdLZ2hM?=
 =?utf-8?B?dFV3OHB0dHhUbzViZHNHQ3dIeFpLSDBMd3hFdU1DejcyN0JJYk83MVdWMXNx?=
 =?utf-8?B?bGg1RE42c0g5Wm1hcmJ0WHVMdEwxSml2bkhvWisrMFBqZnN3MWZaenNmQnU5?=
 =?utf-8?B?V1dwNWdvZW1YaDVWVjB3K3BJMkZ0Z0NGKy94ck1QZGF2aGJFUDhibzdiaThG?=
 =?utf-8?B?Q3Rwam1HSHM3U0lWMzFHd3REN1UzMjhBQk1CQ0d5VEFVa1hsUk03aXdlSkdh?=
 =?utf-8?B?WE5nM1ZESldjSnlWUElRN2hnZE9ZK2RaZXZPQ2N4MHNXZlFQbjVFUXRaQzJl?=
 =?utf-8?B?MjVhYXJub3I0RldyUWpNWmxQMTFJb1lIU0V4b0RES1ZTY1ZkNDh6NVdBVEJW?=
 =?utf-8?B?TWdvSC9oY05FTHpOcTRzV2NNTitEeEU0aW5HWitnajZHSE9kcUc2OGZpaXl2?=
 =?utf-8?B?VGx2ZnFLcENGZXhFK0RQUlJYamxPaUwrS282VkpJSmZXc01ISVFaNENlWVBG?=
 =?utf-8?B?OFN1dHovN3YyN2dNMUV1ZjJCcDdlRzdRWjFDNXk3T1h0TWdJODB1Mm1ERXgv?=
 =?utf-8?B?ZU9tRWdWbXIwaVZEUmhCZm1sZmdjbFExSkVhVWlxTmNKemdBMUhWQTRhMWU2?=
 =?utf-8?B?WEJUZFN5eUNUd1BISURSSitWeGlyVlp2Y3hnTU02YUozOWJVRnptaFFxalVz?=
 =?utf-8?B?cHA2M3ZkTnVkdHZWWWRIdlZFMnYxNUxxaU1MZHZ6dXFWZjhSeUM3eDg4T0xZ?=
 =?utf-8?B?QzY0SjZYOVpPbER1N3QzS213M2RBdHVCODlLS2JacHNzN0l0NGhlTHVxZzJX?=
 =?utf-8?B?ZkFiWW9BcXVha2NOTzB0cXhpTHJrWmpPYnliamF0UkZKV1JrOXljdWRUYjI4?=
 =?utf-8?B?MzZRWVZtbVhUK3VYZG5vTGE2QkhNNUVQVDI2NXhkN0RRdWxuY0ZtNmZlaklW?=
 =?utf-8?B?TkIwNjZXbFAvelNnQzJiUXExR0hQdllvcW1BdGFhTC9pNVNXRkdlWnBOWGEx?=
 =?utf-8?B?MzV4ZnJOSjVvUzBFL1JLeG4yYmpYSTZSU0IrWWQwZWpWcG00d0ZqbHI1VTY3?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	f8T1z/ZKXc2VF7sm34iA3KsWrsm8Q+b5WeM8uk4oJUs7A3BubSuizk1z5SgALhuYHxWmQG3EkL+aS6pymDD8sYuxvZgC10vSseUjimdJfYnOcaXqoduNC3CUq51Hz65NvhQ5h0++WMTnjlyvgqJL3BZwxcMlwuXoa6yD9AsnWYPK2BZP3DMIMquRMDl5VAUfNHJJ60kOHjmhwYKfyabPzXoAOQACRtr1qWVOLpY+rDYcZHv+oSxhW5l3GaXuWyLMP4tVKCQ0BCA84p/KytAWreAQuf+0HGR5usSMgKLS6QLE6Ra7iYPmVSTYaWGkKw/R/x5qtxjWTD1eYmz2IAgvceitbxVkQxbrnX/8vwIzY8IwnQPCTMakefUCthzPrOF3m6gJbLXNd2Hy0b0NS+avdZDhsHIT8Mu8W+I3U8ZAu9GmPjoI/taPApyqtrRAwQ+wcsMnog4N8rXn/vm0Z1aNW4ydjN9GeE78nkGVkDhqOiZVwp2sKv2sTk71v3orNgakMPA7HV1pE9mPWoBbMU8a9DalINprTL7JX+jCPv5vgL3cnJfH3m3/Dzj5TiDotIa5UxmrX6DLpQlmt193LDXC6+4FI4C85QJ0snMJwJ8Revk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dee6d6-1b70-49c2-c06c-08dc016e8bae
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 15:15:48.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heFhPV4BF0VnP8jNtMrkBuWge3nR11+b/wXy/Sw5gcD/qiCgXw9aZTDM4b9tvJRhbD/eVPgXEi7i+G8U8wMjf8GTEqWrqXO++eHjpeNHwxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-20_09,2023-12-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312200109
X-Proofpoint-GUID: 1D9z49OOA-J1uSB78w3Fdm6J63CgD6ss
X-Proofpoint-ORIG-GUID: 1D9z49OOA-J1uSB78w3Fdm6J63CgD6ss

On 12/20/2023 9:52 AM, Anthony PERARD wrote:
> On Mon, Dec 18, 2023 at 01:14:51PM +0800, Peter Xu wrote:
>> On Wed, Dec 13, 2023 at 10:35:33AM -0500, Steven Sistare wrote:
>>> Hi Peter, all have RB's, with all i's dotted and t's crossed - steve
>>
>> Yes this seems to be more migration related so maybe good candidate for a
>> pull from migration submodule.
>>
>> But since this is still solving a generic issue, I'm copying a few more
>> people from get_maintainers.pl that this series touches, just in case
>> they'll have something to say before dev cycle starts.
> 
> I did a quick smoke test of migrating a Xen guest. It works fine for me.

Thanks very much, I appreciate it - steve

