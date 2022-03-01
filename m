Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031254C8958
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281101.479286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOznd-0000St-Vx; Tue, 01 Mar 2022 10:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281101.479286; Tue, 01 Mar 2022 10:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOznd-0000Qf-So; Tue, 01 Mar 2022 10:32:09 +0000
Received: by outflank-mailman (input) for mailman id 281101;
 Tue, 01 Mar 2022 10:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOznc-0000QZ-CO
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:32:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7986752-994a-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 11:32:06 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-ZJ69LoXtNkiKWFRWjggTGQ-1; Tue, 01 Mar 2022 11:32:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4392.eurprd04.prod.outlook.com (2603:10a6:20b:1c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 10:32:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 10:32:03 +0000
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
X-Inumbo-ID: d7986752-994a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646130726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/S/93RDEUEGy29b4Zyofycj7JF6IGAg8eYAvK+Q9wc=;
	b=UVMUOgzzfdHt9RQt83AtBC4PX82Np6g7Po1T7SaxvhlC2If4G5LDrkv7medFnXmqLZ2Q+n
	ZbI8TWPUW2QnrOYswokzBKD4iBIuRJYq/eANu29mItsEGHnpLH6NaMLD1u3+ScBwVTgcwJ
	yjL/HAEJ2ModaRJ4jCye+GS+AQvnBgg=
X-MC-Unique: ZJ69LoXtNkiKWFRWjggTGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn3YfJHhAx1oDEkNFSuJk1Nr1AOYLJOWrrjBg3Ij8kA/IOuLUd1oiH/PFru+HVOLwKOjOkbZUxxuvP/JHcMSyLRJbdgIpbQF8+0gPSyV+b5oiLIAOZ7hLTzmr0RgBTpIPXYwnQbV1gi46hc2PWWLzysDU4uhK6uW9wEG/L/aY8gmK66hJuN4wuqGt9d3YlVVfd9iw059FjXJxHbhbZBQ+DAt7y4uTknr6hVHD8jKtT6FVjl5Z6B0TdzFf9ipmcxRIl83b0ly3auaPWAVT0icsE/rb+nzEopQqk5ifT+FGUkCIKjCj88Myw+2vpd3Aryl8kdTnHdZ2I+7h8FdiZMsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0OvDogMLwRZTzxH9oWXV+jlOPVXgRUiv4aYpjtRNDw=;
 b=YS1flxjD8g8P3FBlXIjdfpcYviR9pYOwtP/6MuWNFMdHGX7i1FiHskNMu8WhR8MW5J7mRCfRGVT3pdXTaqbdrG+f2h93MI5KKdsKkvoac4EUjzGSCQSKjT13WrfuQdw8njeIOguwC+hdEPK+tWE61Qqij7iY7aLpcPmVgHAKpgusX5RnX7BMFfnxMeOh1BqpN2UCsLMouJra3vil7VizcI/pHLC8GEXgwBK4kFL1Qp6gZ7FV8KUgzket9yhloLS+KGfYOJ/GcUAOZfxy7jkaTKJV22jt55o28p60jV10j4m18fgQPxoITlTpUIDAY5oEr3/+uZJSUjAz+lygaxIRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e5ad6bf-8c58-745b-dc32-c906a1928329@suse.com>
Date: Tue, 1 Mar 2022 11:32:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 2/2] vpci/msix: fix PBA accesses
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
 <20220226100554.2664-1-roger.pau@citrix.com>
 <8597cd20-4d79-0f5f-8370-d2353e7116f7@suse.com>
 <Yh3igzWQQO+Nvf3+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yh3igzWQQO+Nvf3+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:206:1::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e594b93e-e5f8-459f-6edc-08d9fb6eb9ef
