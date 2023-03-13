Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D86B72BF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509209.784546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbebk-0003oH-U4; Mon, 13 Mar 2023 09:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509209.784546; Mon, 13 Mar 2023 09:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbebk-0003lk-Qt; Mon, 13 Mar 2023 09:36:44 +0000
Received: by outflank-mailman (input) for mailman id 509209;
 Mon, 13 Mar 2023 09:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbebj-0003le-G4
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:36:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f20bdcd-c182-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:36:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7145.eurprd04.prod.outlook.com (2603:10a6:10:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:36:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:36:38 +0000
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
X-Inumbo-ID: 8f20bdcd-c182-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc6RMKMN08Yjfm3E6jwltZMHy/6fb3sLakVy44ro1iRbAR2bt3kPvpeqn+jehbe7Yjg1fvDcEkFuspbrTpY6ulhFLutHZQluybyF3Ci4T7L+9cOZA1MEqtlSx1biy/T+qtcQ4nXZ3oJNOCJwCvcRpGeM6EXhIybqljTOl9c57Tib8u0KVu/nQPtGUFFvqoE2wOYNQUpYzcVE9WZo5PLWlrSOyc3Iq/4FIEAjKVZ+xJRqudS6pJQH/7mVmHpLetZv9g7lJxZXL8fgAMFS6sxcBRa0s6tAHGSidMMHb0wuxzF5pG3C2zcPfL8cABjHbVuuIcqieHmu6yw2pPSLXZuHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiw5R6dGNTmZpxjC2pLBzmNv2QN/xljCAL/x6addyI0=;
 b=ktTG8JB+sfDTbiLIZLBT2S4RhDDpsLaBez2WiC2q0KTRZrnaTlvyDCzG7eOSCHn+JUVNfXws1R3BMgZ5sWXPBPPai2+YnxCdQKbx1AVwxeCnmNiBGvVfQURV3wr31ynqv1tXsPGKfW+wRDtwAFl5CdgwJKR06tiruY3rdAr74HZZa4TTNpu+0XyK6WCcS+/pSe7M97dBD1mEXEzWbpk63r573gKJHAWXzRDPNyObTBdAbKqSBQfNPVuc6B4A83tcZZ09rdfhp8y5O2xW9hSW6oJ3t6TmA25xBg6twcH036P0V1gYPptxaJWR31T1CZNd3NOvhzCOA9p0BlvhBiikFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiw5R6dGNTmZpxjC2pLBzmNv2QN/xljCAL/x6addyI0=;
 b=T/S/iFjtbBtgCuLmWpKUpXVGcgBYBbegLyJ99mPClJAc3jbYpKYp5jPSXJw0+R/8M12WtuXrEaTqBpD6L6osW6hUMsldWxcpLeF6Tm7fSEx4CIVLXzN16IhVyOYnxkF1GJdETpuDGRuRLhwe8KRmqmmK5XgwL3/I/QPqmLpuQRc+y0+yh69cBQ+pI671trb6bzT+lRi0yX8PV7h0vmdj0l+bzt2wRv+L9/mk4SlNPEAMZsRBdEtiTrebxrIWV0U2W2YfChaO6m4jeVKhWmVUlzPZBe5FNob4GzyKZLZxbKDvmYn44P+SEfF6Tpo/megMnqDNOz68S++RZougHBhGUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
Date: Mon, 13 Mar 2023 10:36:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: f3221b10-98ea-40cd-211d-08db23a6716e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fm+RsiBALqkV4SyvmhZBqWUHTQlXBewLepF7AGaDhQ7IAxkcXrxGynj/Xwzqtv8k/WWZXelbGgNFu8B57IzdWU/XcGO3Ki1ITBwulbyn4CEsgtX8bYz2PTEZQB/x425xe68bPP6PvAG0pVNiuQup38zqg+vnOLNko+HZeGwTZRCp8QoLqcRtjkHFsvJDA3KNIOzc6ffxsuSEoR/CRePjjdymP1PhzKSTXFBiw6FDdADhguor23Amz0bee0XWDmfp2vBgujySZamTTB9HZkWqqlyS9xjhLDFnDuoa3eLC3Cwu9YZcNMoLCqqzFG+wKvyy2cAKsuvQIihmd2eGSJW0dHniw1Ij0zvZdjb4MinXl3pfZBMLyGtO5PSrFeuXEe0hUc7O0nkb+JIR/B+miTgaeDk/ufO+Lx2MvK7PwnKwF3W5b3HBC7yrv1N66DJ3ysPB5W6/0UCl8QHhu/Netc+bm55hR+Ics4foIlDPoIWQMVcMfMZCq9ZkcWNFXd2LAaoX4MjR7h1wy9TfQxcaLMeFhMpfKt4mQsU41ExVqgEMtAiAF6a40iIjNBRGFVtBdxf/+kcAkwpKcCAjRrOSB2JnbY21EL3FDNTjt3siehbE2wWK3ZyfeIT4nw+OVXzbVHn6fY1FepUD6rFWDl6o5WoGa6Dw7ygWpl+FEp+OKcj2odZfrNPUfhMFpklaLFYbKpzAChNrg4H0xAWNo2FpCsLlF9AAc32YH0ZPuM0DtkyZM6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199018)(38100700002)(2906002)(41300700001)(8676002)(66556008)(66476007)(4326008)(478600001)(316002)(36756003)(66946007)(6916009)(86362001)(54906003)(31696002)(6486002)(5660300002)(53546011)(26005)(6512007)(6506007)(2616005)(31686004)(186003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9nU0NtQXNpZUdEYzVpRzk1Q3o4ZThOWnZWYWFyYUNoaWQwWGJlSGt3dm5z?=
 =?utf-8?B?REZpVGpVdTJyNmh5UmtSTEhjUWtpa0dCT0VnM21DemV3MFd5MzB2Z2RBWjFP?=
 =?utf-8?B?VkpOZkJpbTV5MHV0QUJHSThLY1VNVzBQLzdVV3lFSGxsTkZpNkJJaGxyQXNm?=
 =?utf-8?B?QjBIelNKSW5WcDdLQ3FYQS9zWXNlQzZzdndxVS9keURkR2tINmJIRDNFSDlM?=
 =?utf-8?B?b1JwcWVKbHdsNlBoU0pHMzdBbkViR0RNcWV4cWUzbG9TNkdhYzk2eDJ1L00x?=
 =?utf-8?B?dEltVC8reUh6cnhBb04wM1lzMmxKT3FjTlozL2QrbjJ1VmZrWXhBaitmSTg1?=
 =?utf-8?B?elRDV1lDMURacDB2WElYUDlVWTBZNkNBWEliS09pQ0t3QTVOYXd3UXhuRkpn?=
 =?utf-8?B?SGM3dmhSZWlIaWVVQUlyVVZQbVBRd251Rm9ZblRwWFlobitQblNHUm1JRWZy?=
 =?utf-8?B?M0EyZ1piL3VJWTRaWGVocVFLMlFBNDVMWTJzL1NJUlVWSGlucXlhRjZ6REly?=
 =?utf-8?B?ekdESG5pZ3hyampMb2ErcXEwQVFxamVtWVlTNFptOHk4QmFHS0RLVEFKZFJq?=
 =?utf-8?B?YjlmNWt3YnpNRzlPQStieXdOYXZJVkRnaDhKaE9EOXBqRmYvWFhMOFd3bEpT?=
 =?utf-8?B?RE96MVdFaTJmMFk0Q1dGenczU0U3ek9qM2hyUzZRNXhocmg5MDVQQnFaYXAw?=
 =?utf-8?B?Slo1YVFlOG10MzZKWE9qT01DRm5ETDZxMlI4SDk1MVNmSTN1bkE3TGdLSTZU?=
 =?utf-8?B?N2ozbkJhYUhwMjFLalNPeWF6UzFpNzhINVUzNmtURk40elJ4NGphMlh3UVBN?=
 =?utf-8?B?SVJtdmtTL29XeFZMbTdnMnVXZFNtZERpUFRGTTc4Mm8yUkRFR01UODBLQWJq?=
 =?utf-8?B?R1JXQnFtWkpWZjFBcXF2aGxrWFFST3U5bmw4V3gzNzJEbTYwWEpsNlNESHl6?=
 =?utf-8?B?VFQrVXFpeE1idEh6U01GSC8vWVZ3MWxzS3hLdWJjSWpidXhRdTI0a2dUM0Zj?=
 =?utf-8?B?TFphNmdoUmswVy9WQXkzd09DaC9sbk1jUXRkM3dKMzl3ZU1LV1h6OTlURzk2?=
 =?utf-8?B?MnYyUEpkSXpRaTEreHBzNUExZWRkSWFmaXVhbGVWSlVNQVVQY1krQU9zQ09Q?=
 =?utf-8?B?alVnMzQ3TnhBTXRMQzQzK0JhMlhXWktvSEJOYWdSenpPbjdFVVNIcmxkdGNO?=
 =?utf-8?B?VnhqRnpHbXkxd1lZZVJjVFNnbVFhUmdoR2VWbFB2bmtxUGd4TVRhVmk3U2ln?=
 =?utf-8?B?c0FlMWhXdFhhbnVyaWc1SGhYWFp4UGVBZzhOWHdBNlFEb0dxQjdrUHhuVTZ0?=
 =?utf-8?B?THVIU1ExblpqcSttVHpwUDY1eDVETUpqRFVSYTFBajNuRkpUaUNmb1lIWGlw?=
 =?utf-8?B?bGpHVWluRm5wd1FsQzB0b1hlZ3Z1R0g1YzFHNnhLM0xUWXF0RUFxM3F5RzZh?=
 =?utf-8?B?S3BCZFh0V2kzZ3gyY0xmWkM3cEc4RThOZlBJUmMrSjkrNnM1YVdRWEtxbDZq?=
 =?utf-8?B?MVJEMXpSU1lUd0FzWDhGTnNEOFpmRHppblF0YkludTdCQUhtbDlsWkZVWXFF?=
 =?utf-8?B?dGdWZWxHZnVuRm92dWVtOGhWYS9HY0FpVWRybFBpOFJJbUFaSkwvMGJWTkhw?=
 =?utf-8?B?TUpkM2hXMmRDaUZyejhHSnNqa3hUVS9vRmErQmRORU5QM1lnYjk3MHFPMzda?=
 =?utf-8?B?ME5NM0FSemRwUTFPSmNvRjY0ZTRJbm9KYWhGRTZ4a2pNaCtWcGJKVGtXdm9o?=
 =?utf-8?B?L25kT0tmb1VuczY3VmpFYkQ1VWl3ek9DK2VhUnc0eFFWbnFTM0RBelROTnRG?=
 =?utf-8?B?UUFyekdTbmxDVzc5a2NjaFFnNU1RT21CQ29pWFhib0Z0cDBNZVRNekZady9y?=
 =?utf-8?B?L1RMTFVkd1FlTFE2a205bUJqUzZqY24vVm8yd3Z6SlA2TURzUmg2NyszQk9Q?=
 =?utf-8?B?VnJicnBZS0doMXdWR1RKU0Y2T2V4QWpvbjVzeGdvSVlXRi9QS3FTM2Y3VGZO?=
 =?utf-8?B?WmF2dnpkd2p1YVBjSEpuOUsvUXlLWTlTR2NRYzRjRk92S2JlLzE5eENxN3BK?=
 =?utf-8?B?NHRrUW4wOVNaOGJSU3phYlcxSyttOTNSR3lDRDBOVFZFTGN3VnpJaHh1bWZF?=
 =?utf-8?Q?RSLdIYPZYwknC3HuN6r2KYzax?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3221b10-98ea-40cd-211d-08db23a6716e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 09:36:38.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybSM+lCUOs1nvwrOlzZA7VXroQW32rpE1qzkAsIFYe7PQleG7Vtb4FKFxQUcwjHf9qEDk74Y4XG1iG6EI67Tdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145

On 10.03.2023 21:50, Denis wrote:
> On 10.03.2023 09:51, Jan Beulich wrote:
>> On 09.03.2023 21:37, Andrew Cooper wrote:
>>> On 09/03/2023 7:34 pm, tachyon_gun@web.de wrote:
>>>> A short snippet of what I see when invoking "xl dmesg":
>>>>  
>>>> (XEN) No southbridge IO-APIC found in IVRS table
>>>> (XEN) AMD-Vi: Error initialization
>>>> (XEN) I/O virtualisation disabled 
>>>>  
>>>> What I would like to see (taken from Xen 4.0.1 running on Debian
>>>> Squeeze, in use since 2011):
>>>>  
>>>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
>>>> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
>>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
>>>> (XEN) Detected 2611.936 MHz processor.
>>>> (XEN) Initing memory sharing.
>>>> (XEN) HVM: ASIDs enabled.
>>>> (XEN) HVM: SVM enabled
>>>> (XEN) HVM: Hardware Assisted Paging detected.
>>>> (XEN) AMD-Vi: IOMMU 0 Enabled.
>>>> (XEN) I/O virtualisation enabled
>>>>  
>>>> My question would be if this is "normal" behaviour due to older hardware
>>>> being used with newer versions of Xen (compared to the old 4.0.1) or if
>>>> this is a bug.
>>>> If the latter, has this been addressed already in newer version (4.14+)?
>>
>> No, the code there is still the same. The commit introducing the check
>> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
>> specifically provided for a workaround: "iommu=no-intremap" on the Xen
>> command line. Could you give this a try? (As per below this could be
>> what we want to do "automatically" in such a situation, i.e. without
>> the need for a command line option. But you then still would face a
>> perceived regression of interrupt remapping being disabled on such a
>> system.)
>>
>> The other possible workaround, "iommu=no-amd-iommu-perdev-intremap",
>> is something I rather wouldn't want to recommend, but you may still
>> want to give it a try.
>  
> Thanks for your reply.
> 
> I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" and
> "I/O virtualisation" is enabled again.

Good - that'll have to do as a workaround for the time being.

> There are only minor differences in the "xl dmesg" output.
> In the one with "iommu=no-amd-iommu-perdev-intremap", 
> the line "No southbridge IO-APIC found in IVRS table" is listed.

That's as expected - the message is issued as a non-error one in this
case.

> Though I yet have to test a HVM domU with passthrough.
> 
> I'll attach the two "xl dmesg" files and a third one from the old version of Xen.
> 
>>>> I'll attach some log files (hypervisor.log, dom0.log, xl_info.log,
>>>> lspci_vvv.log, acpi.dmp, ivrs.dat, ivrs.dsl).
>>>>  
>>>> Thank you for your time.
>>>
>>> Let me braindump the investigation so far before I forget it.
>>>
>>> Xen requires that there is an IVRS special-device record describing an
>>> IO-APIC 00:14.0.  This check failing is the source of the "No
>>> southbridge" message, and the cause of the IOMMU(s) being turned off.
>>>
>>> The MADT and IVRS tables agree that there is one IO-APIC in the system,
>>> but that's the northbridge IO-APIC, not the southbridge.
>>>
>>> The block diagram for the southbridge does have a PIC/IO-APIC as part of
>>> the PCI bridge, so honestly I was expecting the MADT to describe 2
>>> IO-APICs.  But OTOH, I could see this legitimately not existing in
>>> configurations where the PCI bridge isn't in use.
>>>
>>> `xl dmesg` does have a few unknown irqs, so there might be something
>>> down in the southbridge really generating interrupts.  Or there might be
>>> a IRQ misconfiguration elsewhere, and this is just a red herring.
>>>
>>> However, a consequence of the northbridge and southbridge being separate
>>> chips means that all southbridge IO is fully encapsulated by the IOMMU
>>> in the northbridge.
>>>
>>> So irrespective of whether there is ah IO-APIC operating properly in the
>>> southbridge, and whether or not it's properly described, I think Xen's
>>> insistence that there must be an IVRS special-device entry for it is bogus.
>>>
>>>
>>> Furthermore, Xen's decisions are monumentally stupid.  It takes a
>>> specifically safe (IOMMU-wise) system, and because it can't figure out a
>>> partial aspect of interrupt handling the southbridge, decided that the
>>> system can't be safe (a false conclusion) and turns the IOMMU off fully
>>> to compensate, which makes the system concretely less safe.
> 
> Also, thank you Andrew for bringing this in.
> 
>> So this touches once again the area of the fuzzy split between the IOMMU
>> being disabled as a whole (meaning DMA+interrupt remapping off) vs only
>> one of the two being off (where presently we are unable to turn off just
>> DMA remapping). Indeed the original Linux commit, which our change was
>> inspired by, results in merely interrupt remapping getting turned off
>> (afaict), and that hasn't changed. (Would be nice to have this confirmed
>> for the system in question, i.e. without Xen underneath Linux.) It would
>> certainly be possible for us to do so too - it might be a one line change:
>  
> Could you elaborate on that one?

I guess I'd need to know what you're missing; the entire paragraph was
intended more for Andrew and Roger (and others who are interested on the
"development" side) rather than you. Specifically ...

> Should I test something else?

... there was no request for any further testing here, for the moment.

Jan

