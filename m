Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC873D79ED
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161249.296086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8P8E-0006Yk-Iu; Tue, 27 Jul 2021 15:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161249.296086; Tue, 27 Jul 2021 15:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8P8E-0006VO-F7; Tue, 27 Jul 2021 15:36:34 +0000
Received: by outflank-mailman (input) for mailman id 161249;
 Tue, 27 Jul 2021 15:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8P8C-0006VI-Uk
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:36:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 090cf80d-eb63-4c05-9933-5d5d3347bf71;
 Tue, 27 Jul 2021 15:36:31 +0000 (UTC)
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
X-Inumbo-ID: 090cf80d-eb63-4c05-9933-5d5d3347bf71
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627400191;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nFxbkUTa9A71OnUtvE6nFXStqtOsCoTlCU/zMOS9bOw=;
  b=Spa7oxI8UHsXQ1t48yAY90rhn8/WXceb+KsgaXCS6vorqo2HXDTZM1M1
   hr6tmIBrr9OeTRxx90VcFDGvAUo2hR4gaZFcsfRegT6fNAQravxXzggWv
   X0k1+zwTD5kzlNDWVq9b/fwj9vKoMO3I7zZQroe4jKL8r79JlK5jzKlut
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f6gDmo4t6EAYk11o5yg2ktuNNAj7P3FkhiJoG3KZI7WIeAIS869NGujej7SQ6/I7oNoJ4ZGuIW
 BCG46qOSG/AGkWwQVF8fwTEKuEfveaqKos3sQcfdVaR0MgGhCpopQ/pIU0zy4Ecvd6mlg/A6K4
 fqk1QrbPGPgYQ8AOze4w6ZBx0I3sZ2/8xI3L81iCgNqIgt4cggVH8GpdmYpf594BbGtNNeFY95
 a/pK68IQ9OGK2xZwRVQJUU3CycslvoHOIPlAPsGZAxVuP9S+rXTh+YCdBH//xdnFrxdA7N1vdA
 TcvMvrTEYFtCr3boXzYVebXz
X-SBRS: 5.1
X-MesageID: 48865990
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rDKqoqlV6pKfTuAGaVx7bqmeCW7pDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.84,274,1620705600"; 
   d="scan'208";a="48865990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxiprzpdLw8srKqonGTAkDebSjD7gqs7SzH/Tc8yRZePVJR6RiqEOhjTVkBFLBSzO76c0MM/DWeG1SpQLkjlwf8r8leF+S4Wja6zt3c6c1xw5TAmquBscm2/1SIl9UUOuO2Gw8EtdC4pw4DdBHF2IWg7kwcDRY+FEG7YjpaUB8LvqiwbN+dk4Wo7tw6/XVNvwUoGAqS89zpvi1E3GmqkwXB0OesaTIPJUqe8JsD+aShZK8PrTiPG140RD74H5othprpH6PsC1YxlOdUREA6v8MqAsylLzs/R5LEsVOOhiANgDjlVAvFCxVFenDnygkErBsQvRWng9sZU+2JgzfnE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFxbkUTa9A71OnUtvE6nFXStqtOsCoTlCU/zMOS9bOw=;
 b=dMJ+Pk4rvNq52Veaa8UziPepHKV91BH/DO/dCq8HCmVffTHTRsPiKbayEW6YwaPRmsHtGbXYvCpqb6pK1qUJ/89AAOWMys6x6id0Z+nE8skjQnCQXqPQt9MkrJwlbvsoqlBQgghZZsyVO6o5t/4tknH2Ht8Un5gXraY7lXF8+T1NFYFaL3ofhIfaN4DadaEpuBacd61ivN2t7h6xpxwHH2FRS0qA7cSc4SxOOBkJ02pfHCty2bdAIyetPHxObupOKL3LS3H1hNQiuKOEJs7yhM0tsZ153fmenSKSPXPLZ2p3NrUdBA06V6KRE7A10LtTM1e2ADd8pI+vvQ3qGmPYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFxbkUTa9A71OnUtvE6nFXStqtOsCoTlCU/zMOS9bOw=;
 b=mIBoAprksQPN11dFST7PjX9t56+PQT/V9y+ha1XD7I5H4vFPzJ4qC82ku4AMFBLkwQ4YabE0109PVpZdvv63gvA90jV9+W4N3PPN52IWKsXyvyTMW+JWsvFc4lTAMnOMuQRhJ9rTesFZwj6UkYyalQoNh/rvv0VIZkUCR2+mUgk=
To: luja <luja@openhardware.de>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <43-61001a00-75-6ab37100@54781652>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen-Error: Disabling IOMMU on Stepping C2 5520 Host-Bridge //
 SLH3P marking on die
