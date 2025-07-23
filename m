Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D7B0EE97
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 11:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053682.1422467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVwS-0005Qi-G4; Wed, 23 Jul 2025 09:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053682.1422467; Wed, 23 Jul 2025 09:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVwS-0005Of-DZ; Wed, 23 Jul 2025 09:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1053682;
 Wed, 23 Jul 2025 09:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueVwR-0005Nr-DN
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 09:39:15 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4a0e69c-67a8-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 11:39:13 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so3044903f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 02:39:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d582bsm9307777b3a.58.2025.07.23.02.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 02:39:12 -0700 (PDT)
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
X-Inumbo-ID: e4a0e69c-67a8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753263553; x=1753868353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2MqSITdkYuwmC2W1WvHINURX42cy/ssQClQOMzY2PFc=;
        b=Ew0MBVBlRkU46rUJ1dsP4DRISgd8li30b4efPZ/47gV0QSxdy7GrVirtPwUyjHRS7A
         Og2dPzNhbQ/MbP2Er/O609VnKkGr0BeiIQmCqRBTcsCgauBWQgzKWTS98CyW/1doWz9P
         Y/Q30CIBMhj/aeOOzh60cs7qP37G+mbh0WlRNCYEyahoENWhxK5Q0iI6mfSoBSItzzKU
         CvXQDw57oIjceY/c1WONp+6hU0i8oObRAkF+h5v6n6mr53U6jCcDRcUhOBGnRC7s6wKx
         ObZrsTUWu1eAgLnD/WopxjbNieSCwTPR3PIBFMs5xW5G1rkHWB4XG0To211jHyiUaG5l
         L5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753263553; x=1753868353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MqSITdkYuwmC2W1WvHINURX42cy/ssQClQOMzY2PFc=;
        b=iQh1ZgDf3g33HQBFJw/lyIdLNpJB/R5Gaca6PZlIBl55AnQ6tWxunRnptsiMPold+f
         oFcRbLFeqgC15metXV4heXwRhMh+aVDwBlEu1PigtfyOT3HCfJzDFH2CQksI726jypNm
         i3m7VCJRpq7HbORupmzbZ3+XnL2AM9WJNIDiDZsQOBwxIRDhndk33hK/EavsuCowq2Dn
         jn/jLR1jWMSjFtYUXPlewKW35a7y2FbR4pMIoMoz/znDAisBbXkXADOz6Cgy7x9amCll
         olqxmH+wcqcrNzZYFjeT0Z55PzOIQEU+UDlSFCcBDVd/0xwN2yz74g6oYxp+viD2nEyR
         HsGg==
X-Gm-Message-State: AOJu0YxJtE5ou680pFkv4YPV8+QM1Efsr3rFajbr9xpTCSjEECaIRhbI
	DQfxaVwvJ8FOG+AZGFUe/qb/kdI5dnJvAmLdn4JHjUwT+U6r4yLsizRfFbMw7xDtFw==
X-Gm-Gg: ASbGncvI2pJ3awV6UAibmdvDndOo/bFH/2MIXC/f6CMitWdJ7yWHa4tQgLdnG20Fi7S
	Ia89PNdmSZdYnOOcUdqGjpdvPJH+Q9KqNYQrrkAX3XXfK+GwmkywhL52/ByTaQBD5UZIJqQSrUB
	hTPjJp7BLOPFkPPZtbIcy6Ckq9nZdPmzzO5Mej36tVORPxSl2ZF5HiyxQdzhOKNVyVzhe6qM6g4
	Yi9XhTAjDZGlsORgus67B1oKHxwY7vO/jdU0rp596aXLUJ0ZoT2ONqG5oE6BkTb4KyiH56ovHox
	oWFJ/YtDzLTLWuW8nba24i8f6DjGPzmV9ii3xtOgYbAOJkZUlKURTm/SGl/mveOG+RdJksf84Fc
	xcF4f33bNLdR+JneCBU/E8cQ4MysUtq+zwmKu3ZxaEhKeUfiVVAanJDyQPwGLzlWSi8qwz1452d
	cVJ0gdXXw=
X-Google-Smtp-Source: AGHT+IG0Ih70fWg/w0Kv7NqapnYik41s6AVXq1VCpOp/ygY5EJLeDntGIkfE+4+9d/gD84m9/Rpk8g==
X-Received: by 2002:a05:6000:2c10:b0:3b3:bd27:f2b0 with SMTP id ffacd0b85a97d-3b768f044dfmr1604148f8f.43.1753263552948;
        Wed, 23 Jul 2025 02:39:12 -0700 (PDT)