X-MS-TrafficTypeDiagnostic: AM6PR04MB4392:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4392388D36678A8F3F7B6829B3029@AM6PR04MB4392.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d2FKaF8rjT8B51gLkVV8WEzqbXSdkhfCuy8O2pODdZAZsdEanIo2Dda+EVc6YWwZG0dUIuoI8tlw3oLkFzrnjzFwq60lGq1onmsNs2yeBxGbwEfz+1zJr0p4mdsjYmgxflcjjVSQcI/huGhoXESeVRn5NxtfCRMj5AG/I81MBxpT7hetvXvWX8I3q+qTkx6xS+4f5r6PRHJGcxcaiYmTrreAhEB2mfHT4J5ivwvqcbSbyrfqJ//P4JJThAjHw4MftrTq1Bnt4zz1a7ynrVa33dB2/6TOfpq0dLuLG8kwQiIhwW1ZQP6Dtn+LhaGpcID3dVXCa39PRlxIEIhwMyKS5Dsm1OzbZr4P/LnQsWOIjNuzbefNaxKrkHnl7HtM5BuxZ4JDYYWoKuxCO0q4WPN7bWjuDunPAPxgkpqGARupKSKeNtDichIxDLOmff2A+y+kE9Oc617qQ9Ew+pveaCI0uDoYeHZBMdFqExRzCH0muE/Ll13f0wStVkOjz0w7DUK7wJtoOw7OeEGY0erUNrkujkAmq3WMJWk67V8k6x7hvIR1nc7ifMb09/c1qwgWg1yCA3FzR9G3GwvPCsNazeglme+2Rf/tXf/nOclePPbNP+8ePmeJ0x4h3cMkkZbX1wzPbYHw2VgT7FUJS3pUGr1W+u/mSBJRDmHUKrV9xVcg6CbEXzEXsNSVFkfcBt7YLZTwwWyNlPRanj1Mn5lvI3r6C3uVuRM+dCL4PK9hJHP8Xzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(8676002)(4326008)(2616005)(2906002)(186003)(26005)(5660300002)(8936002)(31696002)(6916009)(31686004)(6506007)(6512007)(86362001)(6486002)(508600001)(53546011)(36756003)(66946007)(66476007)(66556008)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?II6u1SchmHKJ70xprGA2o+AcrtCG5eH5aOr/90QV02d/OlvCc1Foi94OQLx9?=
 =?us-ascii?Q?ojeDGWdS7pLpOVTEhKb+nG1QaR/POwwsOg6oBEMOa12CFQC2eCaLyg5Z8wNv?=
 =?us-ascii?Q?64khgCwgdSE9hW0+1ihaPRXb7YESL95uXM+IMIxPBph0j2+JnpiQu9IqkXeF?=
 =?us-ascii?Q?TbaB2JNATsdpZdcIML/sj3kbq6Rr16FfVB+uAOCRyYC/Ducae3KTdUbPlsgR?=
 =?us-ascii?Q?JZf1r7piSxAR+Cy8zS9blD0P2M2CrftClaEfJWlCVHwk/uNvq18isgDxiSrO?=
 =?us-ascii?Q?AGSF0Z/Kvs1cBWhHOEcgvnmswmC+jwHPB4gBSH9nbjvQvdVAcES6s3gQygWj?=
 =?us-ascii?Q?cA9TmWY7eQ/lfAmwD1EOQ1hLKmqpK2RnBwUcVIoPpkrXxq8aGO7CmS8UE/Ch?=
 =?us-ascii?Q?XMxMzqlLGI7aeU70mLjoo//kxZ0hr80QMdyFshlUCf27nfYsMdUc2vxTfWcN?=
 =?us-ascii?Q?IdI8ZEvtT/kSk/irEouVuNCbNyhm7y1OjH+W0ceUCwOm+hc4mdgDXLMzpnko?=
 =?us-ascii?Q?wgn0oSKnSUZYD8A06RhrWgDphmUUjChU/qWgmZ4I92b9f9U9SejKlccF1xMf?=
 =?us-ascii?Q?fFFGGnhaFw5t9xyau1/UUfLvX4k2dlUPduhGWgAkb1snkyZwKdz4H89uw10l?=
 =?us-ascii?Q?a/5ycd5E7cvDqabu3CAb+h9LBjaUVcIcmDChg3IzsLrYHw5fS2s29RxNz5NJ?=
 =?us-ascii?Q?X19C7TVwVmUxfH8lK/YPX4tYK0MQJG44wbu4J7rk2c8Hd9ivFFP9ci6cF4sz?=
 =?us-ascii?Q?V1IT6TA0SX139q6Ox0uwY+ZfpBsSL7BDU9Pwl7Wf3YbrDMmpCvgL8weet+lV?=
 =?us-ascii?Q?In2Yvx/J5ZTdfqPCdjhpBxEu6/NT5x6AlKXESlhBQ5/yEAnPnqhkx83VaqCn?=
 =?us-ascii?Q?WaKYZ20dTdjp6MfTnew+c6mjyDoLFkMVs9vEB8sLUflFCME7vuJyGw7xdGSP?=
 =?us-ascii?Q?Wjz7Iqr4gSfA3WMbs+4t+fP+56KRoHM/gdGvFYuMwphUrSAsZPjMF6tUeLmC?=
 =?us-ascii?Q?7+pAAveXg6thQ/2+Dnof/Q2WgJ/gBJhmn+m8wXdBW/oJAypWrvfKaiKyugE4?=
 =?us-ascii?Q?yGsxPlvqUl1SasC3frH/a5DDBXp42iEjjyZKVuU5FhU2+TjMmzrWJKGEk96n?=
 =?us-ascii?Q?bByt+Q77B26wYWbrTGqUz9uMK1y+Z/ZJ99NYGzZDXxNZLvjnHVZ5acrGz6FG?=
 =?us-ascii?Q?naaqTwtgk1+5SWQLKaWkzZgOsiqgjBjOPHIND4Vkv2UKLGxt+mNW22u9nUi1?=
 =?us-ascii?Q?3dYpKzR6LcmKGK2uqV4KqklUh8MJ49GCtoCOC9tt4HyXTUUbjo+04d7KvTRr?=
 =?us-ascii?Q?Xa4jxgQKNQpPlsZTJMXZ9y+cZja/TDFuMoL35s8gqHPLmd6n6WBrOEUdkY0R?=
 =?us-ascii?Q?rfEWvEm6ItHPrOGAhIRU+Lpxl/+MNopLcjexWYK8UkGH42E/VBWtmqVB1S6t?=
 =?us-ascii?Q?TPJNzZ14kj8RIGT1GbxFBPkwWUOIqw7FNqHg7e1DC1DXdacc7Lpa9aRsvjh5?=
 =?us-ascii?Q?mrPi53pE5HbTn1HE5T7+w4WZuxhpkodVGpe14Grz8IiXkYWpfbjTmy7+a6FR?=
 =?us-ascii?Q?g1vUknnS+nfz0cBmXA9+BQB5sh0vp7M468vpaTNFnLRSrsp9mgHgBRCBhonQ?=
 =?us-ascii?Q?SCgQIJLWd3F39hRd/oZiiIg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e594b93e-e5f8-459f-6edc-08d9fb6eb9ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 10:32:03.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDOUMM95qyyugQXKXjz16lEksp1br0hqjoQf/3+1C2wk16wadq8n5me6gl+ibBH/BM0zLOAzG/+7ogpi97O5nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4392

