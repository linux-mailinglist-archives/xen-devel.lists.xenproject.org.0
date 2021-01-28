Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFD3073DC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76873.138911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54fw-0004WL-9P; Thu, 28 Jan 2021 10:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76873.138911; Thu, 28 Jan 2021 10:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54fw-0004Vv-5n; Thu, 28 Jan 2021 10:37:20 +0000
Received: by outflank-mailman (input) for mailman id 76873;
 Thu, 28 Jan 2021 10:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l54fu-0004Vp-S1
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:37:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e10e0b-0b4e-43bb-8ad5-b4c1bbed4f55;
 Thu, 28 Jan 2021 10:37:18 +0000 (UTC)
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
X-Inumbo-ID: 85e10e0b-0b4e-43bb-8ad5-b4c1bbed4f55
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611830238;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ANbkmBCfOimPihB6U7SrXOWAjRWEJjOCDTIHEjtT1eM=;
  b=E+lWloF4GaYRWXjvLbY4VSXhWhmgx7ObRY5418hAiHZqkfErChjtUJDI
   eM5Y5ym7nxpWlyzV1C5oRVK7405NwX7b0imgm7hTuj2uiTv27MLabochZ
   rJRMrSctNLb7IvdVXZzDjEJBIqHPpuqQ2KznB+SndJc4qBieZN6BOqFWu
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vvcsQkNcBOceuyfPuE3zBYnRx/rhQE8ubB4wnnPoVIl07y0UDXSl10tsupdb8YmYBCqpOaBPX9
 scTVwWz/kRX9pFyicQvJG1yO/6OQTp1HoHffAf1LcteUUf+CReS6LA2GmgxPjqPRd6B0F9M5r2
 U+kMeymWRLgNkinmSDSeMqAU6ocdYGXs5L25xKqyBfIITu2tZKbPKGOAnZ4vv/RCqhZNa0PzNU
 t0Bsf3hv8BfNZao1WbXssoCig7btsFuTyVA8HRwhsDuLnL8bVBunU+a+L9LP7NbWFHnoGO+TJF
 huA=
X-SBRS: 5.2
X-MesageID: 36089090
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36089090"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdJoBp0a+/OZaCxuLhewZ1RGlBwCXoHdkChfJXo+HLP/Onxycp+obdRZpfjewfi7DQ0JtsqpEGgvdOl2sQ8Kx3oWHQ59pJF+3HJoJnHbiM6VTFMeLLibVZbEMJqdYjTPFE7vHdqYgXu1mBQPKmgeAPGh1tHdoDaf9DJVOv8pzS5GO6RHl1vyr/WqSB0Vrlm+XGlFCeX7wTbHTLjUZDYL7MZug48buL8vAiPVdDTzsXFuvqoXnu8wQRxoRbDKMNqmvhEN3bvXgn5Y8shw4K+pinptuKuj/5HyR84QMyxAnmdLtMlUm3f/KH09hlKimkp3x3ot4D0V238IpizCu3pF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANbkmBCfOimPihB6U7SrXOWAjRWEJjOCDTIHEjtT1eM=;
 b=VNIdm4zq9COgylW0uYy0bK3N9nciJk+4hL9c1SOgYgu4Izhz0UwfW7Y0rbx5p26mwXaAS4h5d8H8Qpvh7pU3l+JcVJXJUnX0MFfqkjAWf1pbaqHxZ6fy4YyIE4zShS+ym3XMNYTeyZI4Fqg1HnZr8lutUJgpgLhvDS+GwA1L+W+BCLqWEvbTaeT1mRjV75Jw72Wwt6D9639MU1UnpNBD2Y8hsNvVS19Y63wcoguXT0C5BZaEWWOXgw0lV/7ov78INdqerO1PL1VJteFVQD1F4oaiMIpKmQYAcyB8hGnTI0kGOgDHK8TyWEqbCTLvNsPfiQxAOtBEtkCNack48en3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANbkmBCfOimPihB6U7SrXOWAjRWEJjOCDTIHEjtT1eM=;
 b=nHGzCgFMgp6HSCd+Jvax4U7YOsn1LCpyqxNBbqyQ1F5o/ZB/5w1CweAIfXnkV7Ol2tL6U1dnKv6DttktJortSGjkge+nGJ334snj2bJtTGgdydkIoTjCR1GhKOApz3ZYjLI5/b3nmQFt/oHkiPOEAzLXhfHU8Y6et+08RVqe6g4=