Message-ID: <a9ee4587-8fbc-495e-98d8-77a07988cec2@citrix.com>
Date: Tue, 27 Jul 2021 16:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <43-61001a00-75-6ab37100@54781652>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db6f2a7-ecb2-4f35-ae89-08d951144a8a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3432:
X-Microsoft-Antispam-PRVS: <BYAPR03MB343263965BA248ECEC198AE0BAE99@BYAPR03MB3432.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtTrBo7Tp4DLyC8Jd3h4wuicKFbAmnU42IhU1kmoDdZybgBRQ+RxeSdaa/8awzjWBcMsQyBWUuIGQppbyIc5eycU4rGQBZzHTUK6EZGpjKbng+UFgTE+PPmNa2JvXR7CGjHpnuJOf/nA23dpkzklKIWk9j1gT0UdHIXiWbD2ERqT98a4qo1EzbAduNU4hk/IwgJPZTHyx/+91f7/y5z+wLaQ4mTi3ixkJtnSgyQbPZG+54bFDXeQ8tIiEYncw0Pfwx9lI2LJ7a8zV8aXw0sZFxTqJf93FRYel+nw2cdgy60BhYEX7kGkh74yEMotjjyuz+iyEo95YTNujviyjqMNwZeSpl+FS+he3Gps2cCpV17VPIqMUCCMdkm8QFBuxSiQmrdKoCdnyR+wJiRxX2xywN4F7idFSU3Y/mjAAHf4SOZzLIh7cyAH074I+p6/bHUto5julkMnG893s+jOGEpqX5PUDz6EDCEVPfmiab+lgskmpvGJkSXs3xjrlSdhUyKKnJXTOdEjnLnspuuMzKHGdbxhsziBqo8mieGEjW14uCuMWC3YMO07JRM+hKgCLr/NYh2uEEU0vVXHjCuumdYX+P5P5Rylj9G59je8W/XqO7ixKHYpxhOTa37bnFwraLmI8HPMx2WRcQa7x9oBiWzYnAfEybOreZjoj7LeFz9Hvkdk49VKVClK0pofQM+k5OHHCwanRVKTejWsBW3w04G/AAYuTZ4xwX+wMQygIcSlltpCwgQfpUul7mfb5MVXgay3Gr9WGIJWV2rsMFuN+WenaYxqTsy2W4A8mhZySWTtCoC93TXgi8eB0av6DL7PYMFD6/EyFK7w2VsZNTQV14FdYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6666004)(2906002)(2616005)(5660300002)(8936002)(86362001)(83380400001)(966005)(4326008)(31696002)(316002)(186003)(508600001)(54906003)(956004)(66946007)(16576012)(66476007)(66556008)(31686004)(53546011)(6916009)(38100700002)(6486002)(36756003)(26005)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNiYXZmbU45NXFLYldpaE1jTjFmSllnUm5xSGxEZ3hUbWhDZzE3bVRGN3hx?=
 =?utf-8?B?UU54RG9qY2Y2U3pQVUU2UWFKeVBNSWZVakVRNFBuL3d0L0UzL1JYN2JkemJF?=
 =?utf-8?B?enM2aGdvYVVmVjluVDdKdkdnbzF1ZnFOQ0puRjNSbndFdVB6ZWVuemNPMDJt?=
 =?utf-8?B?N3JmalJxQzNsa0xXMHlWSWlMbDRJeUdxYTZKNFN0c3FNUWVLckNSOFl5Umgw?=
 =?utf-8?B?cWMyZ3ZjTktVdU1uQVlkcU1KblRLRWV4M0VhYjBnVjZxTVU2SmNSWEV3bDNn?=
 =?utf-8?B?TTBpVEpPNlRYRnI3TGgwcFpMbWxOYlVCNVlpdzhRWEhwOGs2UUozMDN1YThF?=
 =?utf-8?B?L3M4RXdZQk5acEd1VFVJNXFvK1IzcVBmU1RiOUVGMWJ6V0NOT3NBb3I1ZVBq?=
 =?utf-8?B?cVdMNUI3bU5BRHR5Q3lCQjNoQXBHTDJOaTRZbDhQNmFpdFNMbzAvOGg5M1JD?=
 =?utf-8?B?UW5TTHNYVE5RZ3BDUUhqNlhVUHFwV2RqYW5hNnBvcE1Ga2o1ZjB1dy9jRWY5?=
 =?utf-8?B?UGNwMFNUaFhpQ0VvK1UzY0RVTUJyM2U3MnVqanpnNDVPbzF0UFRCc2pWOTdP?=
 =?utf-8?B?ZkhodnFzSmtuLy9XM0g5OTBUbmx2NGxVYWliMVg4dTcyRDZKcWFBTXdNeUZl?=
 =?utf-8?B?VitlKzZaTU42eHhOVTlLbWk0cXVtald2SnBoNkpRcVZqczZYVnF6cGp5RVlL?=
 =?utf-8?B?ZFluaVJud096QnFYZVpGKzBVdXZiK3RKemNMVHNvRnFaN2NLWjJFeFRhM25D?=
 =?utf-8?B?N0orZ0hvSVNpKzlkaWRjWFMyeGthUC9VVU9pMEpRMEpKQXN4clJXa3JZVk1w?=
 =?utf-8?B?aDczK3lhQ3h4bVB0Q2tHb3BucVBCNEZPSERIaHlNakxzMmMxTVhkdlJjOGpR?=
 =?utf-8?B?L1ZwTFU3T1lOWlhOY3U4OHQ1d1lCQVdvZlhuYVVIQXo3VVhVR2pLOHUyYWR1?=
 =?utf-8?B?dGJkckVGd24zTzdST3h0d0s0QmhjVjJXamVzcHVBTm5ERDFzQWxFc1pIV2pm?=
 =?utf-8?B?TzJYUzdXSUlWWWxHZ053NG1LNlF2ZXZqNlBYeEJvSFRXeUFubG5GR1Y5SXNa?=
 =?utf-8?B?SGordFpRd3B2dFRsQ1FDVkk2VFp0eUh6dks4Y1FKVVZRQUpzZVY0bHZ4Rk1V?=
 =?utf-8?B?dHhRR2pyeFl5am9zeUZVOXJqRTZid01SUDlpQ1pkakIwMWFoY3hnYnRVWUJz?=
 =?utf-8?B?R0Q1bUdLTWVVQWdmb2FuVDVPMlNQYVlUcmt6OHZxL2lLVGw4U1IrY1FlZGtn?=
 =?utf-8?B?c0tUT0hUQndIYXhMc0pRUVJOWExZZlRkakhoUlNESStROXB4VlJ2VXNEdEFy?=
 =?utf-8?B?aWxkOFZzb3FRdkdsL0VEeVlsYkNmdUVDMVFLbkgyRk1sYmE2QVlLcUU0aHBS?=
 =?utf-8?B?MU5pZlVtR29PUEFEYWp2RzFNQllxamI1anp3ZG4yR05QaG5JMVhKVG9EYXIv?=
 =?utf-8?B?TEt3YThFa3h5bTBaVkJJcDVPSVRIb2dwUTNwUWExL25QMVZ6eGZHMXJNSmpn?=
 =?utf-8?B?V0plb0F5VGUzYURTemJaWXRwOW1MZGZ3UnBKVVphT3B5c1R1bWNKM2JxLzhF?=
 =?utf-8?B?c0lLOVJQaVFRc3I4eWpvenJINmt3aUNwdHU5YXlTZUpzNEZyMnptalNzSTgw?=
 =?utf-8?B?S2kwZEdieHI4aDcwTGV6dHpsOTFFcUZ1ekVRR09waFhJV0JIaTB4ZDBPUVd1?=
 =?utf-8?B?dDg1K3g5OFhOUTFiSEY2ZFdML2RpcTBwa3J0SXlveFk5UWcxV1RyNy8wenhH?=
 =?utf-8?Q?IT8MKXD8Bitpg2AZugBhfRuhhs+Mdl9uN7bo/cZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db6f2a7-ecb2-4f35-ae89-08d951144a8a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 15:36:24.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETcBSs/dCn4s4cJVX1LU47lzkB/KMxG4/7FsIODLi87iKdFIAgwM79FIWv994YxVAgkaDBi//VO4ovkMs9oYn4NTD7saHAlf9+FxI1aX1D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3432