On 01.03.2022 10:08, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 01, 2022 at 09:46:13AM +0100, Jan Beulich wrote:
>> On 26.02.2022 11:05, Roger Pau Monne wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -198,8 +198,13 @@ static int cf_check msix_read(
>>>      if ( !access_allowed(msix->pdev, addr, len) )
>>>          return X86EMUL_OKAY;
>>> =20
>>> +    spin_lock(&msix->pdev->vpci->lock);
>>>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>>>      {
>>> +        struct vpci *vpci =3D msix->pdev->vpci;
>>> +        paddr_t base =3D vmsix_table_addr(vpci, VPCI_MSIX_PBA);
>>> +        unsigned int idx =3D addr - base;
>>> +
>>>          /*
>>>           * Access to PBA.
>>>           *
>>> @@ -207,25 +212,43 @@ static int cf_check msix_read(
>>>           * guest address space. If this changes the address will need =
to be
>>>           * translated.
>>>           */
>>> +
>>> +        if ( !msix->pba )
>>> +        {
>>> +            msix->pba =3D ioremap(base, vmsix_table_size(vpci, VPCI_MS=
IX_PBA));
>>> +            if ( !msix->pba )
>>> +            {
>>> +                /*
>>> +                 * If unable to map the PBA return all 1s (all pending=
): it's
>>> +                 * likely better to trigger spurious events than drop =
them.
>>> +                 */
>>> +                spin_unlock(&vpci->lock);
>>> +                gprintk(XENLOG_WARNING,
>>> +                        "%pp: unable to map MSI-X PBA, report all pend=
ing\n",
>>> +                        msix->pdev);
>>> +                return X86EMUL_OKAY;
>>
>> Hmm, this may report more set bits than there are vectors. Which is
>> probably fine, but the comment may want adjusting a little to make
>> clear this is understood and meant to be that way.
>=20
> Yes, it could return more bits than vectors, but that area is also
> part of the PBA (as the end is aligned to 8 bytes). I will adjust the
> comment.
>=20
>>> +           }
>>> +        }
>>
>> Imo it would make sense to limit the locked region to around just this
>> check-and-map logic. There's no need for ...
>>
>>>          switch ( len )
>>>          {
>>>          case 4:
>>> -            *data =3D readl(addr);
>>> +            *data =3D readl(msix->pba + idx);
>>>              break;
>>> =20
>>>          case 8:
>>> -            *data =3D readq(addr);
>>> +            *data =3D readq(msix->pba + idx);
>>>              break;
>>> =20
>>>          default:
>>>              ASSERT_UNREACHABLE();
>>>              break;
>>>          }
>>> +        spin_unlock(&vpci->lock);
>>
>> ... the actual access to happen under lock, as you remove the mapping
>> only when the device is being removed. I'm inclined to suggest making
>> a helper function, which does an unlocked check, then the ioremap(),
>> then takes the lock and re-checks whether the field's still NULL, and
>> either installs the mapping or (after unlocking) iounmap()s it.
>=20
> I'm fine with dropping the lock earlier, but I'm not sure there's much
> point in placing this in a separate helper, as it's the mapping of at
> most 2 pages (PBA is 2048 bytes in size, 64bit aligned).
>=20
> I guess you are suggesting this in preparation for adding support to
> access the non PBA area falling into the same page(s)?

Not just. The write path wants to use the same logic, and with it
becoming a little more involved I think it would be better to have it
in just one place.

Jan