Subject: Re: [PATCH] memory: bail from page scrubbing when CPU is no longer
 online
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <251a14b5-01a5-0a9d-d269-f463a0759f1d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a1032406-4b4b-f6ee-34c6-eb7ddbee471f@citrix.com>
Date: Thu, 28 Jan 2021 10:37:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <251a14b5-01a5-0a9d-d269-f463a0759f1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65dccfe7-a535-4645-925c-08d8c378ac60
X-MS-TrafficTypeDiagnostic: BYAPR03MB4344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4344EA6312343892EBFA3206BABA9@BYAPR03MB4344.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YN1qusrOOYiSQJpMRNhJAEV+UbXP5cFAGqzVOUW5Ua5hQmdrUZa+Ckflsu3qZsr9a1fyWKwAb2Bxk4bPyYc62OVSYNlAmI3AMN2moVCQQWlymgrdMeF1k5YnRscsCK1lfr9srZA8CaPwgOS6FlplAxHDIFxZi6cnXx8/jlX191KOLXu4aO8ZBLn9jaOhJX4MDqzwUQ6dvqZsBeYcIOpl2ELvUqnxHyMvAwg/RNRz/z5mH6Z3r+RquVkjHBhe3w88aM6vWhAeVRZMshMtr7TxDblC6SkgYfNCY/cCV2cUfkp7eo8ckYwkZhhxYMrc419E/xFSUzhC+ejyFD/IRa1QE4EmCXGvrlHSp2gXClW0srjf11sVY5bytNO88QOKhbJ6414Xt7e/NXjIc4mksxOzRMIVMjkfTF+Zv3PILwsrt+ULRxUkiYDP+VNv95zZOISs/YqvQ1kVrq1XMK03/k/b/4uhfYbsMcVa7JaNgWq7ki//+uAAWQYyEI4DbWUNXuzLaiabAuAEPuHlN0eDvf6tth0WqbFsLruL9S7Zcnu2OFahREr0QVCgxqDI3YFWot1jxDlyMqrTjX+8Dspc8emt9o+tl8dp9YqadMTzCtj+YJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(36756003)(66476007)(26005)(2616005)(110136005)(4326008)(66556008)(16526019)(956004)(2906002)(186003)(53546011)(6486002)(31686004)(478600001)(6666004)(31696002)(86362001)(5660300002)(4744005)(8676002)(16576012)(8936002)(54906003)(316002)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDRvRzJCbkxpSjRJWit6anRkSWFJMnJXdzM0ZFNPbm0yOHJic2p2UDBYNWVz?=
 =?utf-8?B?S3p6STVqK1R6bUZranBxYWp4Mng1c2Z4M200Njd1SXBIemJ4L05ITzVrbm04?=
 =?utf-8?B?VXZ3bnY1VHFvNHJia0FvVjdLa3B5OU1vUDB3YTAvVnRVRFo1TTF4eFpBbnlT?=
 =?utf-8?B?N2FadEg4N1JhUlZNcm1zOFpUMWhwSVZpbUVCZzEwUzJXaVpzY1lzMzVNM3Yy?=
 =?utf-8?B?UHVrSW5zWnl4MUpqUHBBa1ZIMXRtZ2ZvWmY3Nkh1Y0o1U280OW51ZFFmZ0ow?=
 =?utf-8?B?QnpsQ3RxcERoZnF5THpEa0g1WEpqT0VxRW8zS21RWkdHQSs3OWtDMGRKaDYv?=
 =?utf-8?B?N0xwNzVXbHFST3BGVFErb0RwTnlUVlR6RGlndDYzMUYvb1R1eGxJZmtRT09F?=
 =?utf-8?B?MkhwWU9DY25zZmZSYXgyYTVRZmQ1bFJjYjhBak4zYmRUNmJpUk5hNll4dEVz?=
 =?utf-8?B?cE5Fbkhlb0l1dUgya1pIVzJSYTZWL3FESzRJL3lzdEdTMGp0K0xySGNEaDVC?=
 =?utf-8?B?UUIrMzdxOFpNdG5KdURMZGRENHh4TnF5eE5lNUwwZTl3TnNkcEpxRnN5cWJs?=
 =?utf-8?B?WnFCdGxSdW5pZFkwc09RODRHNDNZMTNGbDFRUUNPM2l3Vjl2Y0I3UUliMXI2?=
 =?utf-8?B?cmwxTkdLR0pvcy9jek1MOG1YK3h2ZXByNmFSTlBQclUybVc2Rm1LYldGa1Nl?=
 =?utf-8?B?TDdkTkx0UXZmRWpZNklnM2Y1MnRlTGpQVHJiUCtuSlZxcGgrdUl5WlRZQUNQ?=
 =?utf-8?B?S0lnNThmSjBSUXV4WlN0TUo4UkpSRG1FYXRuTlJBemxITXhLdEt5WStHNFcz?=
 =?utf-8?B?Z2hpY1VYb2RJSXNyeHQ5ZzJZS1lGaWVrWk81K2V4aHhzdUJtTWJvVmtoWlp6?=
 =?utf-8?B?UW9UaUxxRTY5aWVBTkJNTXRSS3FkZ2ZuemVtTEhSZkxENmF5SXFja3FFVzhN?=
 =?utf-8?B?dEU4ajRmb3JUN0NhVHU4Y3RGZXdwaWxkMVhqeWZLa1dieTBwNlBqQk1uTlpa?=
 =?utf-8?B?eUVXTC8ySXZvK2dNMzFXOC9HMWE3N1gwcTlZUUJMTlRoaDVNajFJVVVRVFRQ?=
 =?utf-8?B?c1FtdWliMm9zZFhyMVpiRFhYMS9JeDhtVjF4Z3NRM2xOL2R1eE1acVJCSzJP?=
 =?utf-8?B?Qm9oZTVWTjVXYmpZYWNsV2V4OHVhVU9DYnY3eGh3M0FrLzEwY0lNVFF4ejVi?=
 =?utf-8?B?bVk4TEpPTTJtMlpYeEhBWFpmWm5vY0VxL0ZralFST2lYcGx3a3lDV1N1NWp2?=
 =?utf-8?B?SDNidENUQ2tZdDMxQ09mb1lwQzBvN1pjbFpRdkt0YlR0aWwvWG4yODB3TjhG?=
 =?utf-8?B?bXRMU2QrQnZaQ0xDaHFXTmJPbHBuUVFTYU1IRXFiMXJUQzVReG5EMTV1S0dP?=
 =?utf-8?B?aG5qZ0xDMnd0OHVHZHdYMUl1cDJlK1g4czM1YUR3WjJoTzkvcFdmVEFMbzhK?=
 =?utf-8?B?bS9Id29JTThGUVduYkIrVCtySDFrbVp3YXhWY05RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dccfe7-a535-4645-925c-08d8c378ac60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:37:12.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBRPMqp+UlGfrrHYSxGWN7Ldg7yKq/XXcBqRm1AdBcD979/1EEjaVs3V14lAy8uFw3LKPqrmSN+BmYOe4p+0dVaZLx7LOVUjAn+uArq6MNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4344
X-OriginatorOrg: citrix.com

On 28/01/2021 10:35, Jan Beulich wrote:
> Scrubbing can significantly delay the offlining (parking) of a CPU (e.g.
> because of booting into in smt=0 mode), to a degree that the "CPU <n>
> still not dead..." messages logged on x86 in 1s intervals can be seen
> multiple times. There are no softirqs involved in this process, so
> extend the existing preemption check in the scrubbing logic to also exit
> when the CPU is no longer observed online.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