Message-ID: <a9db3c2b-1cab-4d1b-bae4-6cb86f1b5587@suse.com>
Date: Wed, 23 Jul 2025 11:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi() fails
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-8-Jiqian.Chen@amd.com>
 <aH5pBWm0xhQR_-XN@macbook.local>
 <BL1PR12MB584972FF7B580E18DB2756BFE75FA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <BL1PR12MB584972FF7B580E18DB2756BFE75FA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 09:54, Chen, Jiqian wrote:
> On 2025/7/22 00:21, Roger Pau Monné wrote:
>> On Fri, Jul 04, 2025 at 03:08:02PM +0800, Jiqian Chen wrote:
>>> When init_msi() fails, current logic return fail and free MSI-related
>>> resources in vpci_deassign_device(). But the previous new changes will
>>> hide MSI capability and return success, it can't reach
>>> vpci_deassign_device() to remove resources if hiding success, so those
>>> resources must be removed in cleanup function of MSI.
>>>
>>> To do that, implement cleanup function for MSI.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>> cc: "Roger Pau Monné" <roger.pau@citrix.com>
>>> ---
>>> v6->v7 changes:
>>> * Change the pointer parameter of cleanup_msi() to be const.
>>> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>>>   directly, instead try to free msi and re-add ctrl handler.
>>> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>>>   init_msi() since we need that every handler realize that msi is NULL
>>>   when msi is free but handlers are still in there.
>>>
>>> v5->v6 changes:
>>> No.
>>>
>>> v4->v5 changes:
>>> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
>>>   since cleanup hook is changed to be int.
>>> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
>>>
>>> v3->v4 changes:
>>> * Change function name from fini_msi() to cleanup_msi().
>>> * Remove unnecessary comment.
>>> * Change to use XFREE to free vpci->msi.
>>>
>>> v2->v3 changes:
>>> * Remove all fail path, and use fini_msi() hook instead.
>>> * Change the method to calculating the size of msi registers.
>>>
>>> v1->v2 changes:
>>> * Added a new function fini_msi to free all MSI resources instead of using an array
>>>   to record registered registers.
>>>
>>> Best regards,
>>> Jiqian Chen.
>>> ---
>>>  xen/drivers/vpci/msi.c | 111 ++++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 94 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>>> index c3eba4e14870..09b91a685df5 100644
>>> --- a/xen/drivers/vpci/msi.c
>>> +++ b/xen/drivers/vpci/msi.c
>>> @@ -25,7 +25,11 @@
>>>  static uint32_t cf_check control_read(
>>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>>  {
>>> -    const struct vpci_msi *msi = data;
>>> +    const struct vpci *vpci = data;
>>> +    const struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return pci_conf_read16(pdev->sbdf, reg);
>>>  
>>>      return MASK_INSR(fls(pdev->msi_maxvec) - 1, PCI_MSI_FLAGS_QMASK) |
>>>             MASK_INSR(fls(msi->vectors) - 1, PCI_MSI_FLAGS_QSIZE) |
>>> @@ -37,12 +41,16 @@ static uint32_t cf_check control_read(
>>>  static void cf_check control_write(
>>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>  {
>>> -    struct vpci_msi *msi = data;
>>> +    struct vpci *vpci = data;
>>> +    struct vpci_msi *msi = vpci->msi;
>>>      unsigned int vectors = min_t(uint8_t,
>>>                                   1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
>>>                                   pdev->msi_maxvec);
>>>      bool new_enabled = val & PCI_MSI_FLAGS_ENABLE;
>>>  
>>> +    if ( !msi )
>>> +        return;
>>> +
>>>      /*
>>>       * No change if the enable field and the number of vectors is
>>>       * the same or the device is not enabled, in which case the
>>> @@ -101,7 +109,11 @@ static void update_msi(const struct pci_dev *pdev, struct vpci_msi *msi)
>>>  static uint32_t cf_check address_read(
>>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>>  {
>>> -    const struct vpci_msi *msi = data;
>>> +    const struct vpci *vpci = data;
>>> +    const struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return ~(uint32_t)0;
>>>  
>>>      return msi->address;
>>>  }
>>> @@ -109,7 +121,11 @@ static uint32_t cf_check address_read(
>>>  static void cf_check address_write(
>>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>  {
>>> -    struct vpci_msi *msi = data;
>>> +    struct vpci *vpci = data;
>>> +    struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return;
>>>  
>>>      /* Clear low part. */
>>>      msi->address &= ~0xffffffffULL;
>>> @@ -122,7 +138,11 @@ static void cf_check address_write(
>>>  static uint32_t cf_check address_hi_read(
>>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>>  {
>>> -    const struct vpci_msi *msi = data;
>>> +    const struct vpci *vpci = data;
>>> +    const struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return ~(uint32_t)0;
>>>  
>>>      return msi->address >> 32;
>>>  }
>>> @@ -130,7 +150,11 @@ static uint32_t cf_check address_hi_read(
>>>  static void cf_check address_hi_write(
>>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>  {
>>> -    struct vpci_msi *msi = data;
>>> +    struct vpci *vpci = data;
>>> +    struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return;
>>>  
>>>      /* Clear and update high part. */
>>>      msi->address  = (uint32_t)msi->address;
>>> @@ -143,7 +167,11 @@ static void cf_check address_hi_write(
>>>  static uint32_t cf_check data_read(
>>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>>  {
>>> -    const struct vpci_msi *msi = data;
>>> +    const struct vpci *vpci = data;
>>> +    const struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return ~(uint32_t)0;
>>>  
>>>      return msi->data;
>>>  }
>>> @@ -151,7 +179,11 @@ static uint32_t cf_check data_read(
>>>  static void cf_check data_write(
>>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>  {
>>> -    struct vpci_msi *msi = data;
>>> +    struct vpci *vpci = data;
>>> +    struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return;
>>>  
>>>      msi->data = val;
>>>  
>>> @@ -162,7 +194,11 @@ static void cf_check data_write(
>>>  static uint32_t cf_check mask_read(
>>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>>  {
>>> -    const struct vpci_msi *msi = data;
>>> +    const struct vpci *vpci = data;
>>> +    const struct vpci_msi *msi = vpci->msi;
>>> +
>>> +    if ( !msi )
>>> +        return ~(uint32_t)0;
>>>  
>>>      return msi->mask;
>>>  }
>>> @@ -170,9 +206,14 @@ static uint32_t cf_check mask_read(
>>>  static void cf_check mask_write(
>>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>  {
>>> -    struct vpci_msi *msi = data;
>>> -    uint32_t dmask = msi->mask ^ val;
>>> +    struct vpci *vpci = data;
>>> +    struct vpci_msi *msi = vpci->msi;
>>> +    uint32_t dmask;
>>> +
>>> +    if ( !msi )
>>> +        return;
>>>  
>>> +    dmask = msi->mask ^ val;
>>>      if ( !dmask )
>>>          return;
>>>  
>>> @@ -193,6 +234,42 @@ static void cf_check mask_write(
>>>      msi->mask = val;
>>>  }
>>>  
>>> +static int cf_check cleanup_msi(const struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +    unsigned int end;
>>> +    struct vpci *vpci = pdev->vpci;
>>> +    const unsigned int msi_pos = pdev->msi_pos;
>>> +    const unsigned int ctrl = msi_control_reg(msi_pos);
>>> +
>>> +    if ( !msi_pos || !vpci->msi )
>>> +        return 0;
>>> +
>>> +    if ( vpci->msi->masking )
>>> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
>>> +    else
>>> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
>>> +
>>> +    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
>>> +    if ( rc )
>>> +        printk(XENLOG_WARNING "%pd %pp: fail to remove MSI handlers rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>
>> I think you could possibly do this as:
>>
>> if ( rc )
>> {
>>     printk(...);
>>     ASSERT_UNREACHABLE();
>>     return rc;
>> }
>>
>> Given the code in vpci_remove_registers() an error in the removal of
>> registers would likely imply memory corruption, at which point it's
>> best to fully disable the device.  That would allow you having to
>> modify all the handlers to pass vpci instead of msi structs.
>>
>> That will avoid a lot of the extra code churn of having to change the
>> handler parameters.
> OK, got it.
> Since Jan proposed this consideration in v6, I need to ask for his opinion.
> Hi Jan, do you fine with this change?

If that's what Roger prefers, so be it. (Imo if we suspected memory
corruption, we'd better halt the system. I agree though that in
practice vpci_remove_registers() shouldn't fail here.)

Jan