X-OriginatorOrg: citrix.com

On 27/07/2021 15:36, luja wrote:
> Hi all,
>
> No, the correct behavior is to just use the host bridge as it is
> correct and works!

What evidence do you have of this claim?

Have you actually deleted the workaround, and confirmed that Xen works
fully and correctly on this hardware?=C2=A0 If not, that is your next task.

> Just the PCI config space is done wrongly in the board's BIOS?

These details are typically hard wired.

>
> To get the truth...
> I disassembled the cooler, cleaned the "phase change" wax from it,
> photographed the laser engraving of the flip chip die and compared
> the text with the errata "spec update" by Intel.
>
> According to the laser marking and the errata the chip is a 5520 with C2
> stepping. As it has an SLH3P marking on its die. I made a photo of it,
> which is available on request.
> The errata sheet refers it to C2 stepping and states it supports Intel
> Trusted Execution TXT. This is on page 11 (3rd line of table) of said
> intel errata.
> https://www.intel.com/content/dam/www/public/us/en/documents/specificatio=
n-updates/5520-and-5500-chipset-ioh-specification-update.pdf

I'm afraid that this doesn't prove anything.

Topmarking fraud sadly exists.=C2=A0=C2=A0 A famous example is the overcloc=
king
multiplier which used to be an external pin to chips, and no longer is
because the cheaper slower CPUs had their topmarkings forged and sold as
expensive faster ones.

~Andrew


