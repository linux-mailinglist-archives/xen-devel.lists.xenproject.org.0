Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84C66246A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473540.734205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqXJ-0005Bb-52; Mon, 09 Jan 2023 11:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473540.734205; Mon, 09 Jan 2023 11:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqXJ-00058n-2N; Mon, 09 Jan 2023 11:41:53 +0000
Received: by outflank-mailman (input) for mailman id 473540;
 Mon, 09 Jan 2023 11:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEqXH-00058h-Hv
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:41:51 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2052.outbound.protection.outlook.com [40.107.103.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b0dc2f1-9012-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 12:41:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7143.eurprd04.prod.outlook.com (2603:10a6:20b:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:41:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:41:48 +0000
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
X-Inumbo-ID: 9b0dc2f1-9012-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPaYxXm471tiT+NlC/PqDcVZ4B/n9IoQmquFif2yYGhkcEqxT8JEdlQjxG695tpsfp1BwxpKTd/9sT/1UliBX01SBAHKXn5s/NF6zuOBFcRd0/wRNHtZRHQLccXBzf9e9CP7TF2QUPUdPzRl6ONdi/H7mx8zDKVIW09xJpKa8A9DnFJASaoShQDfdqt6QJM/+Q/kvKsvhVkM/5IiZ0Ne5avQYWDnE3v0SvKwAduMqzhAOpsurlZygszHDVCE4cW/t0qA4cH++nO/M0hxKaY+eke97kEQDVd7qqZfbcFY3W0m1FjFhX5wX+4HdI5/o/uCV9nIIUWIqtMk6F/3Dx3X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60wc/vwFvoq+aOfiArChDicj2kOicqX9zYbvV3rdDSQ=;
 b=Ws1F3wXP2F5oHCYRWD76Xn05vww4AO6TsE9scpoY/9LIqI0dvXiwKV/LJIm9GX4IQnwNsudSOx+iLg2PdJNGuGlreqxZ6v0zP6xIqECN/WcytVsCjQf6CPfHDHpnczfncvDRkWklbtdESXRN2ZxJppIyqZVJp/tndsreblVi4Zbepxs2Tg27yaqsnXsOMKI3MbI5br4xo30Lg/hHPnGo/COFAArbGmveKUSCDsYMO5JF54fl+vvNMRF9mKYkFEqY3Um87WvzROOQX76DQ6Nq9eeO6gZBk4OtQG++8qHeEk3xPED3+l1jnTsiiD0O5rBk8edbaZfG9uRjoHwbzwgl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60wc/vwFvoq+aOfiArChDicj2kOicqX9zYbvV3rdDSQ=;
 b=mjMeHYn/NggfvIBewv3bqrSwKJ93h9t3cHg1Z5VVeeB5+1wrkIRDyA1uzj8SKW1hQ6PkRff+STgAnk6Jgo+f63PhzL4CqAnBglimL3yLE0h9OOLzQtd4G/XXE4C58ugQWeAKiF2nPV7z9qY8W4oVFR547Rx7+RRPzjhrJs8Lm4cPoBvokzeGShJKXljeGWslmBJsj9aLrY601gk+KwjBDi7zjMsqPN7ZbqSn9qD+T0gxkHZnXSwt5ZoyIVS3IpQPjn/noeRWfthuFSJ1MiTInuAKowgT7OEFsoEvJDD5X3QgT3Wuvv+jIYlFXOZaApI3JNR8pgNaAmnn8yXWaB8cOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af7610a2-11d6-48e2-6bf0-762525187612@suse.com>
Date: Mon, 9 Jan 2023 12:41:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230106104108.14740-1-luca.fancellu@arm.com>
 <20230106104108.14740-2-luca.fancellu@arm.com>
 <6373383d-d6d3-3d92-b09e-6434c5b5d15b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6373383d-d6d3-3d92-b09e-6434c5b5d15b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: a7797b28-b92e-4564-f83f-08daf2367de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eh3AeoVXIcMhB5QFLvsXNGzXTRNpAnPaWoWx60pp8LqbdxrYPucCLbp/PFiS/1T1ZcQ3ge1FWxt4z4lsErazR/BW9cV0okRhaqFadVGaYiF8C0VUhP7P++LUYyq0OTO89XN5TerlCgUO4T4CqKEFx1HLPRM5XuQhAbCuP3yn+2Qp5XZNGCPyXkMbMgx4+SHkFIvfKgLYvqBjScv8g2m06Xk7nbwWrZCmTJ+ElffjcGyL5ICDZOVV3oQ4lPwDOroe2W+wjzQkeXxRer7ToNrVy5QQ6l3YMPtE17MeHWPbyW2TgTD6NbntRn3L1x2shuzMNOK9djgelrlVOXq5XyeTasiJ8v55SQn5z4zs3bTkSgsrg3PtbrqDsq6rk93gYFb8GGPtWSkxwUs+SC9Zjg3tDcfUyq5ofafuAkVU1fC9STsedywPQ+VWvVlQVAB4xAUhcaLBLGHg++Z1FSsJO8cannB1jPV3PeYbrZ+jY4VK9ZepDOTkdbOuKc+MNkcZpvO9r+cOTHLdpWeMOV3uP+m0d5lSFK1vOfpolGLdHR6zzG+lY40uIuYz4DdQJDFwpmmKgDCJEmxiKyMbC68z0Rix0Vf4EaiiLPCDWElmkiSd7pHKRWs+o/SkLq/YM1YH252eFii1M3RriQMRH7ErpmzTNMkkktaZUi3r+6JpYfbsp6nEnxG7K/CATRKt97fGcUXV23bwPN40D2e8Zvv4l/ZBK0DfzdI/gfjPNH1jeVVbxlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(376002)(366004)(396003)(136003)(451199015)(6506007)(478600001)(53546011)(6486002)(26005)(2616005)(4326008)(186003)(66556008)(66476007)(6512007)(8676002)(110136005)(54906003)(316002)(86362001)(38100700002)(31696002)(66946007)(41300700001)(31686004)(36756003)(5660300002)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWRqS3hQdkEzaVRpZ1pRcTREZzlVMFpwdHRkMmpHSHBTMzlWRi91MU1JdlZP?=
 =?utf-8?B?ajBVWTV2bU5JQ1FaVG9yOXUxZkRZUnJJaVlNK0lveHlRUDErT3BLbVAvWC9R?=
 =?utf-8?B?UGluckExWDl3VVMwb0hqN244VEROck94MVU3RzY5cE51bzZUQSsyZzJ4eEo5?=
 =?utf-8?B?eFdWMzhkSkRtclBXQ2FqQXVJTndpQTNpa2hlQUVnYmZDRWlPbW5vcFpDNW00?=
 =?utf-8?B?WU1yMkFWdHZMUGRzdU1wVGp2R05lblBab2I2aWNveVVKYWFORXVkRVoxZ0Yv?=
 =?utf-8?B?MHp6UDNDUEc1Z2JjeXdGRHN1bWVoeHR1cDMyRTI4eGhuUDY3YXdocUs1dW5r?=
 =?utf-8?B?amlwZUlmcVpPOEJ1SEFyMlozaTNBS2E3V2Q3Y3VRSnRZQWRMdGN6d3BUWXpJ?=
 =?utf-8?B?VEFOVHZjVzQxM2ljS0Z4L29nRUZVcHg0K1R6M25MVnJHeWx3RUdIanJ6QXFW?=
 =?utf-8?B?cVpZYzQvVksrd0hJWkNaM0owWmdOQ0xsdFptemlJdHVTWkZQNUdwUS9kRUlV?=
 =?utf-8?B?R1ZnRmFiWkpqUjNNamVPQ1h1WUwremR2Tkt5VlN6WVpUMUtzaUI0N2xTY1p2?=
 =?utf-8?B?Q3Z2Zk9JalJSREpIK2x5MjYyZ0w4MVl6ZzY0MFlZR0xjcGxudkRpc0R3ekE2?=
 =?utf-8?B?MENJc3REbmFUZGVuTmJJS0IvZUZNR0pPNGw2emc4Q0NESmRKNGlPZ2tSR0lh?=
 =?utf-8?B?QUJWOWJoU1QzbDYxY1J1Y3dZdnRrcEo4UG02dnVpem9vR1NEM0w5RS9TYXgz?=
 =?utf-8?B?UzdHUXNiSzdOMVl6b3NoRXZ0VjBZRmlucDdLTzZaWGpwSzZGNWlEeDRqb3VI?=
 =?utf-8?B?eEtIT1M0cVZia2NqZVNrMVJGWkdhdEhLUWQvbFZUYTVJRGVKMVBzbzB4clpO?=
 =?utf-8?B?bHc0NXpvZENqNDZuMWlCZTZ1blJITXA2c0JGMVY4YUk3ZERBaTlNdnJTTkd5?=
 =?utf-8?B?d1ZWUFJvSFdGQXE1OE9halErTTMvTS9kUGdDcjExc2VMTkFIK2RmMmxuSUwx?=
 =?utf-8?B?WkNMVFFQUXJZNHRNQkJ4SjJQSFRqN2RGUlVNYWJsVEFJOEVUQVNta1A3R3gw?=
 =?utf-8?B?MjhGb1k4NlFjZ0dzWTBoOWs2WjFCdEVtQ2VyTVZYcnFVdkMzbDRjMnBuSjBF?=
 =?utf-8?B?a0FnZ3FaVE9wQU1EZ3M2ZEkxNVloWENIbHZOMzdXSGluZGJvQlFFZk13S0Jo?=
 =?utf-8?B?bU1qNEMya0VzcDBLUkh4cHlGSkxCUmt6ckVraDluWjAweFpacHR4cXBrMDY1?=
 =?utf-8?B?L0dkV0ZzNXA2bnNoY3NNcHBBRE1WRkVRY3h5OG85UzZTT3g0bTVJQmM4eUxO?=
 =?utf-8?B?ZVdxdlJTak1ESTVCblZSMmtaRDBnRW1zNFJNK0hHRU1CZlhsUUlxUEM3TEg3?=
 =?utf-8?B?WUZWUjZZTHRsM0hBaHh4Y3dWb1B5RjhYanJwTkFETGpkUVl5NG9vRWhGMUNl?=
 =?utf-8?B?ZDlPdzlVUXJRTStYOEZ3TWk5cnFEcXkwUThtR0tKTHBSVkxSeFVCaE42S2tD?=
 =?utf-8?B?SmJwNWNIaDY0NkQ2cVhQVlFOTXZkR1RpN2JDM3ovVm82TnpTNStGNFdYazE5?=
 =?utf-8?B?Wkc4VDdjSk9xamgvd0JMYW1aKzVha0xrWTNNVU5Jd1ZnUlZ0ZlVtN1RNWXRr?=
 =?utf-8?B?eCs3ZmhDeGttYUx3SndmekMwY1BUb28yY2xIcTAvQUYvenh2OHF4WldUNEhW?=
 =?utf-8?B?NitGbHlPNi9YWkxkcDRuOTEvVUFXZVpJTXZsKzBuaEg1SDZtS0tWc3lEQUk3?=
 =?utf-8?B?c08rV1BjSWZTN3FQc1pYaVZrRzlkSDZ5QlVZQ3ZLVlB5ZjQ2S1J2YmpLYUs1?=
 =?utf-8?B?bGV4TGJvQS9ubXZNbTdkV0hRL3Azc0czSk9yVytHeHBEWG5lZ1ExWDNkNDZL?=
 =?utf-8?B?M3lNbi9OOUdZMWtFblZpQXU1c1MyT2Z1b1I2eXE5Q3UvOXZlTWVrdFZyV2VQ?=
 =?utf-8?B?L1I0TUdlNy9NZ0RSOG5FSjV6WGxzUXhKZ01LWkhKcjJLckJLWDJGbUg5TG9V?=
 =?utf-8?B?M3hwV3lxeE9rS0hkTUs2R1hRVHpXYWhTcmdGK05OT1lIc2lXSUY1ZDhYSUl1?=
 =?utf-8?B?SHFDdkphMmUzckU4Qk9TTXB6Z3R1V1FQM05qamg3ek5TczBVYXdveWxuTEtW?=
 =?utf-8?Q?3XZyEfJwkduNHecBnZD34c8Pr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7797b28-b92e-4564-f83f-08daf2367de1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:41:48.1713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eMtJ43cd32SEtkYcIx46bXhAxUffL5bt57FnPNN5ApH/lPpejJOeBRAl4KxMBmY1hmlaqk0SSGAx8SzqBB9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7143

On 09.01.2023 12:15, Michal Orzel wrote:
> On 06/01/2023 11:41, Luca Fancellu wrote:
>> Sort alphabetically cppcheck report entries when producing the text
>> report, this will help comparing different reports and will group
>> together findings from the same file.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/scripts/xen_analysis/cppcheck_report_utils.py | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
>> index 02440aefdfec..f02166ed9d19 100644
>> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
>> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
>> @@ -104,6 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>>                  for path in strip_paths:
>>                      text_report_content[i] = text_report_content[i].replace(
>>                                                                  path + "/", "")
>> +            # sort alphabetically the entries
>> +            text_report_content.sort()
>>              # Write the final text report
>>              outfile.writelines(text_report_content)
>>      except OSError as e:
>> --
>> 2.17.1
>>
>>
> 
> Having the report sorted is certainly a good idea. I am just thinking whether it should be done
> per file or per finding (e.g. rule). When fixing MISRA issues, best approach is to try to fix all
> the issues for a given rule (i.e. a series fixing one rule) rather than all the issues in a file
> from different rules. Having a report sorted per finding would make this process easier. We could
> add a custom key to sort function to take the second element (after splitting with ':' separator)
> which is the name of the finding to achieve this goal. Let me know your thoughts.

+1 - sorting by file name wants to be the 2nd sorting criteria, i.e. only among
all instances of the same finding.

Jan

